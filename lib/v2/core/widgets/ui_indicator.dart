import 'package:deehelp/core/extension/size_extension.dart';
import 'package:flutter/material.dart';

class UIIndicator extends StatelessWidget {
  const UIIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.percentWidth(0.15),
      height: 5,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }
}
