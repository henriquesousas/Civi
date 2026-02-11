import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/bubble/bubble_export.dart';

import 'widgets/logo.dart';
import 'widgets/splash_progress_indicator.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SafeArea(
        child: DecorativeBubblesBackground(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
                child: Column(
                  children: [
                    const Spacer(),
                    const Logo(),
                    const SizedBox(height: SpacingSize.xl),
                    Text(
                      'KOTTO',
                      style: context.appText.headerlg.copyWith(
                        color: Colors.white,
                        height: 1.35,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: SpacingSize.sm),
                    Text(
                      'Sua segurança começa no seu bairro',
                      textAlign: TextAlign.center,
                      style: context.appText.bodySmall.copyWith(
                        color: Colors.white.withValues(alpha: 0.92),
                        height: 1.35,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    const SplashProgressIndicator(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
