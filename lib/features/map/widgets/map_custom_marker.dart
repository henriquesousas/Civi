import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapCustomMarker extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;
  final Color borderColor;
  final Color backgroundColor;
  final double arrowSize;

  const MapCustomMarker({
    super.key,
    required this.label,
    this.icon = Icons.motorcycle,
    this.iconColor = AppColors.primaryColor,
    this.borderColor = AppColors.primaryColor,
    this.backgroundColor = AppColors.whiteColor,
    this.arrowSize = 0.8,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: MarkerPainterV2(
          borderColor: borderColor,
          fillColor: backgroundColor,
          arrowSize: arrowSize,
        ),
        child: Container(
          width: Dimens.size22.w,
          height: Dimens.size22.w + (6.h * arrowSize),
          padding: EdgeInsets.only(bottom: 4.h * arrowSize),
          child: Center(
            child: Icon(
              icon,
              color: iconColor,
              size: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class MarkerPainterV2 extends CustomPainter {
  final Color borderColor;
  final Color fillColor;
  final double arrowSize;

  MarkerPainterV2({
    required this.borderColor,
    required this.fillColor,
    this.arrowSize = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..strokeJoin = StrokeJoin.round;

    final path = Path();

    // Dimensões com escala ajustável
    final cornerRadius = 4.0;
    final pointerHeight = 6.0 * arrowSize; // Escala da altura
    final pointerBaseWidth = 8.0 * arrowSize; // Escala da largura
    final pointerTipCurve = 1.5 * arrowSize; // Escala do arredondamento

    // Calcula pontos centrais para garantir simetria
    final centerX = size.width / 2;
    final bodyBottom = size.height - pointerHeight;

    // 1. COMEÇA NO CANTO SUPERIOR ESQUERDO
    path.moveTo(cornerRadius, 0);

    // 2. LADO SUPERIOR
    path.lineTo(size.width - cornerRadius, 0);
    path.arcToPoint(
      Offset(size.width, cornerRadius),
      radius: Radius.circular(cornerRadius),
    );

    // 3. LADO DIREITO
    path.lineTo(size.width, bodyBottom - cornerRadius);

    // 4. CANTO INFERIOR DIREITO (do corpo)
    path.arcToPoint(
      Offset(size.width - cornerRadius, bodyBottom),
      radius: Radius.circular(cornerRadius),
    );

    // 5. TRANSIÇÃO PARA A SETA - LADO DIREITO
    final rightArrowStartX = centerX + (pointerBaseWidth / 2);
    path.lineTo(rightArrowStartX, bodyBottom);

    // 6. PONTA DA SETA - LADO DIREITO COM CURVA
    final rightControlX = centerX + pointerTipCurve;
    final rightControlY = size.height - pointerTipCurve;

    path.quadraticBezierTo(
      rightControlX,
      rightControlY,
      centerX,
      size.height,
    );

    // 7. PONTA DA SETA - LADO ESQUERDO COM CURVA
    final leftControlX = centerX - pointerTipCurve;
    final leftControlY = size.height - pointerTipCurve;

    path.quadraticBezierTo(
      leftControlX,
      leftControlY,
      centerX - (pointerBaseWidth / 2),
      bodyBottom,
    );

    // 8. LADO ESQUERDO DA SETA
    path.lineTo(cornerRadius, bodyBottom);

    // 9. CANTO INFERIOR ESQUERDO (do corpo)
    path.arcToPoint(
      Offset(0, bodyBottom - cornerRadius),
      radius: Radius.circular(cornerRadius),
    );

    // 10. LADO ESQUERDO
    path.lineTo(0, cornerRadius);

    // 11. CANTO SUPERIOR ESQUERDO
    path.arcToPoint(
      Offset(cornerRadius, 0),
      radius: Radius.circular(cornerRadius),
    );

    path.close();

    // Desenhar
    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(MarkerPainterV2 oldDelegate) =>
      oldDelegate.borderColor != borderColor ||
      oldDelegate.fillColor != fillColor ||
      oldDelegate.arrowSize != arrowSize;
}
