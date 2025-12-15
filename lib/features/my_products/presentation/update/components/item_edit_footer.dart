import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/ui/theme/app_colors.dart';
import '../../../../../core/ui/widgets/button/ui_elevated_button.dart';

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
        Column(
          children: [
            Text(
              "Para deletar esse",
              style: context.appTextStyles.caption1Style,
            ),
            GestureDetector(
              onTap: onDelete,
              child: Text(
                "Clique aqui",
                style: context.appTextStyles.caption1Style.copyWith(
                  color: AppColors.errorColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        // const SizedBox(height: 30),
      ],
    );
  }
}
