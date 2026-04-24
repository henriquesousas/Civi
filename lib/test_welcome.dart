import 'package:flutter/material.dart';

class TestWelcome extends StatelessWidget {
  const TestWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF0B1220),
                    Color(0xFF0B1220),
                    Color(0xFF111827),
                  ],
                ),
              ),
            ),
          ),

          /// Conteúdo do topo
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    const _LogoSection(),
                    const SizedBox(height: 36),
                    Text(
                      'Saiba o que está acontecendo\nagora perto de você',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: 26,
                                height: 1.15,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Acompanhe roubos, assaltos e movimentações suspeitas em tempo real',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 15,
                            height: 1.45,
                            color: Colors.white.withOpacity(0.78),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Imagem inferior — não pega tela toda
          Positioned(
            left: 18,
            right: 18,
            bottom: 190,
            height: size.height * 0.45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(34),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1519501025264-65ba15a82390?auto=format&fit=crop&w=1400&q=80',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF0B1220).withOpacity(0.10),
                          const Color(0xFF0B1220).withOpacity(0.20),
                          const Color(0xFF0B1220).withOpacity(0.62),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Pins alinhados na área da imagem
          Positioned(
            bottom: 390,
            left: 28,
            child: const _FloatingTag(
              text: '200M de você',
              lineHeight: 70,
            ),
          ),
          Positioned(
            bottom: 430,
            left: size.width * 0.35,
            child: const _FloatingTag(
              text: 'Atividade suspeita',
              lineHeight: 92,
            ),
          ),
          Positioned(
            bottom: 355,
            right: 28,
            child: const _FloatingTag(
              text: 'Roubo registrado',
              lineHeight: 58,
              lineToRight: true,
            ),
          ),

          /// Botões alinhados no bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _PrimaryAuthButton(
                      label: 'Continuar com Google',
                      icon: Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'G',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF2B5BEE),
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(height: 14),
                    _SecondaryAuthButton(
                      label: 'Continuar com telefone',
                      onTap: () {},
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Ao continuar, você concorda com a Política\n'
                      'de privacidade e os Termos de uso do Civi',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: Colors.white.withOpacity(0.62),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoSection extends StatelessWidget {
  const _LogoSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.location_on_rounded,
          color: Color(0xFF4D7CFF),
          size: 34,
        ),
        SizedBox(width: 6),
        Text(
          'Civi',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}

class _FloatingTag extends StatelessWidget {
  final String text;
  final double lineHeight;
  final bool lineToRight;

  const _FloatingTag({
    required this.text,
    required this.lineHeight,
    this.lineToRight = false,
  });

  @override
  Widget build(BuildContext context) {
    final lineColor = Colors.white.withOpacity(0.90);

    return Column(
      crossAxisAlignment:
          lineToRight ? CrossAxisAlignment.end : CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.22),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0F172A),
            ),
          ),
        ),
        if (!lineToRight) ...[
          Container(width: 2, height: lineHeight, color: lineColor),
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: lineColor,
              shape: BoxShape.circle,
            ),
          ),
        ] else ...[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 2, height: lineHeight, color: lineColor),
              Container(width: 42, height: 2, color: lineColor),
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: lineColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class _PrimaryAuthButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback onTap;

  const _PrimaryAuthButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      width: double.infinity,
      child: Material(
        color: const Color(0xFF2B5BEE),
        borderRadius: BorderRadius.circular(999),
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 30, child: Center(child: icon)),
              const SizedBox(width: 12),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SecondaryAuthButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _SecondaryAuthButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: double.infinity,
      child: Material(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(999),
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: Colors.white.withOpacity(0.14),
              ),
            ),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
