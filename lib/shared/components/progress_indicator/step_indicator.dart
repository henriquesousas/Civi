import 'package:flutter/material.dart';
import 'package:deehelp/shared/components/progress_indicator/step_item.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final List<String> titles;

  const StepIndicator({
    super.key,
    required this.currentStep,
    required this.titles,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(titles.length, (index) {
        return Expanded(
          child: StepItem(
            title: titles[index],
            isActive: index == currentStep,
            isCompleted: index < currentStep,
          ),
        );
      }),
    );
  }
}
