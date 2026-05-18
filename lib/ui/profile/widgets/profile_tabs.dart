import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final _tabs = [
  "Posts",
  "Comentários",
  "Mídia",
  "Conquistas",
];

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: SizeLayoutSpacing.l),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final selected = index == 3;

          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: SizeLayoutSpacing.m,
            ),
            decoration: BoxDecoration(
              color: selected ? AppColor.primaryColor : const Color(0xFF181C23),
              borderRadius: BorderRadius.circular(SizeRadius.xs),
            ),
            alignment: Alignment.center,
            child: Text(
              _tabs[index],
              style: TextStyle(
                color: selected ? Colors.white : Colors.white60,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemCount: _tabs.length,
      ),
    );
  }
}
