import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

//TODOÇ renomear para UIICon
class UIIconCard extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final Color? bgColor;
  final Icon icon;
  final Border? border;
  const UIIconCard({
    super.key,
    required this.icon,
    this.radius,
    this.width,
    this.height,
    this.bgColor,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? SizeContainer.x,
      height: height ?? SizeContainer.x,
      decoration: BoxDecoration(
        color: bgColor ?? context.themeColor.secundaryBgColorHight,
        borderRadius: BorderRadius.circular(radius ?? SizeRadius.xxs),
        border: border,
      ),
      child: icon,
    );
  }
}
