import 'package:deehelp/old_core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_core/ui/widgets/icon/ui_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuickActionItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback onTap;
  final Color color;
  const QuickActionItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.color = AppColors.whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          HapticFeedback.lightImpact();
          onTap();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.size10.w,
            vertical: Dimens.size10.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UIICon(
                bgColor: color,
                icon: icon,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.appTextStyles.sectionTitle3.copyWith(
                  // color: AppColors.dark,
                  color: Theme.of(context).colorScheme.surfaceDim,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
