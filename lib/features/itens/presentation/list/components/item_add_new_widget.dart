import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/theme/app_colors.dart';

class ItemAddNewWidget extends StatelessWidget {
  final VoidCallback press;
  const ItemAddNewWidget({super.key, required this.press});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: TextButton.icon(
        onPressed: press,
        icon: const Icon(
          Icons.add,
          size: 18,
          color: AppColors.primaryColorDark,
        ),
        label: Text(
          R.strings.addNewItem,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColors.primaryColorDark,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
