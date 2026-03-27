import 'package:flutter/material.dart';

class FaqCard extends StatelessWidget {
  final Widget child;
  const FaqCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: context.secondaryContainer,
      //   borderRadius: BorderRadius.circular(RadiusSize.xxl),
      //   boxShadow: const [
      //     BoxShadow(
      //       color: Color(0x142B5BEE),
      //       blurRadius: 16,
      //       offset: Offset(0, 8),
      //     ),
      //   ],
      // ),
      decoration: BoxDecoration(
        color: const Color(0xFF101012),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF1D1D21)),
      ),
      child: child,
    );
  }
}
