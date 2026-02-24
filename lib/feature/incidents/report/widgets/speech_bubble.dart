import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OwlSadSpeechBubble extends StatelessWidget {
  final String? file;
  final String message;

  const OwlSadSpeechBubble({
    super.key,
    required this.message,
    this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🦉 CORUJA
        Lottie.asset(
          file ?? 'assets/lottie/owl_stopped.json',
          width: ImageSize.xxl,
          height: ImageSize.xxl,
          repeat: true,
        ),

        /// 💬 BALÃO
        Flexible(
          child: _SpeechBubble(
            message: message,
          ),
        ),
      ],
    );
  }
}

class _SpeechBubble extends StatelessWidget {
  final String message;

  const _SpeechBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    const bubbleColor = Color(0xFFF4F7FF);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        /// Caixa principal
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: LayoutSpacingSize.card,
            vertical: LayoutSpacingSize.card,
          ),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.4),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Text(
            message,
            style: context.appText.caption.copyWith(
              height: 1.5,
              fontWeight: FontWeight.w500,
              color: context.onSurface,
            ),
          ),
        ),

        /// Rabinho do balão
        Positioned(
          left: -8,
          top: 26,
          child: CustomPaint(
            size: const Size(16, 16),
            painter: _BubbleTailPainter(bubbleColor),
          ),
        ),
      ],
    );
  }
}

class _BubbleTailPainter extends CustomPainter {
  final Color color;

  _BubbleTailPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(0, size.height / 2);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black.withValues(alpha: 0.12), 6, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
