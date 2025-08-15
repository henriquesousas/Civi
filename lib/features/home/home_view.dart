import 'package:flutter/material.dart';
import 'package:yousafe/app/localization/image_config.dart';
import 'package:yousafe/app/localization/string_config.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/app/theme/size_config.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

import '../../l10n/app_localizations.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(SizeConfig.height125),
        child: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(
              left: SizeConfig.padding08,
              right: SizeConfig.padding08,
              top: SizeConfig.padding15,
              bottom: SizeConfig.padding08,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // StringConfig.hiUser,
                          "Hello",
                          style: context.getTextStyle.medium,
                        ),
                        Text(
                          StringConfig.lastOcorrenceNearYou,
                          style: context.getTextStyle.small,
                        ),
                      ],
                    ),
                    Image(
                      image: const AssetImage(ImageConfig.notification),
                      width: SizeConfig.width20,
                      color: AppColors.primaryColor,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
