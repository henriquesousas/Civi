import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';

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
      // backgroundColor: context.primaryColor,
      body: SafeArea(
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
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: context.primaryColor,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 24,
                                  offset: const Offset(0, 12),
                                  color: context.primaryColor
                                      .withValues(alpha: .25),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.shield_rounded,
                              color: Colors.white,
                              size: 46,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "KOTTO",
                            style: context.appText.headerxl.copyWith(
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.2,
                            ),
                          ),
                          Text(
                            "Validando informações...\nAguarde um momento.",
                            textAlign: TextAlign.center,
                            style: context.appText.bodySmall.copyWith(
                              color: context.onSurface.withValues(alpha: .7),
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: ProgressIndicatorSizes.md,
                            height: ProgressIndicatorSizes.md,
                            child:
                                const CircularProgressIndicator(strokeWidth: 3),
                          ),
                          // Text(
                          //   'Sua segurança começa no seu bairro',
                          //   textAlign: TextAlign.center,
                          //   style: context.appText.bodymd.copyWith(
                          //     fontWeight: FontWeight.w700,
                          //     color: Colors.white.withValues(alpha: 0.92),
                          //   ),
                          // ),
                          // if (isLandscape) ...[
                          //   const SizedBox(height: 90),
                          //   const SplashProgressIndicator()
                          // ]
                        ],
                      ),
                    ),
                  ),
                ),
                if (!isLandscape)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Sua segurança começa no seu bairro',
                              textAlign: TextAlign.center,
                              style: context.appText.caption.copyWith(
                                color: context.onSurface.withValues(alpha: 0.7),
                                height: 1.4,
                              ),
                            ),
                            Text(
                              'Vesão 1.0.0',
                              textAlign: TextAlign.center,
                              style: context.appText.caption.copyWith(
                                color: context.onSurface.withValues(alpha: 0.7),
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                // const Positioned(
                //   bottom: 0,
                //   child: Padding(
                //     padding: EdgeInsets.only(bottom: 32),
                //     child: SplashProgressIndicator(),
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}
