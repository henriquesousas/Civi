import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/core/ui/widgets/textfield/ui_text_field_rounded.dart';
import 'package:deehelp/features/auth/domain/utils/nickname_utils.dart';
import 'package:flutter/material.dart';

class AddNicknamePage extends StatelessWidget {
  final String userName;
  const AddNicknamePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return UICustomScaffold(
      pageTitle: "Apelido",
      body: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Olá, ",
                  style: context.appTextStyles.sectionSubTitle1.copyWith(
                    color: AppColors.textColorBody,
                  ),
                ),
                TextSpan(
                  text: "$userName! ",
                  style: context.appTextStyles.sectionSubTitle1.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      "Para deixar seus relatos mais seguros e preservar sua identidade, escolha um",
                  style: context.appTextStyles.sectionSubTitle1.copyWith(
                    color: AppColors.textColorBody,
                  ),
                ),
                TextSpan(
                  text: " apelido ",
                  style: context.appTextStyles.sectionSubTitle1.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextSpan(
                  text:
                      "em vez do seu nome verdadeiro. Assim você continua anônimo, mas consegue acompanhar tudo o que registrar com tranquilidade.",
                  style: context.appTextStyles.sectionSubTitle1.copyWith(
                    color: AppColors.textColorBody,
                  ),
                ),
              ],
            ),
          ),
          const UITextFieldRounded(
            textInputAction: TextInputAction.next,
            isRequired: true,
            labelText: "Apelido",
            showLabelText: false,
            hintText: "Digite seu apelido...",
          ),
          UIElevatedButton(text: "Confimar apelido", press: () {}),
          UIElevatedButton(
            text: "Gerar apelido",
            press: () => debugPrint(NicknameUtils().generate()),
            bgColor: AppColors.whiteColor,
            borderColor: AppColors.primaryColor,
            textColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
