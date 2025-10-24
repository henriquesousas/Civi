import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:deehelp/app/localization/image_config.dart';
import 'package:deehelp/app/localization/string_config.dart';
import 'package:deehelp/app/theme/app_colors.dart';
import 'package:deehelp/app/theme/size_config.dart';

class UIHeader extends StatelessWidget {
  final String fullName;
  const UIHeader({super.key, required this.fullName});

  @override
  Widget build(BuildContext context) {
    String firstName = fullName.isNotEmpty ? StringConfig.fakeName[0] : "";
    String lastName = fullName.isNotEmpty ? fullName.split(" ")[1][0] : "";

    return Container(
      height: SizeConfig.height88,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: SizeConfig.padding12,
        horizontal: SizeConfig.padding16,
      ).copyWith(left: SizeConfig.padding12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: SizeConfig.height64 / 2,
                // backgroundColor: Theme.of(context).colorScheme.onSecondary,
                backgroundColor: AppColors.bottomNavigationSelected,
                child: Text(
                  "$firstName$lastName",
                  style: context.getTextStyle.medium.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              const SizedBox(width: SizeConfig.width12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(fullName, style: context.getTextStyle.mediumSmall),
                  const SizedBox(height: SizeConfig.height06),
                  Text(StringConfig.addressMobile1,
                      style: context.getTextStyle.small),
                ],
              ),
            ],
          ),
          Image.asset(
            ImageConfig.nextArrow,
            width: SizeConfig.width20,
            height: SizeConfig.height20,
          ),
        ],
      ),
    );
  }
}
