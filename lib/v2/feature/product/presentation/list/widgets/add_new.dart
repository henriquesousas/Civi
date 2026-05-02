import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/widgets/icon/ui_icon_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNew extends StatelessWidget {
  const AddNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SizeLayoutSpacing.m,
      ),
      child: Material(
        color: context.themeColor.primaryBgColor,
        borderRadius: BorderRadius.circular(SizeRadius.xxs),
        child: InkWell(
          borderRadius: BorderRadius.circular(SizeRadius.xxs),
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: SizeLayoutSpacing.m,
              vertical: SizeLayoutSpacing.xs,
            ),
            child: Row(
              children: [
                const UIIconCard(
                  width: SizeIcon.xxl,
                  height: SizeIcon.xxl,
                  radius: SizeRadius.xxs,
                  bgColor: Colors.white,
                  icon: Icon(
                    Icons.add_rounded,
                    color: Colors.black,
                    size: SizeIcon.m,
                  ),
                ),
                const SizedBox(width: SizeSpacing.m),
                Expanded(
                  child: Text(
                    'Adicionar item',
                    style: context.appText.subtitle.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Icon(
                  CupertinoIcons.chevron_right,
                  size: SizeIcon.s,
                  color: context.themeColor.secundaryTextColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
