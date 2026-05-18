import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/widgets/buttons/ui_button_tertiary.dart';
import 'package:flutter/material.dart';

class ItemBadge extends StatelessWidget {
  final String urlBadge;
  final bool isUnlocked;
  const ItemBadge(
      {super.key, required this.urlBadge, required this.isUnlocked});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizeLayoutSpacing.m),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeRadius.m),
        color: context.themeColor.secundaryBgColor,
      ),
      child: Column(
        children: [
          Expanded(
            child: Opacity(
              opacity: isUnlocked ? 1.0 : 0.4,
              child: ColorFiltered(
                colorFilter: isUnlocked
                    ? const ColorFilter.mode(Colors.transparent, BlendMode.dst)
                    : const ColorFilter.matrix([
                        0.2126,
                        0.7152,
                        0.0722,
                        0,
                        0,
                        0.2126,
                        0.7152,
                        0.0722,
                        0,
                        0,
                        0.2126,
                        0.7152,
                        0.0722,
                        0,
                        0,
                        0,
                        0,
                        0,
                        1,
                        0,
                      ]),
                child: Image.asset(
                  urlBadge,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Text(
            "Hero Badge",
            style: context.appText.subtitle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: SizeSpacing.s),
          UIButtonTertiary(
            height: SizeButton.s,
            radius: SizeRadius.s,
            text: "Saiba mais",
            press: () {},
          )
        ],
      ),
    );
  }
}
