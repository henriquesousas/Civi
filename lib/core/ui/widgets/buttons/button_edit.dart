import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class ButtonEdit extends StatelessWidget {
  final VoidCallback onTap;
  const ButtonEdit({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(99),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          // color: const Color(0xFFF5F7FD),
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(99),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Row(
          children: [
            Icon(
              Icons.edit_outlined,
              size: IconSizes.xs,
              color: Colors.white,
            ),
            const SizedBox(width: 2),
            Text(
              'Editar',
              style: context.appText.caption.copyWith(
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
