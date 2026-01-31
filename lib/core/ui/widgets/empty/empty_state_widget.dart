import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyStateWidget extends StatelessWidget {
  final double width;
  final double height;
  final String? title;
  final String? subtitle;
  final String? btnTitle;
  final VoidCallback? press;
  final Icon? icon;
  final Color color;
  const EmptyStateWidget({
    super.key,
    this.press,
    this.title,
    this.subtitle,
    this.btnTitle,
    this.width = Dimens.size90,
    this.height = Dimens.size90,
    this.icon,
    this.color = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(Dimens.size40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width.w,
              height: height.h,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: color.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: icon ??
                  Icon(
                    Icons.inventory_2_outlined,
                    size: width / 2.5,
                    color: AppColors.primaryColor.withValues(alpha: 0.9),
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              title ?? "Nenhum registro encontrado",
              textAlign: TextAlign.center,
              style: context.appTextStyles.bodyTextStyle1.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                subtitle ??
                    "Sua lista está vazia. Toque no botão abaixo para adicionar seu primeiro item.",
                textAlign: TextAlign.center,
                style: context.appTextStyles.sectionSubTitle1
                    .copyWith(color: Theme.of(context).colorScheme.surfaceDim),
              ),
            ),
            const SizedBox(height: 16),
            if (press != null)
              SizedBox(
                width: context.percentWidth(0.6),
                child: UIElevatedButton(
                  text: btnTitle ?? "Novo",
                  press: press ?? () {},
                  // icon: Icon(Icons.add, size: Dimens.size16.w),
                ),
              )
          ],
        ),
      ),
    );
  }
}
