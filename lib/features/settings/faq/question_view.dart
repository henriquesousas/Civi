import 'package:flutter/material.dart';
import 'package:yousafe/app/localization/image_config.dart';
import 'package:yousafe/app/localization/string_config.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/app/theme/size_config.dart';
import 'package:yousafe/features/settings/faq/components/ui_expansion_tile.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({super.key});

  @override
  Widget build(BuildContext context) {
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
              const Image(
                image: AssetImage(ImageConfig.backArrow),
                width: SizeConfig.width24,
                height: SizeConfig.height24,
                color: AppColors.primaryColor,
              ),
              const SizedBox(width: SizeConfig.width10),
              Text(
                StringConfig.frequentlyQuestion,
                style: context.getTextStyle.medium,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: SizeConfig.padding24,
              left: SizeConfig.padding24,
              top: SizeConfig.padding10,
              bottom: SizeConfig.padding10,
            ),
            child: GestureDetector(
              child: const Image(
                image: AssetImage(ImageConfig.search),
                width: SizeConfig.width20,
                height: SizeConfig.height20,
                color: AppColors.primaryColor,
              ),
            ),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
          top: SizeConfig.padding24,
          bottom: SizeConfig.padding10,
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: SizeConfig.height12,
            children: [
              UiExpansionTile(
                question: StringConfig.question1,
                answer: StringConfig.answer1,
              ),
              UiExpansionTile(
                question: StringConfig.question2,
                answer: StringConfig.answer2,
              ),
              UiExpansionTile(
                question: StringConfig.question3,
                answer: StringConfig.answer3,
              ),
              UiExpansionTile(
                question: StringConfig.question4,
                answer: StringConfig.answer4,
              ),
              UiExpansionTile(
                question: StringConfig.question5,
                answer: StringConfig.answer5,
              ),
              UiExpansionTile(
                question: StringConfig.question6,
                answer: StringConfig.answer6,
              ),
              UiExpansionTile(
                question: StringConfig.question7,
                answer: StringConfig.answer7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
