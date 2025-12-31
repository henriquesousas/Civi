import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyStateWidget extends StatelessWidget {
  final VoidCallback press;
  const EmptyStateWidget({super.key, required this.press});

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
                size: 50,
                color: AppColors.primaryColor.withValues(alpha: 0.9),
              ),
            ),
            Text(
              "Nenhum item encontrado",
              style: context.appTextStyles.sectionTitle,
            ),
            //TODO: Mudar essa frase
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Comece adicionando seu primeiro item à plataforma para gerenciar seus veículos, celulares e outros itens",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: context.percentWidth(0.6),
              child: UIElevatedButton(
                text: "Adicionar",
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
