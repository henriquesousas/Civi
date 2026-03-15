import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class LogoBlock extends StatelessWidget {
  const LogoBlock({super.key});

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
        Container(
          width: ImageSize.md,
          height: ImageSize.md,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/logo_transp.png",
            width: ImageSize.xl,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Civi App',
          textAlign: TextAlign.center,
          style: context.appText.headerxl.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            height: 1.05,
            letterSpacing: -0.4,
          ),
        ),
        // Lottie.asset(
        //   'assets/lottie/owl2.json',
        //   width: ImageSize.xxl,
        //   height: ImageSize.xxl,
        // ),
        // const Text(
        //   'Que bom ver você por aqui!',
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //     color: _inkOnBlue,
        //     fontSize: 22,
        //     fontWeight: FontWeight.w900,
        //   ),
        // ),
        // const SizedBox(height: SpacingSize.sm),

        // Text(
        //   'Sou a corujinha Tizo 🦉\n'
        //   'Estou feliz em te ver e pronta para ajudar a '
        //   'manter você e sua região mais protegidos.',
        //   textAlign: TextAlign.center,
        //   style: context.appText.caption.copyWith(
        //     color: _inkOnBlue.withValues(alpha: 0.86),
        //     fontWeight: FontWeight.w600,
        //     height: 1.4,
        //   ),
        // ),
      ],
    );
  }
}
