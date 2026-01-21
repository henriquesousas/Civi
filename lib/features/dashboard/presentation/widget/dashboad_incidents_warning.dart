import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/widgets/icon/ui_icon.dart';
import 'package:flutter/material.dart';

class DashboadIncidentsWarning extends StatelessWidget {
  const DashboadIncidentsWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          const UIICon(
            bgColor: AppColors.greyColor,
            icon: Icon(
              Icons.inventory,
              color: AppColors.textColorBody,
            ),
            isAlpha: true,
          ),
          Text(
            textAlign: TextAlign.center,
            "Aqui aparecerá as ocorrências que foram \nregistradas nas últimas horas.",
            style: context.appTextStyles.sectionSubTitle1
                .copyWith(letterSpacing: 1.0),
          ),
          Text(
            textAlign: TextAlign.center,
            "Mantenha seu GPS ligado.",
            style: context.appTextStyles.sectionSubTitle1
                .copyWith(letterSpacing: 1.0),
          ),
        ],
      ),
    );
  }
}
