import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Header extends StatelessWidget {
  final VoidCallback onSkip;
  const Header({super.key, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: ImageSize.md,
          height: ImageSize.md,
          decoration: BoxDecoration(
            color: context.primaryColor(),
            borderRadius: BorderRadius.circular(RadiusSize.md),
            boxShadow: [
              BoxShadow(
                color: context.primaryColorOpacity(0.25),
                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Icon(Icons.shield_outlined, color: Colors.white),
        ),
        // Lottie.asset(
        //   'assets/lottie/owl_open_mouth.json',
        //   width: 60,
        //   height: 60,
        // ),
        const SizedBox(width: SpacingSize.md),
        Expanded(
          child: Text(
            'TIZZO',
            style: context.appText.headerlg.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 0.2,
            ),
          ),
        ),
        TextButton(
          onPressed: onSkip,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
                horizontal: SpacingSize.md, vertical: SpacingSize.md),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RadiusSize.md),
              side: BorderSide(color: Colors.white.withValues(alpha: 0.22)),
            ),
          ),
          child: const Text(
            'Fechar',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }
}
