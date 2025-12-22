import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/core/ui/widgets/textfield/ui_text_field_rounded.dart';
import 'package:deehelp/features/auth/domain/utils/nickname_utils.dart';
import 'package:flutter/material.dart';

class AddNicknamePage extends StatelessWidget {
  const AddNicknamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return UICustomScaffold(
      pageTitle: "Apelido",
      body: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Para sua segurança, utilize um apelido em vez de seu nome verdadeiro. Este identificador protegerá sua identidade nas ocorrências registradas, mantendo o anonimato enquanto permite que acompanhe seus próprios relatos.",
            style: context.appTextStyles.sectionSubTitle1.copyWith(
              color: AppColors.textColorBody,
            ),
          ),
          const UITextFieldRounded(
            textInputAction: TextInputAction.next,
            isRequired: true,
            labelText: "Apelido",
            showLabelText: false,
            hintText: "Qual será seu apelido...",
          ),
          UIElevatedButton(text: "Salvar", press: () {}),
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
