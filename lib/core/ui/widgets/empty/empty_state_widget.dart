import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyStateWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? btnTitle;
  final VoidCallback press;
  const EmptyStateWidget({
    super.key,
    required this.press,
    this.title,
    this.subtitle,
    this.btnTitle,
  });

  @override
  Widget build(BuildContext context) {
    final color = AppColors.primaryColor.withValues(alpha: 0.1);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Dimens.size125.w,
              height: Dimens.size125.h,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 1),
              ),
              child: Icon(
                Icons.inventory_2_outlined,
                size: Dimens.size50.w,
                color: AppColors.primaryColor.withValues(alpha: 0.9),
              ),
            ),
            Text(
              title ?? "Nenhum registro encontrado",
              textAlign: TextAlign.center,
              style: context.appTextStyles.sectionTitle,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                subtitle ??
                    "Sua lista está vazia. Toque no botão abaixo para adicionar seu primeiro item.",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: context.percentWidth(0.6),
              child: UIElevatedButton(
                text: btnTitle ?? "Novo",
                press: press,
                icon: Icon(Icons.add, size: Dimens.size16.w),
              ),
            )
          ],
        ),
      ),
    );
  }
}
