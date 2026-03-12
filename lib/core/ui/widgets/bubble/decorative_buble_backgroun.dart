import 'package:flutter/material.dart';

class DecorativeBubblesBackground extends StatelessWidget {
  final Widget child;

  /// Cor das bolhas (normalmente branco)
  final Color bubbleColor;

  /// Tamanhos e opacidades (caso você queira ajustar depois sem mexer no layout)
  final double topBubbleSize;
  final double bottomBubbleSize;
  final double topBubbleOpacity;
  final double bottomBubbleOpacity;

  const DecorativeBubblesBackground({
    super.key,
    required this.child,
    this.bubbleColor = Colors.white,
    this.topBubbleSize = 260,
    this.bottomBubbleSize = 320,
    this.topBubbleOpacity = 0.05,
    this.bottomBubbleOpacity = 0.05,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Bolha superior direita
        Positioned(
          top: -120,
          right: -120,
          child: _Bubble(
            size: topBubbleSize,
            color: bubbleColor.withValues(alpha: topBubbleOpacity),
          ),
        ),

        // Bolha inferior esquerda
        Positioned(
          bottom: -140,
          left: -140,
          child: _Bubble(
            size: bottomBubbleSize,
            color: bubbleColor.withValues(alpha: bottomBubbleOpacity),
          ),
        ),

        // Conteúdo por cima
        Positioned.fill(child: child),
      ],
    );
  }
}

class _Bubble extends StatelessWidget {
  final double size;
  final Color color;

  const _Bubble({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
