import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/features/incident/domain/entity/incident_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncidentLocation extends StatelessWidget {
  final IncidentLocal? local;
  const IncidentLocation({super.key, this.local});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Icon(
          Icons.location_on_outlined,
          size: Dimens.size12.sp,
          color: AppColors.textSecondary,
        ),
        Expanded(
          child: Text(
            _getLocation(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.appTextStyles.caption1Style.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }

  String _getLocation() {
    if (local?.city?.isEmpty == true && local?.state?.isEmpty == true) {
      return "Local não informado.";
    }

    return "${local?.city} - ${local?.state}";
  }
}
