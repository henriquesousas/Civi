import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_features/map/presentation/widget/incident_modal_own_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../old_core/ui/widgets/app_bar/ui_app_bar.dart';
import '../../../../feature/incidents/report/widgets/register/incident_detail.dart';
import '../../../../feature/incidents/report/widgets/register/incident_header.dart';
import '../../../../feature/incidents/report/widgets/register/incident_info.dart';
import '../data.dart';

class IncidentModal extends StatelessWidget {
  const IncidentModal({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UIAppBar(
            title: "Roubo a veículo",
            centerTitle: true,
            textStyle: context.appTextStyles.appBarTitle.copyWith(
              fontWeight: FontWeight.w600,
            ),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              spacing: 5,
              children: [
                // IncidentHeader(incident: fakeIncidents[0]),
                // IncidentInfo(
                //   howTo: fakeIncidents[0].howTo ?? 'Nao informado',
                //   imageUrl: fakeIncidents[0].product.image?.value ?? '',
                // ),
                IncidentDetail(
                  plateNumber: "DND0172",
                  occurredOn: DateTime.now(),
                  createdAt: DateTime.now(),
                ),
                const IncidentModalOwnSection(),
              ],
            ),
          ),
          SizedBox(height: Dimens.size40.h),
        ],
      ),
    );
  }
}
