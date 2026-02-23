import 'package:deehelp/old_core/base/base_page.dart';
import 'package:deehelp/old_core/providers/old_current_location_provider.dart';
import 'package:deehelp/old_core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_features/dashboard/presentation/dashboard_viewmode_provider.dart';
import 'package:deehelp/old_features/dashboard/presentation/widget/dashboad_incidents_warning.dart';
import 'package:deehelp/old_features/dashboard/presentation/widget/dashboard_incident_list.dart';
import 'package:deehelp/old_features/dashboard/presentation/widget/dashboard_location.dart';
import 'package:deehelp/old_features/dashboard/presentation/widget/dashboard_profile.dart';
import 'package:deehelp/old_features/dashboard/presentation/widget/dashboard_search_container.dart';
import 'package:deehelp/old_features/dashboard/presentation/widget/dashbord_quick_actions_card.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashsboardPage extends BasePage {
  const DashsboardPage({super.key});

  @override
  ConsumerState<DashsboardPage> createState() => _DashsboardPageState();
}

class _DashsboardPageState extends BasePageState<DashsboardPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final currenLocation = ref.read(oldCurrentLocationProvider);
        ref
            .read(dashboardViewmodelProvider.notifier)
            .getRecentIncidents(currenLocation);
      },
    );

    super.initState();
  }

  @override
  bool hideAppBar() => true;

  @override
  EdgeInsetsGeometry? padding() => EdgeInsets.zero;

  @override
  Widget buildPage(BuildContext context) {
    final state = ref.watch(dashboardViewmodelProvider);

    return Column(
      children: [
        SizedBox(height: context.topPadding),
        const Row(
          spacing: 5,
          children: [
            SizedBox(width: 10),
            DashboardProfile(),
            DashboardLocation(),
          ],
        ),
        SizedBox(height: context.topPadding),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '[LABEL]',
                style: context.appTextStyles.sectionTitle.copyWith(
                  fontSize: Dimens.size26.sp,
                  fontWeight: FontWeight.w600,
                  // fontFamily: "MuseoModerno",
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              // Image.asset(
              //   "assets/images/neibor1.png",
              //   width: 160,
              //   height: 160,
              //   fit: BoxFit.cover,
              // ),
              SizedBox(height: Dimens.size10.h),
              const DashboardSearchContainer()
            ],
          ),
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
        const SizedBox(height: 10),
        Visibility(
          visible: context.isPortrait,
          child: const DashbordQuickActionsCard(),
        ),
        const SizedBox(height: 5),
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
                    padding: EdgeInsets.symmetric(horizontal: Dimens.size15.w),
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
