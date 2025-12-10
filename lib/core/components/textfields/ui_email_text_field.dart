import 'package:deehelp/core/components/textfields/ui_primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../ui/localization/resources.dart';
import '../../theme/app_colors.dart';

class UIEmailTextField extends StatelessWidget {
  final String? errorText;
  final ValueChanged<String>? onChanged;
  const UIEmailTextField({super.key, this.errorText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final colorIcon = errorText == null
        ? Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha: 0.3)
        : AppColors.errorColor;

    return UIPrimaryTextField(
      labelText: "Email",
      errorText: errorText,
      onChanged: onChanged,
      prefixIcon: Padding(
        // padding: const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: SvgPicture.asset(
          R.images.svgEmail,
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
