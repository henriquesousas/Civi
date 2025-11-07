import 'package:deehelp/app/theme/app_colors_v2.dart';
import 'package:deehelp/app/theme/size_config.dart';
import 'package:flutter/material.dart';

class UIDot extends StatelessWidget {
  final int currentPage;
  final int index;

  const UIDot({
    super.key,
    required this.currentPage,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = currentPage == index;

    return Container(
      margin: const EdgeInsets.only(right: SizeConfig.margin5),
      height: isActive ? SizeConfig.height04 : SizeConfig.height04,
      width: isActive ? SizeConfig.width18 : SizeConfig.width18,
      decoration: BoxDecoration(
        color: currentPage == index
            ? AppColorsV2.primaryColor
            : AppColorsV2.dotIndicatorColor,
        borderRadius: BorderRadius.circular(SizeConfig.borderRadius39),
      ),
    );
  }
}
