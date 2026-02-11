import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
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
          borderColor: AppColors.darkGreyColor10.withValues(alpha: 0.6),
          fillColor: backgroundColor,
          arrowSize: arrowSize,
        ),
        child: Container(
          width: 32.w,
          height: 32.h + (6.h * arrowSize),
          padding: EdgeInsets.only(bottom: 6.h * arrowSize),
          decoration: BoxDecoration(
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.18),
              //     blurRadius: 12,
              //     spreadRadius: 0,
              //     offset: const Offset(0, 6), // 👈 sombra só para baixo
              //   ),
              // ],
              ),
          child: Center(
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadiusDirectional.circular(10),
              ),
              child: Icon(
                icon,
                color: AppColors.whiteColor,
                size: 14.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//TODO: Mover para uma classe especifica
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
    final path = Path();

    // ====== CONFIGURAÇÕES ======
    final cornerRadius = 10.0;
    final pointerHeight = 5.0 * arrowSize;
    final pointerBaseWidth = 8.0 * arrowSize;
    final pointerTipCurve = 1.5 * arrowSize;

    final centerX = size.width / 2;
    final bodyBottom = size.height - pointerHeight;

    // ====== PATH DO PIN ======
    path.moveTo(cornerRadius, 0);

    path.lineTo(size.width - cornerRadius, 0);
    path.arcToPoint(
      Offset(size.width, cornerRadius),
      radius: Radius.circular(cornerRadius),
    );

    path.lineTo(size.width, bodyBottom - cornerRadius);
    path.arcToPoint(
      Offset(size.width - cornerRadius, bodyBottom),
      radius: Radius.circular(cornerRadius),
    );

    final rightArrowStartX = centerX + (pointerBaseWidth / 2);
    path.lineTo(rightArrowStartX, bodyBottom);

    path.quadraticBezierTo(
      centerX + pointerTipCurve,
      size.height - pointerTipCurve,
      centerX,
      size.height,
    );

    path.quadraticBezierTo(
      centerX - pointerTipCurve,
      size.height - pointerTipCurve,
      centerX - (pointerBaseWidth / 2),
      bodyBottom,
    );

    path.lineTo(cornerRadius, bodyBottom);
    path.arcToPoint(
      Offset(0, bodyBottom - cornerRadius),
      radius: Radius.circular(cornerRadius),
    );

    path.lineTo(0, cornerRadius);
    path.arcToPoint(
      Offset(cornerRadius, 0),
      radius: Radius.circular(cornerRadius),
    );

    path.close();

    // // ===============================
    // // 🔥 SOMBRA APENAS INFERIOR
    // // ===============================
    // final shadowPaint = Paint()
    //   ..color = Colors.black.withOpacity(0.25)
    //   ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    // canvas.save();
    // canvas.translate(0, 4); // 👈 desloca SOMENTE para baixo
    // canvas.drawPath(path, shadowPaint);
    // canvas.restore();
    // ===============================
// SOMBRA TIPO MATERIAL ELEVATION
// ===============================
    final contactShadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.22)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);

    final ambientShadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

// 🔹 sombra de contato (bem curta)
    canvas.save();
    canvas.translate(0, 2);
    canvas.drawPath(path, contactShadowPaint);
    canvas.restore();

// 🔹 sombra ambiente (mais difusa)
    canvas.save();
    canvas.translate(0, 5);
    canvas.drawPath(path, ambientShadowPaint);
    canvas.restore();

    // ===============================
    // PIN PRINCIPAL
    // ===============================
    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(MarkerPainterV2 oldDelegate) =>
      oldDelegate.borderColor != borderColor ||
      oldDelegate.fillColor != fillColor ||
      oldDelegate.arrowSize != arrowSize;
}
