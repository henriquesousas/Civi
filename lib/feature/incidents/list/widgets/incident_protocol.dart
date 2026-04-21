import 'package:deehelp/core/theme/size/icon_size.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
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
            size: IconSizes.xs,
            // color: AppColors.textSecondary,
          ),
          SizedBox(width: 4.w),
          Text(
            "Protocolo: $protocolNumber",
            style: context.appTextOld.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
