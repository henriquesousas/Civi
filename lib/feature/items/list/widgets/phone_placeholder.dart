import 'package:deehelp/old_core/extension/color_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class PhonePlaceholder extends StatelessWidget {
  final double size;
  final double radius;

  const PhonePlaceholder({
    super.key,
    this.radius = 18,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    const brand = Color(0xFF02289B);

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          // color: bg,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: context.outlineVariantColor, width: 1),
        ),
        child: Stack(
          children: [
            // Corte diagonal bem sutil (cara premium)
            Positioned.fill(
              child: CustomPaint(
                painter: _DiagonalCutPainter(
                  color: context.primaryColorDark.withValues(alpha: 0.06),
                ),
              ),
            ),

            // Pattern pontilhado (muito leve)
            Positioned.fill(
              child: CustomPaint(
                painter: _DotPatternPainter(
                  color: context.primaryColorDark.withValues(alpha: 0.08),
                  dotRadius: size * 0.018,
                  gap: size * 0.14,
                ),
              ),
            ),

            Center(
              child: Icon(
                Icons.phone_iphone_rounded,
                size: IconSizes.xl,
                color: brand.withValues(alpha: 0.85),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DiagonalCutPainter extends CustomPainter {
  final Color color;
  _DiagonalCutPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
      ..moveTo(0, size.height * 0.65)
      ..lineTo(size.width, size.height * 0.35)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _DiagonalCutPainter oldDelegate) =>
      oldDelegate.color != color;
}

class _DotPatternPainter extends CustomPainter {
  final Color color;
  final double dotRadius;
  final double gap;

  _DotPatternPainter({
    required this.color,
    required this.dotRadius,
    required this.gap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    for (double y = gap * 0.6; y < size.height; y += gap) {
      for (double x = gap * 0.6; x < size.width; x += gap) {
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotPatternPainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.dotRadius != dotRadius ||
      oldDelegate.gap != gap;
}
