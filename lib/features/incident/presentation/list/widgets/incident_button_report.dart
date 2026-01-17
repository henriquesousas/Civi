import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_icon_button.dart';
import 'package:flutter/material.dart';

class IncidentButtonReport extends StatelessWidget {
  const IncidentButtonReport({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: UIElevatedIconButton(
          icon: const Icon(
            Icons.add,
            color: AppColors.whiteColor,
          ),
          text: "Adicionar novo",
          press: () => {},
        ),
      ),
    );
  }
}
