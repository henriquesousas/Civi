import 'package:flutter/material.dart';

import '../widgets/buttons/ui_elevated_button.dart';
import 'dimens_test.dart';

class AppMainSubmitButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final bool isActive;
  final bool isLoading;

  const AppMainSubmitButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isActive = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: UIElevatedButton(
        key: ValueKey<bool>(isActive),
        height: 50,
        radius: DimensTest.largeRadius,
        bgColor: isActive
            ? Color(0xFF2B5BEE)
            : Color(0xFFF8FAFC), //MyColor.getScreenBgColor(),
        textColor: isActive
            ? Color(0xFFFFFFFF)
            : Color(0xFF2B5BEE), //MyColor.getPrimaryColor(),
        borderColor: isActive ? Colors.transparent : Color(0xFF2B5BEE),
        text: text,
        onTap: onTap, // Disable onTap when loading
        isLoading: isLoading,
      ),
    );
  }
}
