import 'dart:math' as math;
import 'package:flutter/material.dart';

class RoutePreviewCard extends StatelessWidget {
  final double height;
  final double distanceKm;
  final VoidCallback? onTap;

  /// Posição relativa dentro do widget (0 a 1)
  final Offset startPoint;
  final Offset endPoint;

  const RoutePreviewCard({
    super.key,
    this.height = 300,
    required this.distanceKm,
    required this.startPoint,
    required this.endPoint,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF0D1117),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.06),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.28),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              const _FakeMapBackground(),
              Positioned.fill(
                child: CustomPaint(
                  painter: _RoutePainter(
                    startPoint: startPoint,
                    endPoint: endPoint,
                  ),
                ),
              ),
              _MarkerBubble(
                alignment: Alignment(
                  (startPoint.dx * 2) - 1,
                  (startPoint.dy * 2) - 1,
                ),
                label: 'Ocorrência',
                icon: Icons.warning_amber_rounded,
                color: const Color(0xFFE53935),
              ),
              _MarkerBubble(
                alignment: Alignment(
                  (endPoint.dx * 2) - 1,
                  (endPoint.dy * 2) - 1,
                ),
                label: 'Você',
                icon: Icons.my_location_rounded,
                color: const Color(0xFF2B5BEE),
              ),
              Positioned(
                top: 16,
                left: 16,
                right: 16,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.42),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.06),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.route_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${distanceKm.toStringAsFixed(1)} km até a ocorrência',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.46),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.06),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.visibility_outlined,
                        color: Colors.white70,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Visualização do trajeto até o local do roubo',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FakeMapBackground extends StatelessWidget {
  const _FakeMapBackground();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _FakeMapPainter(),
      child: Container(),
    );
  }
}

class _FakeMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final background = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF111827),
          Color(0xFF0B1220),
          Color(0xFF0F172A),
        ],
      ).createShader(Offset.zero & size);

    canvas.drawRect(Offset.zero & size, background);

    final streetPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final streetPaintSecondary = Paint()
      ..color = Colors.white.withValues(alpha: 0.025)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    for (double y = 40; y < size.height; y += 55) {
      final path = Path();
      path.moveTo(0, y);
      path.quadraticBezierTo(
          size.width * 0.35, y - 18, size.width * 0.7, y + 10);
      path.quadraticBezierTo(size.width * 0.85, y + 22, size.width, y - 6);
      canvas.drawPath(path, streetPaintSecondary);
    }

    for (double x = 35; x < size.width; x += 65) {
      final path = Path();
      path.moveTo(x, 0);
      path.quadraticBezierTo(
          x - 14, size.height * 0.3, x + 10, size.height * 0.65);
      path.quadraticBezierTo(x + 22, size.height * 0.82, x - 5, size.height);
      canvas.drawPath(path, streetPaint);
    }

    final blockPaint = Paint()..color = Colors.white.withValues(alpha: 0.02);

    for (double x = 20; x < size.width; x += 85) {
      for (double y = 25; y < size.height; y += 80) {
        final rect = RRect.fromRectAndRadius(
          Rect.fromLTWH(x, y, 34, 24),
          const Radius.circular(6),
        );
        canvas.drawRRect(rect, blockPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _RoutePainter extends CustomPainter {
  final Offset startPoint;
  final Offset endPoint;

  _RoutePainter({
    required this.startPoint,
    required this.endPoint,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final start = Offset(
      startPoint.dx * size.width,
      startPoint.dy * size.height,
    );

    final end = Offset(
      endPoint.dx * size.width,
      endPoint.dy * size.height,
    );

    final shadowPaint = Paint()
      ..color = const Color(0xFF2B5BEE).withValues(alpha: 0.18)
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final routePaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFFE53935),
          Color(0xFF2B5BEE),
        ],
      ).createShader(Rect.fromPoints(start, end))
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final dashedPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.16)
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round;

    final midX = (start.dx + end.dx) / 2;
    final curveHeight = math.min(40, (end - start).distance * 0.12);

    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..quadraticBezierTo(
        midX,
        ((start.dy + end.dy) / 2) - curveHeight,
        end.dx,
        end.dy,
      );

    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, routePaint);

    final pathMetrics = path.computeMetrics();
    for (final metric in pathMetrics) {
      for (double i = 0; i < metric.length; i += 14) {
        final extract = metric.extractPath(i, i + 6);
        canvas.drawPath(extract, dashedPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _RoutePainter oldDelegate) {
    return oldDelegate.startPoint != startPoint ||
        oldDelegate.endPoint != endPoint;
  }
}

class _MarkerBubble extends StatelessWidget {
  final Alignment alignment;
  final String label;
  final IconData icon;
  final Color color;

  const _MarkerBubble({
    required this.alignment,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Transform.translate(
        offset: const Offset(0, -8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.06),
                ),
              ),
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.35),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.15),
                ),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
