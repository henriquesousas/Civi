import 'package:flutter/material.dart';

class UISoftGradientCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Color baseColor;
  final double? width;
  final double? height;

  const UISoftGradientCard({
    Key? key,
    required this.child,
    this.borderRadius = 16,
    this.padding = const EdgeInsets.all(20),
    this.baseColor = const Color(0xFF2B5BEE),
    this.width,
    this.height,
  }) : super(key: key);

  Color _lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness(
          (hsl.lightness + amount).clamp(0.0, 1.0),
        )
        .toColor();
  }

  @override
  Widget build(BuildContext context) {
    final Color ultraLightBlue = _lighten(baseColor, 0.48);
    final Color softLightBlue = _lighten(baseColor, 0.34);

    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ultraLightBlue,
            softLightBlue,
          ],
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: baseColor.withOpacity(0.06),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}
