import 'package:deehelp/module/external/di/authenticated_user_provider.dart';
import 'package:deehelp/old_features/profile/external/di/profile_viewmodel_provider.dart';
import 'package:deehelp/old_core/ui/router/app_router.dart';
import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/old_core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/old_core/ui/widgets/textfield/ui_text_field_rounded.dart';
import 'package:deehelp/old_features/profile/presentation/views/add_nickname/state/nickname_state.dart';
import 'package:deehelp/old_features/profile/presentation/views/add_nickname/widget/suggest_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddNicknamePage extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();
  AddNicknamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(nicknameViewModelProvider.notifier);
    final state = ref.watch(nicknameViewModelProvider);

    final authenticatedUser = ref.watch(authenticatedUserProvider);

    ref.listen<NicknameState>(
      nicknameViewModelProvider,
      (previous, currentState) {
        if (currentState.isSuccess) {
          context.pushReplacement(AppRouter.map);
        }
      },
    );

    return UICustomScaffold(
      pageTitle: "Apelido",
      showBackButton: false,
      body: SingleChildScrollView(
        child: Column(
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
                    text: "${authenticatedUser?.name} ",
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
            UITextFieldRounded(
              textInputAction: TextInputAction.next,
              isRequired: true,
              labelText: "Apelido",
              showLabelText: false,
              hintText: "Digite seu apelido...",
              error: state.errorMessage,
              controller: _controller,
              onChanged: (value) => viewModel.onNicknameChange(value),
              // controller: nickNameController,
            ),
            UIElevatedButton(
              text: "Confimar apelido",
              isEnabled: state.isFormValid,
              press: () => viewModel.addNickname(authenticatedUser!),
              isLoading: state.isLoading,
            ),
            UIElevatedButton(
              text: "Gerar apelido",
              press: () {
                viewModel.suggestedNicknames();
              },
              bgColor: AppColors.whiteColor,
              borderColor: AppColors.primaryColor,
              textColor: AppColors.primaryColor,
            ),
            SuggestName(
              suggestedNicknames: state.suggestedNicknames,
              press: (selectedNickname) {
                _controller.text = selectedNickname;
                viewModel.onNicknameChange(selectedNickname);
              },
            )
          ],
        ),
      ),
    );
  }
}
