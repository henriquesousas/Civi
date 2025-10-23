import 'package:flutter/material.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

import '../../../../../app/theme/app_colors.dart';

class LoginGoogleButton extends StatelessWidget {
  const LoginGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textColor,
        backgroundColor: Colors.white,
        side: const BorderSide(color: AppColors.border),
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.g_mobiledata),
          SizedBox(width: 8),
          Text(
            "Entrar com o google",
            style: context.getTextStyle.mediumSmall,
          ),
        ],
      ),
    );
  }
}
