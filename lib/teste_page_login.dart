import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TestPageLogin extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onGuestTap;

  const TestPageLogin({
    super.key,
    required this.onGoogleTap,
    required this.onGuestTap,
  });

  static const _blue = Color(0xFF2157F8);
  static const _inkOnBlue = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _blue,
      body: SafeArea(
        child: Stack(
          children: [
            const _BubbleBackground(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              child: Column(
                children: [
                  // top area (pode colocar um "pular" aqui se quiser)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: onGuestTap,
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white.withOpacity(0.90),
                        ),
                        child: const Text(
                          'Entrar depois',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Logo + textos
                  const _LogoBlock(),

                  const SizedBox(height: 22),

                  // Actions card (branco)
                  _ActionCard(
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton.icon(
                            onPressed: onGoogleTap,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _blue,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            icon: const _GoogleGMark(),
                            label: const Text(
                              'Continuar com Google',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: OutlinedButton(
                            onPressed: onGuestTap,
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF1F2A44),
                              side: const BorderSide(color: Color(0xFFE6EAF6)),
                              backgroundColor: const Color(0xFFF5F7FD),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: const Text(
                              'Continuar sem login',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Ao continuar, você concorda com nossos Termos e Política de Privacidade.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF8A96C8).withOpacity(0.95),
                            fontSize: 11.5,
                            fontWeight: FontWeight.w600,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // footer
                  Text(
                    'Kotto • Sua segurança na palma da sua mão',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _inkOnBlue.withOpacity(0.85),
                      fontWeight: FontWeight.w700,
                      fontSize: 12.5,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------------- UI Blocks ---------------- */

class _LogoBlock extends StatelessWidget {
  const _LogoBlock();

  static const _inkOnBlue = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Troque por Image.asset('assets/logo.png') quando tiver
        // Container(
        //   width: 96,
        //   height: 96,
        //   decoration: BoxDecoration(
        //     color: Colors.white.withOpacity(0.16),
        //     borderRadius: BorderRadius.circular(30),
        //     border: Border.all(color: Colors.white.withOpacity(0.20)),
        //   ),
        //   child: const Center(
        //     child: Text(
        //       'K',
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 42,
        //         fontWeight: FontWeight.w900,
        //       ),
        //     ),
        //   ),
        // ),
        Lottie.asset(
          'assets/lottie/owl2.json',
          width: 240,
          height: 240,
        ),
        const SizedBox(height: 18),
        const Text(
          'Bem-vindo ao Kotto',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _inkOnBlue,
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Entre para salvar seus itens, registrar ocorrências\n'
          'e receber alertas na sua região.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _inkOnBlue.withOpacity(0.86),
            fontSize: 14,
            height: 1.35,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final Widget child;
  const _ActionCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 22,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: child,
    );
  }
}

/// Ícone simples do Google (sem asset). Se quiser perfeito, troque por um SVG/PNG.
class _GoogleGMark extends StatelessWidget {
  const _GoogleGMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: const Center(
        child: Text(
          'G',
          style: TextStyle(
            color: Color(0xFF1F2A44),
            fontWeight: FontWeight.w900,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

/* ---------------- Background bubbles ---------------- */

class _BubbleBackground extends StatelessWidget {
  const _BubbleBackground();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        _Bubble(
          top: -80,
          left: -60,
          size: 220,
          opacity: 0.16,
        ),
        _Bubble(
          top: 120,
          right: -90,
          size: 260,
          opacity: 0.14,
        ),
        _Bubble(
          bottom: -90,
          left: -40,
          size: 240,
          opacity: 0.12,
        ),
        _Bubble(
          bottom: 140,
          right: -70,
          size: 180,
          opacity: 0.10,
        ),
      ],
    );
  }
}

class _Bubble extends StatelessWidget {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double size;
  final double opacity;

  const _Bubble({
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.size,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(opacity),
        ),
      ),
    );
  }
}
