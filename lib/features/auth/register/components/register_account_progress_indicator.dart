import 'package:flutter/material.dart';
import 'package:yousafe/features/auth/register/components/progress_indicator_label.dart';
import 'package:yousafe/shared/extensions/context_extension.dart';
import '../../../../app/theme/app_colors.dart' show AppColors;

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
  // final int _totalSteps = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
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
                          duration: Duration(milliseconds: 300),
                          height: 4,
                          decoration: BoxDecoration(
                            color:
                                isActive ? AppColors.primary : AppColors.border,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      if (index < widget.totalStep - 1) SizedBox(width: 8),
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
                label: context.strings.registerAccountStepPersonal,
                isActive: Steps.personal.value == widget.currentStep,
              ),
              ProgressIndicatorLabel(
                label: context.strings.registerAccountStepContact,
                isActive: Steps.contact.value == widget.currentStep,
              ),
              ProgressIndicatorLabel(
                label: context.strings.registerAccountSecurity,
                isActive: Steps.security.value == widget.currentStep,
              ),
            ],
          )
        ],
      ),
    );
  }
}
