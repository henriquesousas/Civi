import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/core/widgets/buttons/ui_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/components/icon/ui_icon_alpha.dart';
import '../../../../../core/components/textfields/ui_secondary_textfield.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/theme/app_colors.dart';

class EditFieldModal extends StatefulWidget {
  final String title;
  final String description;
  final String hintText;
  final String initialValue;
  final String examples;
  final IconData prefixIcon;
  final Color prefixIconColor;
  final ValueChanged<String>? onConfirm;
  final ValueChanged<String>? onChange;
  final VoidCallback? onCancel;
  final String? errorText;

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
    this.onCancel,
    this.onChange,
    this.errorText,
  });

  @override
  State<EditFieldModal> createState() => _EditFieldModalState();
}

class _EditFieldModalState extends State<EditFieldModal> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onConfirm() {
    widget.onConfirm?.call(_controller.text);
    Navigator.of(context).pop();
  }

  void _onChange(String value) {
    widget.onChange?.call(value);
  }

  void _onCancel() {
    widget.onCancel?.call();
    Navigator.of(context).pop();
  }

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
                  "Editar ${widget.title}",
                  style: context.appTextStyles.sectionTitle,
                ),
                UIIConAlpha(
                  iconData: Icons.close,
                  color: AppColors.darkGreyColor10,
                  press: () => context.pop(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              style: context.appTextStyles.caption2Style.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 32),
            UISecondaryTextField(
              labelText: widget.hintText,
              hintText: widget.hintText,
              //initialValue: widget.initialValue,
              controller: _controller,
              prefixIcon: Icon(
                widget.prefixIcon,
                color: AppColors.primaryColor,
              ),
              filled: true,
              fillColor: AppColors.background,
              textInputAction: TextInputAction.done,
              onChanged: _onChange,
              errorText: widget.errorText,
            ),
            const SizedBox(height: 8),
            Text(
              widget.examples,
              style: context.appTextStyles.caption2Style.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: UIElevatedButton(
                    text: R.strings.cancel,
                    onTap: () => Navigator.of(context).pop(),
                    textColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                    bgColor: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: UIElevatedButton(
                    text: R.strings.confirm,
                    onTap: () => widget.onConfirm != null ? _onConfirm : null,
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
