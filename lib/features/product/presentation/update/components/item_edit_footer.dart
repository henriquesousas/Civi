// item_edit_footer.dart

import 'package:deehelp/core/components/buttons/ui_primary_button.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';

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
        UIPrimaryButton(
          text: R.strings.confirmUpdate,
          press: onConfirm,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(R.strings
                  .parts(text: R.strings.permanentlyDeleteVehicle)
                  .first),
              GestureDetector(
                onTap: onDelete,
                child: Text(
                  R.strings
                      .parts(text: R.strings.permanentlyDeleteVehicle)
                      .last,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.errorColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
