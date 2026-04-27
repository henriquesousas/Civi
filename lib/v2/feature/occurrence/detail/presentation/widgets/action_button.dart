import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/widgets/buttons/ui_button_icon.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  const ActionButton({super.key, required this.text, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return UIButtonIcon(
      tap: () {},
      title: text,
      textStyle: context.appText.button.copyWith(
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      buttonStyle: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(
          color: context.themeColor.secundaryBgColor,
        ),
        backgroundColor: context.themeColor.secundaryBgColorHight,
        padding: const EdgeInsets.symmetric(vertical: 13),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
      ),
      icon: Icon(iconData),
    );
  }
}
