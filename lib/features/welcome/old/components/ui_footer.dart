import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yousafe/app/localization/image_config.dart';
import 'package:yousafe/app/localization/string_config.dart';
import 'package:yousafe/app/theme/size_config.dart';
import 'package:yousafe/features/welcome/old/welcome.dart';
import 'package:yousafe/shared/components/buttons/primary_button.dart';

import '../state/welcome_bloc.dart';

class UIFooter extends StatelessWidget {
  final VoidCallback onTap;
  const UIFooter({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final int currentPage = context.watch<WelcomeBloc>().state.page;
    final bool isLastPage = currentPage == Welcome.getPages.length - 1;

    return SizedBox(
      height: SizeConfig.height75,
      child: Column(
        children: [
          if (!isLastPage)
            GestureDetector(
              onTap: () => onTap(),
              child: Image.asset(
                ImageConfig.onBoardGo,
                width: SizeConfig.width52,
              ),
            ),
          if (isLastPage)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: SizeConfig.padding24,
              ),
              child: PrimaryButton(
                text: StringConfig.textButtonStart,
                onPressed: () => onTap(),
              ),
            ),
        ],
      ),
    );
  }
}
