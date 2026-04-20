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
            child: Image.network(
              'https://images.unsplash.com/photo-1519501025264-65ba15a82390?auto=format&fit=crop&w=1400&q=80',
              // 'https://images.unsplash.com/photo-1467269204594-9661b134dd2b?auto=format&fit=crop&w=1400&q=80',
              fit: BoxFit.cover,
            ),
          ),
          // Positioned.fill(
          //   child: Container(
          //     decoration: const BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [
          //           Color(0xAA0B1220),
          //           Color(0x660B1220),
          //           Color(0xB30B1220),
          //         ],
          //         stops: [0.0, 0.42, 1.0],
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned.fill(
          //   child: Container(
          //     decoration: const BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [
          //           Color(0x660B1220), // topo bem mais leve
          //           Color(0x330B1220), // meio quase transparente
          //           Color(0x990B1220), // fundo ainda escuro pra contraste
          //         ],
          //         stops: [0.0, 0.45, 1.0],
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned.fill(
          //   child: Container(
          //     decoration: const BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [
          //           Color(0x440B1220),
          //           Color(0x220B1220),
          //           Color(0x770B1220),
          //         ],
          //         stops: [0.0, 0.45, 1.0],
          //       ),
          //     ),
          //   ),
          // ),
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
                      // 'Veja o que está acontecendo\nao seu redor em tempo real',
                      'Saiba o que está acontecendo\nagora perto de você',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: 26,
                                height: 1.15,
                                fontWeight: FontWeight.w700,
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
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.37,
            left: 18,
            child: const _FloatingTag(
              text: '200M de você',
              lineHeight: 120,
            ),
          ),
          Positioned(
            top: size.height * 0.31,
            left: size.width * 0.38,
            child: const _FloatingTag(
              text: 'Atividade suspeita',
              lineHeight: 190,
            ),
          ),
          Positioned(
            top: size.height * 0.46,
            right: 18,
            child: const _FloatingTag(
              text: 'Roubo registrado',
              lineHeight: 80,
              lineToRight: true,
            ),
          ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        'Ao continuar, você concorda com a Política\n'
                        'de privacidade e os Termos de uso do Spoke',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.5,
                          color: Colors.white.withOpacity(0.74),
                          fontWeight: FontWeight.w500,
                        ),
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
    final lineColor = Colors.white.withOpacity(0.9);

    return Column(
      crossAxisAlignment:
          lineToRight ? CrossAxisAlignment.end : CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.18),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
            ),
          ),
        ),
        if (!lineToRight) ...[
          Container(
            width: 2,
            height: lineHeight,
            color: lineColor,
          ),
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
              Container(
                width: 2,
                height: lineHeight,
                color: lineColor,
              ),
              Container(
                width: 54,
                height: 2,
                color: lineColor,
              ),
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
        elevation: 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 30, child: Center(child: icon)),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
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
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
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
