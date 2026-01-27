import 'package:deehelp/core/base/base_page.dart';
import 'package:deehelp/core/providers/location_event_provider.dart';
import 'package:deehelp/core/providers/location_notifier_provider.dart';
import 'package:deehelp/core/services/location/current_location.dart';
import 'package:deehelp/core/services/location/events/location_service_event.dart';
import 'package:deehelp/core/services/location/location_failure.dart';
import 'package:deehelp/core/services/location/location_service.dart';
import 'package:deehelp/core/services/location/state/location_state.dart';
import 'package:deehelp/core/ui/extensions/dialog_extension.dart';
import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/router/app_router.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/bottom_sheet/custom_modal_bottom_sheet.dart';
import 'package:deehelp/core/ui/widgets/loader/loading.dart';
import 'package:deehelp/features/dashboard/presentation/dashboard_viewmode_provider.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashboad_incidents_warning.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashboard_incident_list.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashboard_location.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashboard_profile.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashboard_search_container.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashbord_quick_actions_card.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashsboardPage extends BasePage {
  const DashsboardPage({super.key});

  @override
  ConsumerState<DashsboardPage> createState() => _DashsboardPageState();
}

//with WidgetsBindingObserver
class _DashsboardPageState extends BasePageState<DashsboardPage> {
  // late final AppLifecycleListener _listener;
  // bool _waitingForSettings = false;
  // final ScrollController _scrollController = ScrollController();

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback(
  //     (_) {
  //       // _checkLocationOnEntry();
  //       // ref.watch(locationNotifierProvider);
  //       // if (currentState.isLoading) {
  //       //   Loading.instance()
  //       //       .show(context: context, text: "Obtendo localização...");
  //       // }
  //     },
  //   );

  //   super.initState();
  // }

  // void _setupErrorListener() {
  //   // ref.listen<AsyncValue<CurrentLocation?>>(
  //   //   locationNotifierProvider,
  //   //   (previous, current) {
  //   //     current.when(
  //   //       error: (error, stackTrace) {
  //   //         // Loading.instance().hide();
  //   //         if (context.canPop()) {
  //   //           context.pop();
  //   //         }

  //   //         if (error is LocationFailure) {
  //   //           customModalBottomSheet(
  //   //             context,
  //   //             child: PopScope(
  //   //               canPop: true,
  //   //               child: () {
  //   //                 switch ((error).status) {
  //   //                   case LocationStatus.serviceDisabled:
  //   //                     return RequestLocationModal(
  //   //                       message: error.message,
  //   //                       title: "GPS desligado",
  //   //                       buttonTitle: "Tentar novamente",
  //   //                       press: () async {
  //   //                         ref
  //   //                             .read(locationNotifierProvider.notifier)
  //   //                             .getCurrentLocation();
  //   //                       },
  //   //                     );
  //   //                   case LocationStatus.permissionDeniedForever ||
  //   //                         LocationStatus.permissionDenied:
  //   //                     return RequestLocationModal(
  //   //                       message: error.message,
  //   //                       title: "Ative a localização",
  //   //                       buttonTitle: "Abrir configurações",
  //   //                       press: () {
  //   //                         // _waitingForSettings = true;
  //   //                         ref
  //   //                             .read(locationNotifierProvider.notifier)
  //   //                             .openNativePermissionSettings();
  //   //                       },
  //   //                     );
  //   //                   default:
  //   //                     return const Text("Status desconhecido");
  //   //                 }
  //   //               }(),
  //   //             ),
  //   //           );
  //   //         }
  //   //       },
  //   //       data: (data) {
  //   //         if (context.canPop()) context.pop();
  //   //         ref
  //   //             .read(dashboardViewmodelProvider.notifier)
  //   //             .getRecentIncidents(data);
  //   //       },
  //   //       loading: () => null,
  //   //     );
  //   //   },
  //   // );
  // }

  // void _checkLocationOnEntry() async {
  //   final locationState = ref.read(locationNotifierProvider);

  //   locationState.when(
  //     granted: () {
  //       // Tudo OK, pode continuar
  //     },
  //     denied: (status, message) {
  //       context.push(AppRouter.locationRequired);
  //     },
  //     initial: () {
  //       // ref.read(locationNotifierProvider.notifier).checkLocationStatus();
  //     },
  //     loading: () {},
  //     checking: () {
  //       // Aguarda
  //     },
  //   );
  // }

  // @override
  // void dispose() {
  //   _listener.dispose();
  //   // _scrollController.dispose();
  //   super.dispose();
  // }

  @override
  bool hideAppBar() => true;

  @override
  void listener() {
    // _setupErrorListener();

    // ref.listen(
    //   locationServiceEventProvider,
    //   (previous, next) {
    //     if (next == null) return;

    //     next.when(
    //       error: (status, message) {},
    //       locationRequired: (status, message) =>
    //           context.push(AppRouter.locationRequired),
    //       success: (currentPlace) {},
    //     );

    //     // next.when(
    //     //   initial: () {},
    //     //   loading: () {},
    //     //   checking: () => null,
    //     //   granted: () {},
    //     //   denied: (status, message) {
    //     //     context.push(AppRouter.locationRequired);
    //     //   },
    //     // );
    //   },
    // );

    super.listener();
  }

  @override
  Widget buildPage(BuildContext context) {
    // ref.watch(locationNotifierProvider.notifier).checkLocationStatus();
    final state = ref.watch(dashboardViewmodelProvider);

    return Column(
      children: [
        SizedBox(height: context.topPadding),
        const Row(
          spacing: 5,
          children: [
            DashboardProfile(),
            // DashboardLocation(),
          ],
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
          loading: (loading) => Expanded(
            child: Center(
              child: SizedBox(
                width: Dimens.size20.w,
                height: Dimens.size20.h,
                child: const CircularProgressIndicator(
                  color: AppColors.primaryColor,
                  strokeWidth: 1.5,
                ),
              ),
            ),
          ),
          orElse: () => const Expanded(child: DashboadIncidentsWarning()),
        ),
        Visibility(
          visible: context.isPortrait,
          child: const DashbordQuickActionsCard(),
        ),
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
