import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/widgets/icon/export_icon.dart';
import 'package:flutter/material.dart';

class SectionDistance extends StatelessWidget {
  const SectionDistance({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.percentHeight(0.3),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1A2A34),
                  Color(0xFF223640),
                  Color(0xFF17242C),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const _IncidentDistanceMap(
              distanceText: '200 m de você',
            ),
          ),
          Positioned(
            top: context.topPadding + 14,
            left: 16,
            child: UIIconCard(
              bgColor: Colors.black.withValues(alpha: .32),
              radius: 999,
              width: SizeIcon.xl,
              height: SizeIcon.xl,
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
        ],
      ),
    );
  }
}

class _IncidentDistanceMap extends StatelessWidget {
  final String distanceText;

  const _IncidentDistanceMap({
    this.distanceText = '200 km de você',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 180.h,
      width: double.infinity,
      child: CustomPaint(
        painter: _MapGridPainter(
          distanceText: distanceText,
        ),
      ),
    );
  }
}

class _MapGridPainter extends CustomPainter {
  final String distanceText;

  _MapGridPainter({
    required this.distanceText,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawMapGrid(canvas, size);

    final userPoint = Offset(size.width * .22, size.height * .72);
    final incidentPoint = Offset(size.width * .78, size.height * .30);

    final path = Path()
      ..moveTo(userPoint.dx, userPoint.dy)
      ..cubicTo(
        size.width * .34,
        size.height * .70,
        size.width * .48,
        size.height * .32,
        incidentPoint.dx,
        incidentPoint.dy,
      );

    _drawRoute(canvas, path);

    _drawLabel(
      canvas,
      text: distanceText,
      position: Offset(size.width * .36, size.height * .47),
    );

    _drawPoint(
      canvas,
      point: userPoint,
      color: const Color(0xFF2B5BEE),
      icon: Icons.navigation_rounded,
    );

    _drawPoint(
      canvas,
      point: incidentPoint,
      color: const Color(0xFFFF4D4D),
      icon: Icons.priority_high_rounded,
    );
  }

  void _drawMapGrid(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = Colors.white.withValues(alpha: .22)
      ..strokeWidth = 2;

    final minorPaint = Paint()
      ..color = Colors.white.withValues(alpha: .08)
      ..strokeWidth = 1.1;

    for (double x = -80; x < size.width + 120; x += 55) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x - 80, size.height),
        roadPaint,
      );
    }

    for (double y = 40; y < size.height; y += 62) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y + 70),
        minorPaint,
      );
    }
  }

  void _drawRoute(Canvas canvas, Path path) {
    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: .24)
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    final routeBasePaint = Paint()
      ..color = Colors.white.withValues(alpha: .95)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final routeTopPaint = Paint()
      ..color = const Color(0xFF2B5BEE)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final dashedPaint = Paint()
      ..color = Colors.white.withValues(alpha: .55)
      ..strokeWidth = 1.3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, routeBasePaint);
    canvas.drawPath(path, routeTopPaint);

    _drawDashedPath(canvas, path, dashedPaint);
  }

  void _drawDashedPath(Canvas canvas, Path source, Paint paint) {
    const dashWidth = 7.0;
    const dashSpace = 7.0;

    for (final metric in source.computeMetrics()) {
      double distance = 0;

      while (distance < metric.length) {
        canvas.drawPath(
          metric.extractPath(distance, distance + dashWidth),
          paint,
        );

        distance += dashWidth + dashSpace;
      }
    }
  }

  void _drawPoint(
    Canvas canvas, {
    required Offset point,
    required Color color,
    required IconData icon,
  }) {
    canvas.drawCircle(
      point,
      15,
      Paint()..color = Colors.black.withValues(alpha: .18),
    );

    canvas.drawCircle(
      point,
      13,
      Paint()..color = Colors.white,
    );

    canvas.drawCircle(
      point,
      9,
      Paint()..color = color,
    );

    final iconPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: 11,
          fontFamily: icon.fontFamily,
          package: icon.fontPackage,
          color: Colors.white,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    iconPainter.paint(
      canvas,
      Offset(
        point.dx - iconPainter.width / 2,
        point.dy - iconPainter.height / 2,
      ),
    );
  }

  void _drawLabel(
    Canvas canvas, {
    required String text,
    required Offset position,
  }) {
    const padding = EdgeInsets.symmetric(horizontal: 12, vertical: 7);

    final textPainter = TextPainter(
      text: const TextSpan(
        text: '',
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.text = TextSpan(
      text: text,
      style: const TextStyle(
        color: Color(0xFF111827),
        fontSize: 12,
        fontWeight: FontWeight.w800,
      ),
    );

    textPainter.layout();

    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        position.dx,
        position.dy,
        textPainter.width + padding.horizontal,
        textPainter.height + padding.vertical,
      ),
      const Radius.circular(999),
    );

    canvas.drawRRect(
      rect.shift(const Offset(0, 3)),
      Paint()
        ..color = Colors.black.withValues(alpha: .18)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8),
    );

    canvas.drawRRect(
      rect,
      Paint()..color = Colors.white,
    );

    textPainter.paint(
      canvas,
      Offset(
        position.dx + padding.left,
        position.dy + padding.top,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant _MapGridPainter oldDelegate) {
    return oldDelegate.distanceText != distanceText;
  }
}
