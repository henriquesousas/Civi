import 'package:deehelp/core/ui/extensions/context_extension.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/features/auth/presentation/register/components/progress_indicator_label.dart';
import 'package:flutter/material.dart';
//
// import '../../../../app/theme/app_colors.dart' show AppColors;

//TODO : Remover
enum Steps {
  personal(0),
  contact(1),
  security(2);

  final int value;
  const Steps(this.value);
}

class RegisterAccountProgressIndicator extends StatefulWidget {
  final int currentStep;
  final int totalStep;
  const RegisterAccountProgressIndicator(
      {super.key, required this.currentStep, required this.totalStep});

  @override
  State<RegisterAccountProgressIndicator> createState() =>
      _RegisterAccountProgressIndicatorState();
}

class _RegisterAccountProgressIndicatorState
    extends State<RegisterAccountProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        spacing: 16,
        children: [
          Row(
            children: List.generate(
              widget.totalStep,
              (index) {
                final isActive = index <= widget.currentStep;
                return Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 4,
                          decoration: BoxDecoration(
                            color: isActive
                                ? AppColors.primaryColor
                                : AppColors.greyColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      if (index < widget.totalStep - 1)
                        const SizedBox(width: 8),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProgressIndicatorLabel(
                label: "Criar conta",
                isActive: Steps.personal.value == widget.currentStep,
              ),
              ProgressIndicatorLabel(
                label: "Contato",
                isActive: Steps.contact.value == widget.currentStep,
              ),
              ProgressIndicatorLabel(
                label: "Senha",
                isActive: Steps.security.value == widget.currentStep,
              ),
            ],
          )
        ],
      ),
    );
  }
}
