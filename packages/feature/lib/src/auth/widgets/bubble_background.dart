import 'package:app_feature/src/auth/widgets/bubble.dart';
import 'package:flutter/material.dart';

class BubbleBackground extends StatelessWidget {
  const BubbleBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Bubble(
          top: -80,
          left: -60,
          size: 220,
          opacity: 0.16,
        ),
        Bubble(
          top: 120,
          right: -90,
          size: 260,
          opacity: 0.14,
        ),
        Bubble(
          bottom: -90,
          left: -40,
          size: 240,
          opacity: 0.12,
        ),
        Bubble(
          bottom: 140,
          right: -70,
          size: 180,
          opacity: 0.10,
        ),
      ],
    );
  }
}
