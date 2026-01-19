import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/features/dashboard/presentation/dashboard_viewmode_provider.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashboad_incidents_warning.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashboard_incident_list.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashboard_location.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashboard_profile.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashboard_search_container.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashbord_quick_actions_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final items = [
  "CG 150 titan vermelha",
  "Honda fit 2008 prata",
  "Citroen C3 Tendance branco 2007",
  "Hornet preta 2007",
  "Onix lt cinza 2007"
];

class DashsboardPage extends ConsumerStatefulWidget {
  const DashsboardPage({super.key});

  @override
  ConsumerState<DashsboardPage> createState() => _DashsboardPageState();
}

class _DashsboardPageState extends ConsumerState<DashsboardPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dashboardViewmodelProvider);
    final viewModel = ref.watch(dashboardViewmodelProvider.notifier);

    return UICustomScaffold(
      hideAppBar: true,
      body: Column(
        children: [
          SizedBox(height: context.topPadding),
          const Row(
            spacing: 5,
            children: [
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
                  style: context.appTextStyles.sectionTitle
                      .copyWith(fontSize: 22.sp),
                ),
                SizedBox(height: 20.h),
                const DashboardSearchContainer()
              ],
            ),
          ),
          SizedBox(height: Dimens.size10.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (items.isEmpty)
                  const Expanded(child: DashboadIncidentsWarning())
                else
                  Expanded(
                    child: DashboardIncidentList(
                      items: items,
                    ),
                  ),
                SizedBox(height: Dimens.size10.h),
                const DashbordQuickActionsCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
