import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'widgets/auth_action_card.dart';
import 'widgets/auth_logo.dart';
import 'widgets/bubble_background.dart';
import 'widgets/google_mark.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            const BubbleBackground(),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LogoBlock(),
                      const SizedBox(height: SpacingSize.lg),
                      AuthActionCard(
                        child: Column(
                          children: [
                            ButtonOutline(
                              press: () {},
                              bgColor: context.primaryColor,
                              textColor: Colors.white,
                              icon: const GoogleGMark(),
                              text: 'Continuar com Google',
                            ),
                            const SizedBox(height: SpacingSize.md),
                            ButtonOutline(
                              press: () {},
                              bgColor: const Color(0xFFF5F7FD),
                              side: const BorderSide(color: Color(0xFFE6EAF6)),
                              textColor: context.onSurface,
                              text: 'Continuar sem login',
                            ),
                            const SizedBox(height: SpacingSize.md),
                            Text(
                              'Ao continuar, você concorda com nossos Termos e Política de Privacidade.',
                              textAlign: TextAlign.center,
                              style: context.appText.caption.copyWith(
                                color: context.secondaryColor
                                    .withValues(alpha: 0.95),
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
