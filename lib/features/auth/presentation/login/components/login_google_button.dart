import 'package:deehelp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/resources/resources.dart';

class LoginGoogleButton extends StatelessWidget {
  final VoidCallback onPressed;
  const LoginGoogleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textTertiary,
        backgroundColor: Colors.white,
        side: const BorderSide(color: AppColors.greyColor),
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            R.images.svgGoogleIcon,
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 8),
          Text(
            R.strings.enterWithGoogle,
            // style: context.textSmallRegular,
          ),
        ],
      ),
    );
  }
}
