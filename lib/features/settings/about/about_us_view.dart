import 'package:deehelp/app/localization/image_config.dart';
import 'package:deehelp/app/localization/string_config.dart';
import 'package:deehelp/app/theme/app_colors_v2.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final terms = List.of([
      StringConfig.aboutUs1,
      StringConfig.aboutUs2,
      StringConfig.aboutUs3,
      StringConfig.aboutUs4Bold,
    ]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorsV2.backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 05,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => context.pop(),
                child: Image(
                  image: const AssetImage(ImageConfig.backArrow),
                  width: 24,
                  height: 24,
                  color: AppColorsV2.primaryColor,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                StringConfig.aboutUs,
                style: context.getTextStyle.medium,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: ListView.builder(
          itemCount: terms.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  terms[index],
                  style: context.getTextStyle.small,
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}
