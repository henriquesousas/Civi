import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/size/spacing_size.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/feature/auth/presentation/widgets/auth_action_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AuthView extends StatelessWidget {
  final VoidCallback onLoginWithGoogle;
  final VoidCallback onContinueWithLogin;
  final bool isLoading;
  const AuthView(
      {super.key,
      required this.onLoginWithGoogle,
      required this.onContinueWithLogin,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return AuthActionCard(
      child: Column(
        children: [
          ButtonOutline(
            press: onLoginWithGoogle,
            // bgColor: context.primaryColor,
            textColor: Colors.white,
            // icon: const GoogleGMark(),
            icon: SvgPicture.asset(
              "assets/svg/google.svg",
              width: 15.w,
            ),
            text: 'Continuar com Google',
            loading: isLoading,
          ),
          const SizedBox(height: SpacingSize.md),
          ButtonOutline(
            press: onContinueWithLogin,
            bgColor: const Color(0xFFF5F7FD),
            side: const BorderSide(color: Color(0xFFE6EAF6)),
            textColor: Colors.black,
            text: 'Continuar sem login',
          ),
          const SizedBox(height: SpacingSize.md),
          Text(
            'Ao continuar, você concorda com nossos Termos e Política de Privacidade.',
            textAlign: TextAlign.center,
            style: context.appText.caption.copyWith(
              color: context.secondaryColor.withValues(alpha: 0.95),
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
