import 'package:deehelp/core/services/media/image_picker_service.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/features/products/view/create/create_product_cubit.dart';
import 'package:deehelp/features/products/view/create/state/create_product_state.dart';
import 'package:deehelp/features/products/view/create/steps/step_add_photo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/router_constants.dart';
import '../../../../../core/ui/theme/app_colors.dart';
import '../../../../../core/ui/theme/dimens.dart';
import '../../../../../core/ui/widgets/button/ui_elevated_button.dart';
import 'step_add_info_detal.dart';
import 'step_add_obs.dart';

class CreateProductSteps extends StatefulWidget {
  const CreateProductSteps({super.key});

  @override
  State<CreateProductSteps> createState() => _CreateProductStepsState();
}

class _CreateProductStepsState extends State<CreateProductSteps> {
  List<Step> _steps = [];

  void _buildSteps(int currentStep) {
    _steps = [
      Step(
        title: Text(
          "Detalhes do veículo",
          style: context.appTextStyles.bodyTextStyle1,
        ),
        content: const StepAddInfoDetail(),
        isActive: currentStep == 0,
      ),
      Step(
        title: Text("Observação", style: context.appTextStyles.bodyTextStyle1),
        content: const StepAddObs(),
        isActive: currentStep == 1,
      ),
      Step(
        title: Text("Foto", style: context.appTextStyles.bodyTextStyle1),
        content: StepAddPhoto(
          imagePicker: ImagePickerService(),
        ),
        isActive: currentStep == 2,
      ),
    ];
  }

  void _nextStep(int currentStep) {
    if (currentStep == 2) {
      context.read<CreateProductCubit>().save();
      return;
    }
    context.read<CreateProductCubit>().nextStep(currentStep);
  }

//TODO: Refactor
  bool _isCurrentStepValid(CreateProductState state) {
    final isValid = state.maybeMap(
      data: (data) {
        if (data.currentStep == 0) {
          return data.stepAddProductInfoDetailValid ?? false;
        }

        if (data.currentStep == 1) {
          return true;
        }

        if (data.currentStep == 2) {
          return data.stepAddPhotoValid;
        }
      },
      orElse: () => false,
    );

    return isValid!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<CreateProductCubit, CreateProductState>(
          listener: (context, state) {
            state.maybeMap(
              data: (data) {
                if (data.isSuccess) {
                  context.pushReplacement(RouterConstant.itemRegisterSuccess);
                  return;
                }
                if (data.errorMessage != null) {
                  final snackBar = SnackBar(
                    backgroundColor: AppColors.errorColor,
                    content: Text(data.errorMessage ?? ''),
                    duration: const Duration(seconds: 4),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeMap(
              data: (state) {
                _buildSteps(state.currentStep);
                return Expanded(
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
                                    radius: Dimens.defaultRadius,
                                    borderColor: AppColors.lightGreyColor20,
                                    bgColor: AppColors.whiteColor,
                                    textColor: AppColors.textColorBody,
                                    text: "Voltar",
                                    press: () => context
                                        .read<CreateProductCubit>()
                                        .previous(details.currentStep),
                                  ),
                                ),
                              ),
                            Expanded(
                              child: UIElevatedButton(
                                radius: Dimens.defaultRadius,
                                bgColor: AppColors.primaryColor,
                                text: state.currentStep == _steps.length - 1
                                    ? "Confirmar"
                                    : "Próximo",
                                isLoading: state.isLoading,
                                isEnabled: _isCurrentStepValid(state),
                                press: () => _nextStep(details.currentStep),
                              ),
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
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        )
      ],
    );
  }
}
