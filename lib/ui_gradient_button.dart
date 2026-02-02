import 'package:flutter/material.dart';

class UIGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Gradient? gradient;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;

  const UIGradientButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.gradient,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultGradient = const LinearGradient(
      colors: [
        Color.fromARGB(255, 18, 69, 225),
        Color(0xFF4B7BFF),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Container(
      height: 50,
      decoration: BoxDecoration(
        gradient: gradient ?? defaultGradient,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF2B5BEE).withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: gradient ?? defaultGradient,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Container(
            padding: padding,
            alignment: Alignment.center,
            child: Text(
              text,
              // style: textStyle ??
              //     TextStyle(
              //       color: Colors.white,
              //       fontSize: 16,
              //       fontWeight: FontWeight.bold,
              //     ),
            ),
          ),
        ),
      ),
    );
  }
}

// Como usar:
// GradientButton(
//   text: 'Clique Aqui',
//   onPressed: () {
//     print('Botão pressionado!');
//   },
// )
