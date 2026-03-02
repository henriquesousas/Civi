import 'dart:async';
import 'package:flutter/material.dart';

class TestPage10 extends StatefulWidget {
  const TestPage10({super.key});

  @override
  State<TestPage10> createState() => _TestPage10State();
}

class _TestPage10State extends State<TestPage10> {
  static const _blue = Color(0xFF2157F8);

  double progress = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _startFakeLoading();
  }

  void _startFakeLoading() {
    timer = Timer.periodic(const Duration(milliseconds: 120), (t) {
      setState(() {
        progress += 0.02;
        if (progress >= 1) {
          progress = 1;
          t.cancel();

          // 👉 Navegação futura
          // context.go('/home');
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _blue,
      body: SafeArea(
        child: Stack(
          children: [
            // ✅ Bolhas decorativas (mesmo estilo da success page)
            Positioned(
              top: -120,
              right: -120,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.10),
                ),
              ),
            ),
            Positioned(
              bottom: -140,
              left: -140,
              child: Container(
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.08),
                ),
              ),
            ),

            // Conteúdo
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
              child: Column(
                children: [
                  const Spacer(),

                  // 🔵 Logo central
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.14),
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: Colors.white.withOpacity(0.18)),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/logo.png', // ajuste
                        width: 72,
                        height: 72,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.shield_outlined,
                          color: Colors.white,
                          size: 46,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🏷 Nome do app (opcional)
                  const Text(
                    'KOTTO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.3,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ✨ Tagline
                  Text(
                    'Sua segurança começa no seu bairro',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.92),
                      fontSize: 14.5,
                      height: 1.35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Spacer(),

                  // ⏳ Aguarde + progress bem menor
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Aguarde...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(99),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 2, // ✅ menor ainda (thin)
                          backgroundColor: Colors.white.withOpacity(0.25),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      ),
                    ],
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
