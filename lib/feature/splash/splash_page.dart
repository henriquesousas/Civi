import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2B5BEE),
              Color(0xFF1D4ED8),
              Color(0xFF163EAF),
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  /// detalhes decorativos no fundo
                  Positioned(
                    top: -60,
                    right: -40,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.08),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -40,
                    left: -30,
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.06),
                      ),
                    ),
                  ),

                  Center(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: isLandscape ? 24 : 0,
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: isLandscape ? 520 : double.infinity,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Container(
                            //   width: 124,
                            //   height: 124,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(30),
                            //     color: Colors.white.withValues(alpha: 0.14),
                            //     border: Border.all(
                            //       color: Colors.white.withValues(alpha: 0.16),
                            //       width: 1.2,
                            //     ),
                            //     boxShadow: [
                            //       BoxShadow(
                            //         blurRadius: 32,
                            //         offset: const Offset(0, 18),
                            //         color: Colors.black.withValues(alpha: 0.18),
                            //       ),
                            //     ],
                            //   ),
                            //   alignment: Alignment.center,
                            //   child: Container(
                            //     width: 88,
                            //     height: 88,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(24),
                            //       color: Colors.white,
                            //     ),
                            //     alignment: Alignment.center,
                            //     child: Icon(
                            //       Icons.shield_rounded,
                            //       color: context.primaryColor,
                            //       size: 44,
                            //     ),
                            //   ),
                            // ),
                            Lottie.asset(
                              "assets/lottie/radar.json",
                              width: context.percentWidth(0.5),
                            ),
                            const SizedBox(height: 28),
                            Text(
                              "Civi",
                              style: context.appText.headerxl.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.4,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Juntos por uma região mais segura",
                              textAlign: TextAlign.center,
                              style: context.appText.bodymd.copyWith(
                                color: Colors.white.withValues(alpha: 0.92),
                                fontWeight: FontWeight.w600,
                                height: 1.35,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Obtendo localização...",
                              textAlign: TextAlign.center,
                              style: context.appText.bodySmall.copyWith(
                                color: Colors.white.withValues(alpha: 0.76),
                                height: 1.45,
                              ),
                            ),
                            const SizedBox(height: 28),

                            /// loading
                            // Container(
                            //   padding: const EdgeInsets.symmetric(
                            //     horizontal: 16,
                            //     vertical: 14,
                            //   ),
                            //   decoration: BoxDecoration(
                            //     color: Colors.white.withValues(alpha: 0.10),
                            //     borderRadius: BorderRadius.circular(18),
                            //     border: Border.all(
                            //       color: Colors.white.withValues(alpha: 0.10),
                            //     ),
                            //   ),
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: [
                            //       SizedBox(
                            //         width: 20,
                            //         height: 20,
                            //         child: CircularProgressIndicator(
                            //           strokeWidth: 2.6,
                            //           valueColor:
                            //               const AlwaysStoppedAnimation<Color>(
                            //             Colors.white,
                            //           ),
                            //           backgroundColor:
                            //               Colors.white.withValues(alpha: 0.22),
                            //         ),
                            //       ),
                            //       const SizedBox(width: 12),
                            //       Text(
                            //         "Carregando dados...",
                            //         style: context.appText.bodySmall.copyWith(
                            //           color:
                            //               Colors.white.withValues(alpha: 0.92),
                            //           fontWeight: FontWeight.w600,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 24,
                    right: 24,
                    bottom: 28,
                    child: Column(
                      children: [
                        Text(
                          'A segurança começa no seu bairro',
                          textAlign: TextAlign.center,
                          style: context.appText.caption.copyWith(
                            color: Colors.white.withValues(alpha: 0.78),
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Versão 1.0.0',
                          textAlign: TextAlign.center,
                          style: context.appText.caption.copyWith(
                            color: Colors.white.withValues(alpha: 0.60),
                            height: 1.4,
                          ),
                        ),
                      ],
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
