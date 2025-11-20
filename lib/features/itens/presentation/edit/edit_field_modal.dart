import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors_v2.dart';
import '../../../../core/components/buttons/ui_outline_button.dart';
import '../../../../core/components/buttons/ui_primary_button.dart';
import '../../../../core/components/icon/ui_icon.dart';
import '../../../../core/components/textfields/ui_secondary_textfield.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/theme/app_colors.dart';

class EditFieldModal extends StatelessWidget {
  final String title;
  final String description;
  final String hintText;
  final String initialValue;
  final String examples;
  final IconData prefixIcon;
  final Color prefixIconColor;
  final ValueChanged<String>? onConfirm;

  const EditFieldModal({
    super.key,
    required this.title,
    required this.initialValue,
    this.description = '',
    this.hintText = '',
    this.examples = '',
    this.prefixIcon = Icons.edit,
    this.prefixIconColor = AppColors.primaryColor,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Editar $title",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                ),
                const UIICon(
                    iconData: Icons.close, color: AppColors.darkGreyColor10),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
            const SizedBox(height: 32),
            UISecondaryTextField(
              labelText: hintText,
              hintText: hintText,
              initialValue: initialValue,
              prefixIcon: Icon(
                prefixIcon,
                color: AppColors.primaryColor,
              ),
              filled: true,
              fillColor: AppColorsV2.background,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) {},
            ),
            const SizedBox(height: 8),
            Text(
              examples,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColorsV2.textTertiary,
                  ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: UIOutlineButton(
                    text: R.strings.cancel,
                    press: () => Navigator.of(context).pop(),
                    textColor: AppColors.textSecondary,
                    borderColor: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: UIPrimaryButton(
                    text: R.strings.confirm,
                    borderRadius: 12,
                    press: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
