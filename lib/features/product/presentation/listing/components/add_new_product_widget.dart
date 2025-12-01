import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/theme/app_colors.dart';

class AddNewProductWidget extends StatelessWidget {
  final VoidCallback press;
  const AddNewProductWidget({super.key, required this.press});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: TextButton.icon(
        onPressed: press,
        icon: const Icon(
          Icons.add_circle,
          // size: 18,
          color: AppColors.primaryColorDark,
        ),
        label: Text(
          R.strings.addNewItem,
          style: context.appTextStyles.sectionSubTitle1.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
