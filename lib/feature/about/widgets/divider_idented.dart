import 'package:flutter/material.dart';

class DividerIndented extends StatelessWidget {
  const DividerIndented({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      indent: 52,
      color: Color(0xFFE6EAF6),
    );
  }
}
