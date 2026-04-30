import 'package:deehelp/core/extension/size_extension.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/widgets/icon/ui_icon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapTopbar extends StatelessWidget {
  const MapTopbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(
          top: context.topPadding + 12,
          left: SizeLayoutSpacing.m,
          right: SizeLayoutSpacing.m,
          bottom: SizeLayoutSpacing.m,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000), // preto forte
              Color(0xE6000000), // preto com leve transparência
              Color(0x99000000), // fade
              Colors.transparent, // dissolve no mapa
            ],
          ),
        ),
        child: Row(
          spacing: 10,
          children: [
            const Icon(
              Icons.location_city,
              color: Colors.white,
              size: SizeIcon.m,
            ),
            Text(
              'Osasco',
              style: context.appText.title.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            UIIconCard(
              bgColor: Colors.white.withValues(alpha: 0.12),
              radius: 9999,
              width: SizeIcon.xl.w,
              height: SizeIcon.xl.h,
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
