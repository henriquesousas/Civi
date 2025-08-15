import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yousafe/app/localization/string_config.dart';
import 'package:yousafe/app/router/router_config.dart';
import 'package:yousafe/features/welcome/old/welcome.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

class UISkip extends StatelessWidget {
  final int currentPage;
  const UISkip({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: Visibility(
        visible: currentPage != Welcome.getPages.length - 1,
        child: GestureDetector(
          onTap: () => context.go(Routes.profile),
          child: Text(
            StringConfig.textButtonSkip,
            textAlign: TextAlign.center,
            // style: AppTextStyle.h2Light,
            style: context.getTextStyle.smallMedium,
          ),
        ),
      ),
    );
  }
}
