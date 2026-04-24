import 'package:flutter/material.dart';

class TestWelcome2 extends StatelessWidget {
  const TestWelcome2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D11),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            /// BACKGROUND IMAGE FULL SCREEN
            Positioned(
              child: Image.network(
                'https://images.unsplash.com/photo-1519501025264-65ba15a82390?auto=format&fit=crop&w=1400&q=80',
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              top: 150,
              left: 28,
              child: const _FloatingTag(
                text: '200M de você',
                lineHeight: 70,
              ),
            ),
            Positioned(
              top: 200,
              left: size.width * 0.35,
              child: const _FloatingTag(
                text: 'Atividade suspeita',
                lineHeight: 92,
              ),
            ),
            Positioned(
              top: 100,
              right: 28,
              child: const _FloatingTag(
                text: 'Roubo registrado',
                lineHeight: 58,
                lineToRight: true,
              ),
            ),

            /// DARK OVERLAY
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x22000000),
                      Color(0x66000000),
                      Color(0xEE0D0D11),
                      Color(0xFF0D0D11),
                    ],
                    stops: [0.0, 0.35, 0.68, 1.0],
                  ),
                ),
              ),
            ),

            /// CONTENT
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),

                    /// LOGO
                    const Text(
                      'Civi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1,
                      ),
                    ),

                    const Spacer(),

                    /// CHIPS
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: const [
                        _Chip(text: 'Alertas'),
                        _Chip(text: 'Mapa'),
                        _Chip(text: 'Ao vivo'),
                      ],
                    ),

                    const SizedBox(height: 22),

                    /// TITLE
                    const Text(
                      'Saiba o que está\nacontecendo agora\nperto de você',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        height: 1.08,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1.4,
                      ),
                    ),

                    const SizedBox(height: 18),

                    /// SUBTITLE
                    Text(
                      'Acompanhe roubos, assaltos e movimentações suspeitas em tempo real na sua cidade.',
                      style: TextStyle(
                        color: Colors.white.withOpacity(.72),
                        fontSize: 16,
                        height: 1.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 32),

                    /// BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 62,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2B5BEE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Começar agora',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.04),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String text;

  const _Chip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
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
