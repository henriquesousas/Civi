import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncidentHowTo extends StatelessWidget {
  final String? howTo;

  const IncidentHowTo({
    super.key,
    this.howTo,
  });

  @override
  Widget build(BuildContext context) {
    if (howTo == null || howTo!.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        // color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.06),
        color: Colors.grey.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            CupertinoIcons.info_circle_fill,
            size: IconSizes.xxs,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              howTo!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.appTextOld.caption,
            ),
          ),
        ],
      ),
    );
  }
}
