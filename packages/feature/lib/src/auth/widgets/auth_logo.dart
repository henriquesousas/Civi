import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LogoBlock extends StatelessWidget {
  const LogoBlock({super.key});

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
          width: ImageSize.xxxl,
          height: ImageSize.xxxl,
        ),
        const Text(
          'Que bom ver você por aqui!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _inkOnBlue,
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: SpacingSize.sm),

        Text(
          'Sou a corujinha Tizo 🦉\n'
          'Estou feliz em te ver e pronta para ajudar a '
          'manter você e sua região mais protegidos.',
          textAlign: TextAlign.center,
          style: context.appText.caption.copyWith(
            color: _inkOnBlue.withValues(alpha: 0.86),
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
        ),
        // const SizedBox(height: 18),
        // const Text(
        //   'Bem-vindo ao Kotto',
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //     color: _inkOnBlue,
        //     fontSize: 22,
        //     fontWeight: FontWeight.w900,
        //   ),
        // ),
        // const SizedBox(height: 10),
        // Text(
        //   'Entre para salvar seus itens, registrar ocorrências\n'
        //   'e receber alertas na sua região.',
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //     color: _inkOnBlue.withOpacity(0.86),
        //     fontSize: 14,
        //     height: 1.35,
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),
      ],
    );
  }
}
