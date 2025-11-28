import 'package:deehelp/core/components/textfields/ui_primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/resources.dart';
import '../../theme/app_colors.dart';

class UIPasswordTextField extends StatelessWidget {
  final String? errorText;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  const UIPasswordTextField(
      {super.key, this.errorText, this.obscureText = true, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final colorIcon = errorText == null
        ? Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha: 0.3)
        : AppColors.errorColor;

    final suffixIcon =
        obscureText ? R.images.svgVisibilityOff : R.images.svgVisibility;

    return UIPrimaryTextField(
      labelText: R.strings.password,
      errorText: errorText,
      obscureText: obscureText,
      onChanged: onChanged,
      prefixIcon: Padding(
        // padding: const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: SvgPicture.asset(
          R.images.svgLock,
          height: 24,
          width: 24,
          colorFilter: ColorFilter.mode(
            colorIcon,
            BlendMode.srcIn,
          ),
        ),
      ),
      suffixIcon: Padding(
        // padding: const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: SvgPicture.asset(
          suffixIcon,
          height: 24,
          width: 24,
          colorFilter: ColorFilter.mode(
            colorIcon,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
