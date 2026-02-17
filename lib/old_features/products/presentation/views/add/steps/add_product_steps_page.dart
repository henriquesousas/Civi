import 'package:deehelp/old_core/ui/router/app_router.dart';
import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/feature/items/register/viewmodel/register_item_viewmodel.dart';
import 'package:deehelp/feature/items/register/viewmodel/add_product_state.dart';
import 'package:deehelp/module/item/di/item_viewmodel_provider.dart';
import 'package:deehelp/old_features/products/presentation/views/add/steps/step_add_obs.dart';
import 'package:deehelp/old_features/products/presentation/views/add/steps/step_add_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'step_add_product_info_detail.dart';

enum PageStep {
  info(0),
  obs(1),
  photo(2);

  final int value;
  const PageStep(this.value);
}

class AddProductStepPage extends ConsumerStatefulWidget {
  const AddProductStepPage({super.key});

  @override
  ConsumerState<AddProductStepPage> createState() => _AddProductStepPageState();
}

class _AddProductStepPageState extends ConsumerState<AddProductStepPage> {
  List<Step> _steps = [];

  void _buildSteps(int currentStep) {
    _steps = [
      Step(
        title: Text(
          "Detalhes do veículo",
          style: context.appTextStyles.bodyTextStyle1,
        ),
        content: const StepAddProductInfoDetail(),
        isActive: currentStep == 0,
      ),
      Step(
        title: Text("Observação", style: context.appTextStyles.bodyTextStyle1),
        content: const StepAddObs(),
        isActive: currentStep == 1,
      ),
      Step(
        title: Text("Foto", style: context.appTextStyles.bodyTextStyle1),
        content: const StepAddPhoto(),
        isActive: currentStep == 2,
      ),
    ];
  }

  void _nextStep(int currentStep, RegisterItemViewmodel viewModel) {
    viewModel.nextStep(currentStep);
  }

  void _save(RegisterItemViewmodel viewModel) {
    viewModel.save("a5c33b3e-7c0e-4ea9-99ae-2c87d3f2da46");
  }

  void _previousStep(int currentStep, RegisterItemViewmodel viewModel) {
    viewModel.previous(currentStep);
  }

  bool isValidStep(AddProductState state) {
    if (state.currentStep == PageStep.info.value) {
      return state.stepAddProductInfoDetailValid ?? false;
    }

    if (state.currentStep == PageStep.obs.value) {
      return true;
    }

    if (state.currentStep == PageStep.photo.value) {
      return state.stepAddPhotoValid;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerItemViewModelProvider);
    final viewModel = ref.watch(registerItemViewModelProvider.notifier);
    _buildSteps(state.currentStep);

    ref.listen<AddProductState>(
      registerItemViewModelProvider,
      (previous, currentState) {
        if (currentState.isSuccess) {
          context.pushReplacement(AppRouter.addProductSuccess);
          return;
        }

        if (currentState.errorMessage != null) {
          final snackBar = SnackBar(
            backgroundColor: AppColors.errorColor,
            content: Text(currentState.errorMessage!),
            duration: const Duration(seconds: 4),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
    );

    return Column(
      children: [
        Expanded(
          child: Stepper(
            connectorColor: WidgetStateColor.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.primaryColor;
              }
              if (states.contains(WidgetState.disabled)) {
                return AppColors.primaryColor.withValues(alpha: 0.5);
              }
              return AppColors.errorColor;
            }),
            onStepCancel: () => {
              // if (controller.currentStep > 0) {
              //   controller.setCurrentStep(
              //     controller.currentStep - 1,
              //     steps.length,
              //   );
              // }
            },
            controlsBuilder: (context, details) {
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    if (state.currentStep > 0)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                            end: 16,
                          ),
                          child: UIElevatedButton(
                            borderColor: AppColors.lightGreyColor20,
                            bgColor: AppColors.whiteColor,
                            textColor: AppColors.textColorBody,
                            text: "Voltar",
                            press: () =>
                                _previousStep(details.currentStep, viewModel),
                          ),
                        ),
                      ),
                    Expanded(
                      child: UIElevatedButton(
                          bgColor: AppColors.primaryColor,
                          text: state.currentStep == _steps.length - 1
                              ? "Confirmar"
                              : "Próximo",
                          isLoading: state.isLoading,
                          isEnabled: isValidStep(state),
                          press: () {
                            if (details.currentStep == PageStep.photo.value) {
                              _save(viewModel);
                              return;
                            }
                            _nextStep(details.currentStep, viewModel);
                          }),
                    ),
                  ],
                ),
              );
            },
            type: StepperType.vertical,
            currentStep: state.currentStep.clamp(0, _steps.length - 1),
            onStepTapped: (value) {},
            steps: _steps,
          ),
        )
      ],
    );
  }
}
