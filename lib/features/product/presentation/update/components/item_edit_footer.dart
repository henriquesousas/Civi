// item_edit_footer.dart

import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/buttons/ui_elevated_button.dart';

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
          text: R.strings.confirmUpdate,
          onTap: onConfirm,
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            Text(
              R.strings.parts(text: R.strings.permanentlyDeleteVehicle).first,
              style: context.appTextStyles.caption1Style,
            ),
            GestureDetector(
              onTap: onDelete,
              child: Text(
                R.strings.parts(text: R.strings.permanentlyDeleteVehicle).last,
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
