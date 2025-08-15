import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class ConfettiPainter extends CustomPainter {
  final double progress;

  ConfettiPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Create confetti particles
    for (int i = 0; i < 30; i++) {
      final x = (i * 37.5) % size.width;
      final y = (progress * size.height * 2 - i * 20) % size.height;

      paint.color = [
        AppColors.primary,
        AppColors.secondary,
        AppColors.accent,
        AppColors.success,
        AppColors.warning,
      ][i % 5]
          .withValues(alpha:  0.7);

      // Draw confetti shapes
      if (i % 3 == 0) {
        // Circle
        canvas.drawCircle(Offset(x, y), 3, paint);
      } else if (i % 3 == 1) {
        // Square
        canvas.drawRect(Rect.fromLTWH(x - 2, y - 2, 4, 4), paint);
      } else {
        // Triangle
        final path = Path();
        path.moveTo(x, y - 3);
        path.lineTo(x - 3, y + 2);
        path.lineTo(x + 3, y + 2);
        path.close();
        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
