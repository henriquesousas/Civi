import 'package:deehelp/app_name.dart';
import 'package:deehelp/core/extension/exports_extension.dart';
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
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SafeArea(
        child: DecorativeBubblesBackground(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Center(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: isLandscape ? 24 : 0,
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: isLandscape ? 500 : double.infinity,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Logo(),
                            const SizedBox(height: 32),
                            Text(
                              AppName.appName,
                              textAlign: TextAlign.center,
                              style: context.appText.headerlg.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Sua segurança começa no seu bairro',
                              textAlign: TextAlign.center,
                              style: context.appText.bodySmall.copyWith(
                                color: Colors.white.withOpacity(0.92),
                              ),
                            ),
                            if (isLandscape) ...[
                              const SizedBox(height: 90),
                              const SplashProgressIndicator()
                            ]
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (!isLandscape)
                    const Positioned(
                      bottom: 0,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 32),
                        child: SplashProgressIndicator(),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
