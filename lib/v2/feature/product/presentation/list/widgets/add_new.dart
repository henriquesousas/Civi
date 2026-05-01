import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/widgets/icon/export_icon.dart';
import 'package:deehelp/v2/feature/product/product_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddNew extends StatelessWidget {
  const AddNew({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(ProductRouter.addNewVehicle),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: SizeLayoutSpacing.m,
          vertical: SizeLayoutSpacing.m,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withValues(alpha: 0.10),
              width: 1,
            ),
          ),
        ),
        child: Row(
          spacing: 10,
          children: [
            UIIconCard(
              width: IconContainerSizes.lg,
              height: IconContainerSizes.lg,
              bgColor: Colors.white,
              radius: 999,
              icon: Icon(
                Icons.add_rounded,
                color: Colors.black,
                size: IconSizes.lg,
              ),
            ),
            Text(
              'Adicionar novo',
              style: context.appText.bodyLarger.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
