import 'package:deehelp/core/base/base_page.dart';
import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/providers/location_event_provider.dart';
import 'package:deehelp/core/providers/location_notifier_provider.dart';
import 'package:deehelp/core/services/location/events/location_service_event.dart';
import 'package:deehelp/core/services/location/location_service.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/bottom_sheet/custom_modal_bottom_sheet.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/features/dashboard/presentation/dashboard_viewmode_provider.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashboad_incidents_warning.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashboard_incident_list.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashboard_location.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashboard_profile.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashboard_search_container.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashbord_quick_actions_card.dart';
import 'package:deehelp/features/dashboard/presentation/widget/request_location_modal.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class DashsboardPage extends BasePage {
  const DashsboardPage({super.key});

  @override
  ConsumerState<DashsboardPage> createState() => _DashsboardPageState();
}

class _DashsboardPageState extends BasePageState<DashsboardPage>
    with WidgetsBindingObserver {
  late final AppLifecycleListener _listener;
  bool _waitingForSettings = false;
  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onResume: () async {
        if (_waitingForSettings) {
          _waitingForSettings = false;
          var status = await Permission.location.status;
          if (status.isGranted) {
            ref.read(locationNotifierProvider.notifier).getCurrentLocation();
          }
        }
      },
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  bool hideAppBar() => true;

  @override
  void listener() {
    ref.listen(
      locationServiceEventProvider,
      (oldEvent, event) {
        if (event == null) return;
        if (oldEvent != null && oldEvent == event) return;
        event.maybeMap(
          error: (value) {
            if (context.canPop()) context.pop();
            customModalBottomSheet(
              isDismissible: true,
              context,
              child: PopScope(
                canPop: true,
                child: () {
                  switch (value.status) {
                    case LocationStatus.serviceDisabled:
                      return RequestLocationModal(
                        message: value.message,
                        title: "GPS desligado",
                        buttonTitle: "Tentar novamente",
                        press: () => ref
                            .read(locationNotifierProvider.notifier)
                            .getCurrentLocation(),
                      );
                    case LocationStatus.permissionDeniedForever ||
                          LocationStatus.permissionDenied:
                      return RequestLocationModal(
                        message: value.message,
                        title: "Ative a localização",
                        buttonTitle: "Abrir configurações",
                        press: () {
                          _waitingForSettings = true;
                          ref
                              .read(locationNotifierProvider.notifier)
                              .openNativePermissionSettings();
                        },
                      );
                    default:
                      return const Text("Status desconhecido");
                  }
                }(),
              ),
            );
          },
          success: (value) {
            _waitingForSettings = false;
            if (context.canPop()) context.pop();
            ref
                .read(dashboardViewmodelProvider.notifier)
                .loadData(value.currentPlace!.state!);
          },
          orElse: () => null,
        );
      },
    );
    super.listener();
  }

  @override
  Widget buildPage(BuildContext context) {
    ref.watch(dashboardViewmodelProvider.notifier);
    final state = ref.watch(dashboardViewmodelProvider);
    return Column(
      children: [
        SizedBox(height: context.topPadding),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            spacing: 5,
            children: [
              DashboardProfile(),
              DashboardLocation(),
            ],
          ),
        ),
        SizedBox(height: context.topPadding),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'RASTRO',
              style: context.appTextStyles.sectionTitle.copyWith(
                fontSize: Dimens.size26.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Dimens.size20.h),
            const DashboardSearchContainer()
          ],
        ),
        SizedBox(height: Dimens.size15.h),
        state.maybeMap(
          data: (data) => _buildContent(data.value),
          orElse: () => const Expanded(child: DashboadIncidentsWarning()),
        ),
        const DashbordQuickActionsCard(),
      ],
    );
  }

  Widget _buildContent(List<IncidentOutput> items) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (items.isEmpty)
            const Expanded(child: DashboadIncidentsWarning())
          else
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Últimas ocorrências",
                      style: context.appTextStyles.caption1Style,
                    ),
                  ),
                  DashboardIncidentList(items: items),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
