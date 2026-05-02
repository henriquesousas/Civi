import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/widgets/icon/export_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePremiumCard extends StatelessWidget {
  const ProfilePremiumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: SizeLayoutSpacing.m),
      padding: const EdgeInsets.all(SizeSpacing.l),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeRadius.s),
        border: Border.all(
          color: Colors.white.withValues(alpha: .06),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF111827),
            Color(0xFF0B1220),
            Colors.black,
          ],
        ),
      ),
      child: Row(
        children: [
          UIIconCard(
            width: SizeIcon.xxl.w,
            height: SizeIcon.xxl.h,
            radius: SizeRadius.xs,
            bgColor: Colors.transparent,
            border: Border.all(
              color: const Color(0xFF6B8DFF),
            ),
            icon: const Icon(
              CupertinoIcons.sparkles,
              color: Color(0xFF7DA2FF),
              size: SizeIcon.m,
            ),
          ),
          const SizedBox(width: SizeSpacing.s),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Faça upgrade para o Premium',
                  style: context.appText.title.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: SizeSpacing.xs),
                Text(
                  'Obtenha acesso a todos os recursos do Civi',
                  style: context.appText.subtitle.copyWith(
                    color: context.themeColor.secundaryTextColor,
                  ),
                ),
                const SizedBox(height: SizeSpacing.s),
                Text(
                  'SAIBA MAIS',
                  style: context.appText.caption.copyWith(
                    color: const Color(0xFF6C8FFF),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
