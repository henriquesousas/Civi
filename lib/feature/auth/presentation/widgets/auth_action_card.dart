import 'package:deehelp/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class AuthActionCard extends StatelessWidget {
  final Widget child;
  const AuthActionCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(RadiusSize.lg),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 22,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: child,
    );
  }
}
