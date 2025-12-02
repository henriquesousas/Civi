import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/resources.dart';

class UIGoogleButton extends StatelessWidget {
  final VoidCallback? press;
  final double? width;
  final Color? bgColor;

  const UIGoogleButton({
    super.key,
    this.press,
    this.width,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.screenWidth,
      child: OutlinedButton(
        onPressed: press,
        style: outlinedButtonTheme(
          borderColor: bgColor ?? AppColors.blackColor10,
          bgColor: bgColor,
        ).style,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              R.images.svgGoogleIcon,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 8),
            Text(R.strings.enterWithGoogle),
          ],
        ),
      ),
    );
  }
}
