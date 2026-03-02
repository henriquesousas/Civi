import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String title;

  const TitleSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color(0xFF8A96C8),
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
