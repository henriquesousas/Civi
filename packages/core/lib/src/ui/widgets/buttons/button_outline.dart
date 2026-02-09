import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

class ButtonOutline extends StatelessWidget {
  final VoidCallback press;
  final String text;
  const ButtonOutline({super.key, required this.press, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ButtonSize.sm,
      child: OutlinedButton.icon(
        onPressed: press,
        icon: const Icon(Icons.share_outlined),
        label: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: context.primaryColor(),
          side:
              BorderSide(color: context.primaryColor().withValues(alpha: 0.32)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RadiusSize.md),
          ),
        ),
      ),
    );
  }
}
