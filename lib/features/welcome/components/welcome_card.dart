import 'package:deehelp/features/welcome/welcome_feature.dart';
import 'package:deehelp/shared/components/icons/primary_icon.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class WelcomeCard extends StatelessWidget {
  final WelcomeFeature feature;
  const WelcomeCard({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        elevation: 8,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                feature.gradient.colors.first.withValues(alpha: 0.05),
              ],
            ),
          ),
          padding: const EdgeInsets.all(32),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryIcon(
                width: 70,
                height: 70,
                borderRadius: 40,
                icon: Icon(
                  feature.icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              // const SizedBox(height: 30),
              Text(
                feature.title,
                style: context.getTextStyle.medium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              // const SizedBox(height: 10),
              Text(
                feature.description,
                textAlign: TextAlign.center,
                style: context.getTextStyle.regular.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
