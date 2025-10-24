import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:deehelp/app/theme/app_colors.dart';
import 'package:deehelp/app/theme/size_config.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';

class UICardSwitch extends StatelessWidget {
  final String title;
  const UICardSwitch({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: context.percentHeight(0.2),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: SizeConfig.padding14,
        horizontal: SizeConfig.padding16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: context.getTextStyle.smallMedium,
                  ),
                  FlutterSwitch(
                    width: SizeConfig.width42,
                    height: SizeConfig.height20,
                    inactiveColor: AppColors.modeInactiveColor,
                    toggleSize: SizeConfig.width16,
                    padding: SizeConfig.padding02,
                    activeColor: Theme.of(context).colorScheme.primary,
                    borderRadius: 40,
                    value: false,
                    onToggle: (value) {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
