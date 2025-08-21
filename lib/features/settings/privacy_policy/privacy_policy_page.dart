import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yousafe/app/localization/image_config.dart';
import 'package:yousafe/app/localization/string_config.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/app/theme/size_config.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final terms = List.of([
      StringConfig.policyString1,
      StringConfig.policyString2,
      StringConfig.policyString3,
      StringConfig.policyString4,
    ]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(
            left: SizeConfig.padding05,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => context.pop(),
                child: const Image(
                  image: AssetImage(ImageConfig.backArrow),
                  width: SizeConfig.width24,
                  height: SizeConfig.height24,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(width: SizeConfig.width10),
              Text(
                StringConfig.privacyPolicy,
                style: context.getTextStyle.medium,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
        ),
        child: ListView.builder(
          itemCount: terms.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(height: SizeConfig.height10),
                Text(
                  terms[index],
                  style: context.getTextStyle.small,
                ),
                const SizedBox(height: SizeConfig.height16),
              ],
            );
          },
        ),
      ),
    );
  }
}
