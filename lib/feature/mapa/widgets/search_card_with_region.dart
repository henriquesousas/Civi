import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/styles/app_text_style.dart';
import 'package:deehelp/old_core/ui/widgets/icon/export_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchCardWithRegion extends StatelessWidget {
  const SearchCardWithRegion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      // width: context.screenWidth * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.14),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          HighlightIcon(
            containerSize: IconContainerSizes.md,
            bgColor: AppColors.grey.withValues(alpha: 0.08),
            icon: const Icon(Icons.search, color: AppColors.grey),
          ),

          const SizedBox(width: 10),

          /// divider
          Container(
            width: 1,
            height: 22,
            color: Colors.grey.withValues(alpha: 0.25),
          ),

          const SizedBox(width: 10),

          Flexible(
            flex: 1,
            child: Text(
              "Osasco - SP",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: context.appTextOld.bodymd.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
