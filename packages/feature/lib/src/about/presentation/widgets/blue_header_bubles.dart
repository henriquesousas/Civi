import 'package:app_feature/src/about/presentation/widgets/bubble.dart';
import 'package:flutter/material.dart';

class BlueHeaderBubbles extends StatelessWidget {
  const BlueHeaderBubbles({super.key});

  static const _primary = Color(0xFF2157F8);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Container(
            height: 210,
            decoration: const BoxDecoration(
              color: _primary,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(34)),
            ),
          ),
          Positioned(
            top: -40,
            right: -50,
            child: Bubble(size: 160, opacity: 0.12),
          ),
          Positioned(
            top: 60,
            left: -40,
            child: Bubble(size: 120, opacity: 0.10),
          ),
          Positioned(
            top: 120,
            right: 40,
            child: Bubble(size: 80, opacity: 0.10),
          ),
        ],
      ),
    );
  }
}
