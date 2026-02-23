import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncidentProtocol extends StatelessWidget {
  final String protocolNumber;
  const IncidentProtocol({super.key, required this.protocolNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            Icons.fingerprint_outlined,
            size: 14.sp,
            color: AppColors.textSecondary,
          ),
          SizedBox(width: 4.w),
          Text(
            "Protocolo: $protocolNumber",
            style: context.appText.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
