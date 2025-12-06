import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class UISimpleEmptyValue extends StatelessWidget {
  const UISimpleEmptyValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search_off,
              size: 32,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'Nenhum resultado encontrado',
              style: context.appTextStyles.bodyTextStyle1.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            // if (filteredValue.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Tente buscar com outros termos',
                style: context.appTextStyles.caption1Style.copyWith(
                  color: Colors.grey.shade500,
                ),
                // style: context.appTextStyles.caption.copyWith(
                //   color: Colors.grey.shade500,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
