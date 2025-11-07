import 'package:deehelp/app/localization/image_config.dart';
import 'package:deehelp/app/localization/string_config.dart';
import 'package:deehelp/app/theme/app_colors_v2.dart';
import 'package:deehelp/app/theme/size_config.dart';
import 'package:deehelp/features/settings/faq/components/ui_expansion_tile.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorsV2.backgroundColor,
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
                color: AppColorsV2.primaryColor,
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
                color: AppColorsV2.primaryColor,
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
              UIExpansionTile(
                question: StringConfig.question1,
                answer: StringConfig.answer1,
              ),
              UIExpansionTile(
                question: StringConfig.question2,
                answer: StringConfig.answer2,
              ),
              UIExpansionTile(
                question: StringConfig.question3,
                answer: StringConfig.answer3,
              ),
              UIExpansionTile(
                question: StringConfig.question4,
                answer: StringConfig.answer4,
              ),
              UIExpansionTile(
                question: StringConfig.question5,
                answer: StringConfig.answer5,
              ),
              UIExpansionTile(
                question: StringConfig.question6,
                answer: StringConfig.answer6,
              ),
              UIExpansionTile(
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
