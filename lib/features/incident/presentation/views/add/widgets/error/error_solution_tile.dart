import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorSolutionTile extends StatelessWidget {
  final String text;
  const ErrorSolutionTile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.chevron_right,
            color: Colors.white.withValues(alpha: 0.6),
            size: Dimens.size16.w,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              text,
              style: context.appTextStyles.sectionSubTitle1.copyWith(
                height: 1.4,
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
