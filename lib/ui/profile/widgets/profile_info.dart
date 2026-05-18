import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/ui/profile/widgets/profile_state_item.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/widgets/buttons/export_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeLayoutSpacing.l),
      child: Column(
        children: [
          SizedBox(height: 60.h),
          Text(
            "Paulo Soares",
            style: context.appText.header,
          ),
          const SizedBox(height: SizeSpacing.s),
          Text(
            "@paulosoares",
            style: context.appText.subtitle.copyWith(
              color: context.themeColor.secundaryTextColor,
            ),
          ),
          const SizedBox(height: SizeSpacing.m),
          UIButtonIcon(
            press: () {},
            width: context.percentWidth(0.5),
            title: "Mensagem",
            icon: const Icon(
              Icons.message_rounded,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: SizeSpacing.xl),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfileStateItem(value: "01", label: "Items"),
              ProfileStateItem(value: "03", label: "Alertas"),
              ProfileStateItem(value: "Hero", label: "Rank"),
            ],
          ),
          const SizedBox(height: SizeSpacing.xl),
          Text(
            "Ajudando a proteger minha comunidade e monitorar veículos e alertas em tempo real.",
            textAlign: TextAlign.center,
            style: context.appText.subtitle.copyWith(
              color: context.themeColor.secundaryTextColor,
            ),
          ),
          const SizedBox(height: SizeSpacing.l),
          const Row(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.white54,
                size: SizeIcon.s,
              ),
              Text(
                "Osasco, SP",
                style: TextStyle(
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
