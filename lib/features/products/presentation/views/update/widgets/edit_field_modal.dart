import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/core/ui/widgets/icon/ui_icon.dart';
import 'package:deehelp/core/ui/widgets/textfield/ui_text_field_rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
  final bool isObs;

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
    this.isObs = false,
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
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Editar ${widget.title}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                UIICon(
                  isAlpha: true,
                  icon: const Icon(Icons.close),
                  bgColor: AppColors.darkGreyColor10,
                  press: () => context.pop(),
                ),
              ],
            ),
            Text(
              widget.description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
            UITextFieldRounded(
              fillColor: AppColors.background,
              textInputAction: TextInputAction.done,
              showLabelText: false,
              labelText: widget.hintText,
              hintText: widget.hintText,
              controller: _controller,
              maxLength: widget.isObs ? 200 : null,
              maxLine: widget.isObs ? 4 : 1,
            ),
            Text(
              widget.examples,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textTertiary,
                  ),
            ),
            SizedBox(height: Dimens.size24.h),
            Row(
              children: [
                Expanded(
                  child: UIElevatedButton(
                    text: "Cancelar",
                    press: () => Navigator.of(context).pop(),
                    textColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                    bgColor: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(width: Dimens.size14),
                Expanded(
                  child: UIElevatedButton(
                    text: "Confirmar",
                    press: () => widget.onConfirm != null ? _onConfirm : null,
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimens.size20.h),
          ],
        ),
      ),
    );
  }
}
