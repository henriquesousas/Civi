import 'package:app_core/src/theme/app_colors.dart';
import 'package:app_core/src/theme/size/badge_size.dart.dart';
import 'package:app_core/src/theme/size/radius_size.dart';
import 'package:app_core/src/ui/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class CardCounter extends StatelessWidget {
  final int counter;
  const CardCounter({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: BadgeSizes.lg,
      height: BadgeSizes.lg,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusSize.md),
        gradient: const LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColorVariant,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          '$counter',
          style: context.appText.section.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
