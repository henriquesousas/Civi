import 'package:flutter/material.dart';

class UICustomPinv2 extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Color borderColor;
  final double borderWidth;
  final Widget child;

  const UICustomPinv2({
    super.key,
    required this.child,
    this.width = 60,
    this.height = 80,
    this.color = Colors.white,
    this.borderColor = Colors.black26,
    this.borderWidth = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _PinPainter(
        color: color,
        borderColor: borderColor,
        borderWidth: borderWidth,
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Center(child: child),
      ),
    );
  }
}

class _PinPainter extends CustomPainter {
  final Color color;
  final Color borderColor;
  final double borderWidth;

  _PinPainter({
    required this.color,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintFill = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final paintBorder = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final path = Path();

    // parte superior arredondada
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height * 0.75),
      Radius.circular(size.width / 2),
    ));

    // ponta inferior (triângulo)
    path.moveTo(size.width / 2 - 12, size.height * 0.75);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width / 2 + 12, size.height * 0.75);
    path.close();

    canvas.drawPath(path, paintFill);
    canvas.drawPath(path, paintBorder);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
