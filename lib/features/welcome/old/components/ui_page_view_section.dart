import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:deehelp/app/theme/size_config.dart';
import 'package:deehelp/features/welcome/old/components/ui_dot.dart';
import 'package:deehelp/features/welcome/old/welcome.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';

import '../state/welcome_bloc.dart';

class UIPageViewSection extends StatelessWidget {
  final Welcome welcome;
  final ValueChanged<int> onPageChanged;
  final PageController pageController;

  const UIPageViewSection({
    super.key,
    required this.welcome,
    required this.onPageChanged,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final int currentPage = context.watch<WelcomeBloc>().state.page;

    return Expanded(
      child: PageView.builder(
        controller: pageController,
        itemCount: Welcome.getPages.length,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          final page = Welcome.getPages[index];

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      page.image ?? "",
                      width: context.percentWidth(0.5),
                      height: context.percentHeight(0.4),
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: SizeConfig.height50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  Welcome.getPages.length,
                  (i) => UIDot(index: i, currentPage: currentPage),
                ),
              ),
              const SizedBox(height: SizeConfig.height40),
              Text(
                page.title ?? "",
                textAlign: TextAlign.center,
                style: context.getTextStyle.mediumLarge,
              ),
              const SizedBox(height: SizeConfig.height10),
              Text(
                page.description ?? "",
                textAlign: TextAlign.center,
                style: context.getTextStyle.small,
              ),
              const SizedBox(height: SizeConfig.height20),
            ],
          );
        },
      ),
    );
  }
}
