import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: Center(
        child: Image.asset(
          'assets/logo.png',
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
    );
  }
}
