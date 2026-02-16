import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/theme/size/icon_size.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback press;
  const LogoutDialog({super.key, required this.press});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HighlightIcon(
              containerSize: IconSizes.xxl,
              bgColor: AppColors.danger.withValues(alpha: 0.12),
              icon: Icon(
                Icons.logout_rounded,
                color: AppColors.danger,
                size: IconSizes.md,
              ),
            ),
            const SizedBox(height: SpacingSize.lg),
            Text(
              'Sair da conta',
              style: context.appText.headermd,
            ),
            const SizedBox(height: SpacingSize.md),
            Text(
              'Tem certeza que deseja sair do Kotto?\n'
              'Você poderá entrar novamente quando quiser.',
              textAlign: TextAlign.center,
              style: context.appText.bodymd.copyWith(
                color: context.secondaryColor,
              ),
            ),
            const SizedBox(height: SpacingSize.xl),
            Row(
              children: [
                Expanded(
                  child: ButtonOutline(
                    press: () => context.pop(),
                    text: "Cancelar",
                    textColor: context.onSurface,
                    side: BorderSide(
                      color: context.outlineVariantColor,
                    ),
                  ),
                ),
                const SizedBox(width: SpacingSize.md),
                Expanded(
                  child: ButtonOutline(
                    bgColor: AppColors.danger,
                    textColor: Colors.white,
                    side: const BorderSide(
                      color: AppColors.danger,
                    ),
                    text: "Sair",
                    press: press,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
