import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:deehelp/app/localization/image_config.dart';
import 'package:deehelp/app/localization/string_config.dart';
import 'package:deehelp/app/theme/app_colors.dart';
import 'package:deehelp/app/theme/size_config.dart';
import 'package:deehelp/features/settings/faq/components/ui_expansion_tile.dart';
import 'package:deehelp/features/settings/faq/state/faq_bloc.dart';
import 'package:deehelp/features/settings/faq/state/faq_event.dart';
import 'package:deehelp/features/settings/faq/state/faq_state.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';

enum FAQ { faq1, faq2, faq3, faq4, faq5, faq6, faq7 }

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle getStyle(
        BuildContext context, Set<int> expandedIndexes, int currentIndex) {
      return expandedIndexes.contains(currentIndex)
          ? context.getTextStyle.smallMedium.copyWith(
              fontWeight: FontWeight.w600,
            )
          : context.getTextStyle.smallMedium;
    }

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
      body: BlocBuilder<FaqBloc, FaqState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(
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
                    onExpansionChanged: (value) {
                      context
                          .read<FaqBloc>()
                          .add(FaqChangedEvent(FAQ.faq1.index, value));
                    },
                    answerStyle: getStyle(
                        context, state.expandedIndexes, FAQ.faq1.index),
                  ),
                  UiExpansionTile(
                    question: StringConfig.question2,
                    answer: StringConfig.answer2,
                    onExpansionChanged: (value) {
                      context
                          .read<FaqBloc>()
                          .add(FaqChangedEvent(FAQ.faq2.index, value));
                    },
                    answerStyle: getStyle(
                        context, state.expandedIndexes, FAQ.faq2.index),
                  ),
                  UiExpansionTile(
                    question: StringConfig.question3,
                    answer: StringConfig.answer3,
                    onExpansionChanged: (value) {
                      context
                          .read<FaqBloc>()
                          .add(FaqChangedEvent(FAQ.faq3.index, value));
                    },
                    answerStyle: getStyle(
                        context, state.expandedIndexes, FAQ.faq3.index),
                  ),
                  UiExpansionTile(
                    question: StringConfig.question4,
                    answer: StringConfig.answer4,
                    onExpansionChanged: (value) {
                      context
                          .read<FaqBloc>()
                          .add(FaqChangedEvent(FAQ.faq4.index, value));
                    },
                    answerStyle: getStyle(
                        context, state.expandedIndexes, FAQ.faq4.index),
                  ),
                  UiExpansionTile(
                    question: StringConfig.question5,
                    answer: StringConfig.answer5,
                    onExpansionChanged: (value) {
                      context
                          .read<FaqBloc>()
                          .add(FaqChangedEvent(FAQ.faq5.index, value));
                    },
                    answerStyle: getStyle(
                        context, state.expandedIndexes, FAQ.faq5.index),
                  ),
                  UiExpansionTile(
                    question: StringConfig.question6,
                    answer: StringConfig.answer6,
                    onExpansionChanged: (value) {
                      context
                          .read<FaqBloc>()
                          .add(FaqChangedEvent(FAQ.faq6.index, value));
                    },
                    answerStyle: getStyle(
                        context, state.expandedIndexes, FAQ.faq6.index),
                  ),
                  UiExpansionTile(
                    question: StringConfig.question7,
                    answer: StringConfig.answer7,
                    onExpansionChanged: (value) {
                      context
                          .read<FaqBloc>()
                          .add(FaqChangedEvent(FAQ.faq7.index, value));
                    },
                    answerStyle: getStyle(
                        context, state.expandedIndexes, FAQ.faq7.index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
