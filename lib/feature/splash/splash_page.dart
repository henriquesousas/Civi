import 'package:deehelp/core/extension/exports_extension.dart';
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

    final primary = context.primaryColor;

    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF050507),
              const Color(0xFF0B0B10),
              const Color(0xFF11131A),
              const Color(0xFF050507).withValues(alpha: 0.18),
            ],
            stops: const [0.0, 0.35, 0.75, 1.0],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  /// glow superior
                  // Positioned(
                  //   top: -70,
                  //   right: -40,
                  //   child: Container(
                  //     width: 220,
                  //     height: 220,
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: primary.withValues(alpha: 0.10),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: primary.withValues(alpha: 0.16),
                  //           blurRadius: 80,
                  //           spreadRadius: 10,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  /// glow inferior
                  // Positioned(
                  //   bottom: -80,
                  //   left: -50,
                  //   child: Container(
                  //     width: 220,
                  //     height: 220,
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: Colors.white.withValues(alpha: 0.03),
                  //     ),
                  //   ),
                  // ),

                  /// detalhe central suave
                  // Positioned.fill(
                  //   child: IgnorePointer(
                  //     child: Center(
                  //       child: Container(
                  //         width: 320,
                  //         height: 320,
                  //         decoration: BoxDecoration(
                  //           shape: BoxShape.circle,
                  //           gradient: RadialGradient(
                  //             colors: [
                  //               primary.withValues(alpha: 0.10),
                  //               Colors.transparent,
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

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
                            Container(
                              width: context.percentWidth(0.3),
                              height: context.percentWidth(0.3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: Colors.white.withValues(alpha: 0.05),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.08),
                                  width: 1.2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 32,
                                    offset: const Offset(0, 20),
                                    color: Colors.black.withValues(alpha: 0.40),
                                  ),
                                  BoxShadow(
                                    blurRadius: 26,
                                    spreadRadius: -4,
                                    color: primary.withValues(alpha: 0.18),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Container(
                                width: context.percentWidth(0.2),
                                height: context.percentWidth(0.2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26),
                                  color: const Color(0xFF14161C),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.06),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/images/logo_transp.png",
                                ),
                              ),
                            ),

                            // Lottie.asset(
                            //   "assets/lottie/radar.json",
                            //   width: context.percentWidth(0.5),
                            // ),

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
                                color: Colors.white.withValues(alpha: 0.88),
                                fontWeight: FontWeight.w600,
                                height: 1.35,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Obtendo localização...",
                              textAlign: TextAlign.center,
                              style: context.appText.bodySmall.copyWith(
                                color: Colors.white.withValues(alpha: 0.58),
                                height: 1.45,
                              ),
                            ),
                            const SizedBox(height: 28),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.05),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.08),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.22),
                                    blurRadius: 18,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.4,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        primary,
                                      ),
                                      backgroundColor:
                                          Colors.white.withValues(alpha: 0.10),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    "Buscando localização...",
                                    style: context.appText.bodySmall.copyWith(
                                      color:
                                          Colors.white.withValues(alpha: 0.88),
                                      fontWeight: FontWeight.w600,
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
                            color: Colors.white.withValues(alpha: 0.52),
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Versão 1.0.0',
                          textAlign: TextAlign.center,
                          style: context.appText.caption.copyWith(
                            color: Colors.white.withValues(alpha: 0.34),
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
