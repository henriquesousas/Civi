import 'package:flutter/material.dart';

import '../../../../../../core/ui/theme/app_colors.dart';
import '../../../../../../core/ui/widgets/button/ui_elevated_button.dart';

class ItemEditFooter extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onDelete;

  const ItemEditFooter({
    super.key,
    required this.onConfirm,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UIElevatedButton(
          text: "Confirmar",
          press: onConfirm,
        ),
        const SizedBox(height: 10),
        UIElevatedButton(
          bgColor: Colors.transparent,
          borderColor: AppColors.errorColorDark,
          textColor: AppColors.errorColor,
          text: "Deletar",
          press: onDelete,
        ),
      ],
    );
  }
}
