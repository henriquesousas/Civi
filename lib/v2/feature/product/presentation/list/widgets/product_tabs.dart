import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTabs extends StatelessWidget {
  const ProductTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: TabBar(
        isScrollable: false,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            color: Colors.white,
            width: 3,
          ),
          // insets: EdgeInsets.symmetric(horizontal: 18),
        ),
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        labelStyle: context.appText.subtitle.copyWith(
          fontWeight: FontWeight.w800,
        ),
        unselectedLabelStyle: context.appText.subtitle,
        tabs: const [
          Tab(text: 'APROVADOS'),
          Tab(text: 'PENDENTES'),
          Tab(text: 'CANCELADOS'),
        ],
      ),
    );
  }
}
