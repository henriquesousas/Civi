import 'package:flutter/material.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/app/localization/image_config.dart';
import 'package:yousafe/app/theme/size_config.dart';
import 'package:yousafe/shared/extensions/screen_size_extension.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

class UICard extends StatelessWidget {
  final List<String> titles;
  final void Function(int) onTap;
  const UICard({super.key, required this.titles, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.percentHeight(0.05) * titles.length,
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
          for (var index = 0; index < titles.length; index++) ...[
            GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      titles[index],
                      style: context.getTextStyle.smallMedium,
                    ),
                    Image.asset(
                      ImageConfig.nextArrow,
                      width: SizeConfig.width18,
                      height: SizeConfig.height18,
                    ),
                  ],
                ),
              ),
            ),
            if (index < titles.length - 1) Divider(color: AppColors.lineColor),
          ],
        ],
      ),
    );
  }
}
