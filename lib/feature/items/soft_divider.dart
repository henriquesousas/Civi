import 'package:flutter/material.dart';

class SoftDivider extends StatelessWidget {
  const SoftDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      indent: 70,
      color: Color(0xFFE6EAF6),
    );
  }
}
