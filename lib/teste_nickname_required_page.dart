import 'package:flutter/material.dart';

// ✅ Importe sua tela real
// import 'nickname_page.dart';

class TesteNicknameRequiredPage extends StatelessWidget {
  const TesteNicknameRequiredPage({super.key});

  // Tokens
  static const _blue = Color(0xFF2B5BEE);
  static const _blueDeep = Color(0xFF1E40AF);
  static const _blueSoft = Color(0xFF5F85FF);
  static const _white = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _blue,
      body: Stack(
        children: [
          // ✅ Fundo azul mais “premium” (camadas)
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [_blueDeep, _blue, _blueSoft],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.55, 1.0],
                ),
              ),
            ),
          ),

          // ✅ textura sutil (glow blobs + “grid” discreta)
          Positioned(
              top: -160,
              right: -140,
              child: _GlowBlob(size: 340, opacity: 0.14)),
          Positioned(
              bottom: -190,
              left: -150,
              child: _GlowBlob(size: 380, opacity: 0.12)),
          Positioned.fill(
              child: IgnorePointer(
                  child: CustomPaint(painter: _SubtleGridPainter()))),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 560),
                  child: Column(
                    children: [
                      // top row (fechar discreto)
                      Row(
                        children: [
                          const Spacer(),
                          _TopIconButton(
                            icon: Icons.close_rounded,
                            tooltip: 'Fechar',
                            onTap: () => Navigator.pop(context),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ✅ “hero” card
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.fromLTRB(16, 18, 16, 16),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.10),
                                borderRadius: BorderRadius.circular(28),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.16),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x1A000000),
                                    blurRadius: 30,
                                    offset: Offset(0, 14),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  // Ícone com “ring”
                                  Container(
                                    width: 84,
                                    height: 84,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.14),
                                      borderRadius: BorderRadius.circular(28),
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.18),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.badge_outlined,
                                      color: _white,
                                      size: 42,
                                    ),
                                  ),
                                  const SizedBox(height: 14),

                                  const Text(
                                    'Crie seu apelido',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: _white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                      height: 1.1,
                                    ),
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    'Você precisa de um apelido para aparecer na comunidade.\n'
                                    'É rápido — pode ser manual ou com sugestões automáticas.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.92),
                                      fontSize: 14.5,
                                      fontWeight: FontWeight.w600,
                                      height: 1.35,
                                    ),
                                  ),

                                  const SizedBox(height: 14),

                                  // ✅ Benefícios em “chips cards”
                                  const _BenefitsRow(),
                                ],
                              ),
                            ),

                            const SizedBox(height: 14),

                            // ✅ card “regras” mais corporativo
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.fromLTRB(14, 12, 14, 12),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.14),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.shield_outlined,
                                    color: Colors.white.withOpacity(0.92),
                                    size: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      'Evite dados pessoais (telefone, endereço, e-mail). '
                                      'Use algo fácil de lembrar, como “Sentinela Azul”.',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.90),
                                        fontWeight: FontWeight.w600,
                                        height: 1.25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ✅ Ações (bem profissionais)
                      Column(
                        children: [
                          _PrimaryCTA(
                            onTap: () async {
                              // ✅ Troque NicknamePage() pela sua tela real
                              final nick = await Navigator.push<String>(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const NicknamePage(),
                                ),
                              );

                              if (nick != null && nick.trim().isNotEmpty) {
                                if (!context.mounted) return;
                                Navigator.pop(context, nick);
                              }
                            },
                            title: 'Continuar',
                            subtitle: 'Criar apelido agora',
                            icon: Icons.auto_awesome_rounded,
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white.withOpacity(0.92),
                            ),
                            child: const Text(
                              'Fazer depois',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ),
                          const SizedBox(height: 6),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* ===================== Components ===================== */

class _TopIconButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _TopIconButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.10),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white.withOpacity(0.14)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(icon, color: Colors.white.withOpacity(0.92), size: 20),
          ),
        ),
      ),
    );
  }
}

class _PrimaryCTA extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String subtitle;
  final IconData icon;

  const _PrimaryCTA({
    required this.onTap,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x20000000),
                blurRadius: 22,
                offset: Offset(0, 12),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFF2B5BEE).withOpacity(0.10),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.auto_awesome_rounded,
                  color: Color(0xFF2B5BEE),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                        color: Color(0xFF1F2A44),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.5,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Color(0xFF6B7280),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BenefitsRow extends StatelessWidget {
  const _BenefitsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: _BenefitChip(
            icon: Icons.shield_outlined,
            title: 'Privacidade',
            subtitle: 'Sem dados pessoais',
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _BenefitChip(
            icon: Icons.auto_awesome_rounded,
            title: 'Sugestões',
            subtitle: '10 opções rápidas',
          ),
        ),
      ],
    );
  }
}

class _BenefitChip extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _BenefitChip({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.10),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.14)),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: Colors.white.withOpacity(0.92), size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 13.5,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.92),
                    fontWeight: FontWeight.w600,
                    fontSize: 12.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GlowBlob extends StatelessWidget {
  final double size;
  final double opacity;

  const _GlowBlob({
    required this.size,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    final c = Colors.white.withOpacity(opacity);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: c,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: c,
            blurRadius: 70,
            spreadRadius: 24,
          ),
        ],
      ),
    );
  }
}

/// Grid super sutil pra dar “acabamento” (quase imperceptível)
class _SubtleGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.035)
      ..strokeWidth = 1;

    const step = 28.0;

    for (double x = 0; x <= size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/* ======================================================
   ✅ Placeholder para compilar o exemplo.
   Troque pelo seu NicknamePage real (o que criamos antes).
   ====================================================== */
class NicknamePage extends StatelessWidget {
  const NicknamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nickname')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context, 'Sentinela Azul'),
          child: const Text('Salvar apelido (mock)'),
        ),
      ),
    );
  }
}
