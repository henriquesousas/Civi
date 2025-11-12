import 'package:deehelp/shared/components/progress_indicator/step_item.dart';
import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int step;
  final List<String> labels;

  const StepIndicator({
    super.key,
    required this.step,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(labels.length, (index) {
          return Expanded(
            child: StepItem(
              title: labels[index],
              isActive: index <= step,
              isCompleted: index < step,
            ),
          );
        }),
      ),
    );
  }
}
