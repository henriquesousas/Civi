import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/router/router_constants.dart';
import '../../../../../core/theme/app_colors.dart';

class ItemAddNewWidget extends StatelessWidget {
  const ItemAddNewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: TextButton.icon(
        onPressed: () => context.push(RouterConstant.createNewItem),
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
