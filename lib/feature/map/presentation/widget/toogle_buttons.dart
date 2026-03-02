import 'package:flutter/material.dart';
import '../../../../old_core/ui/theme/app_colors.dart';

class ToogleButtons extends StatefulWidget {
  const ToogleButtons({super.key});

  @override
  State<ToogleButtons> createState() => _ToogleButtonsState();
}

class _ToogleButtonsState extends State<ToogleButtons> {
  final List<bool> _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: _isSelected,
      borderRadius: BorderRadius.circular(8),
      selectedColor: AppColors.whiteColor,
      selectedBorderColor: AppColors.primaryColorDark,
      fillColor: AppColors.primaryColorDark,
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < _isSelected.length; i++) {
            _isSelected[i] = i == index;
          }
        });
      },
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Sim'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Näo'),
        ),
      ],
    );
  }
}
