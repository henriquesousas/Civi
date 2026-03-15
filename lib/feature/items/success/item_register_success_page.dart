import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/bubble/bubble_export.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/feature/items/success/card_next_step.dart';
import 'package:deehelp/core/utils/url_launcher_utils.dart';
import 'package:deehelp/feature/items/success/item_no_pill.dart';
import 'package:deehelp/feature/items/success/top_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ItemRegisterSuccessPage extends StatelessWidget {
  final String? itemName;
  final String? itemId;
  final VoidCallback? onAddPhotos;
  final VoidCallback? onClose;

  const ItemRegisterSuccessPage({
    super.key,
    this.itemName,
    this.itemId,
    this.onAddPhotos,
    this.onClose,
  });

  bool get _hasItemName => itemName != null && itemName!.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor =
        isDark ? const Color(0xFF050816) : AppColors.primaryColor;
    final softCard = isDark
        ? Colors.white.withValues(alpha: 0.06)
        : Colors.white.withValues(alpha: 0.12);
    final borderColor = Colors.white.withValues(alpha: isDark ? 0.10 : 0.18);
    final secondaryText = Colors.white.withValues(alpha: 0.78);

    return Scaffold(
      // backgroundColor: context.primaryColor,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: DecorativeBubblesBackground(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopBarV2(
                  onClose: onClose ?? () => context.pop(),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: IntrinsicHeight(
                            child: Column(
                              children: [
                                const Spacer(),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 22.w,
                                    vertical: 24.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: softCard,
                                    borderRadius: BorderRadius.circular(30.r),
                                    border: Border.all(color: borderColor),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withValues(alpha: 0.18),
                                        blurRadius: 30,
                                        offset: const Offset(0, 18),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 132.w,
                                        height: 132.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white
                                              .withValues(alpha: 0.08),
                                          border: Border.all(
                                            color: Colors.white
                                                .withValues(alpha: 0.12),
                                          ),
                                        ),
                                        child: Center(
                                          child: Lottie.asset(
                                            "assets/lottie/loader_success.json",
                                            width: 108.w,
                                            height: 108.h,
                                            repeat: false,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 22.h),
                                      Text(
                                        _hasItemName
                                            ? '$itemName cadastrado com sucesso'
                                            : 'Cadastro recebido com sucesso',
                                        textAlign: TextAlign.center,
                                        style:
                                            context.appText.headerxl.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          height: 1.05,
                                          letterSpacing: -0.6,
                                        ),
                                      ),
                                      SizedBox(height: 14.h),
                                      Text(
                                        'Recebemos seu cadastro e ele passará por uma validação antes de ficar visível no aplicativo.',
                                        textAlign: TextAlign.center,
                                        style:
                                            context.appText.bodySmall.copyWith(
                                          color: secondaryText,
                                          fontWeight: FontWeight.w500,
                                          height: 1.45,
                                        ),
                                      ),
                                      if (_hasItemName) ...[
                                        SizedBox(height: 18.h),
                                        ItemInfoPill(
                                          title: 'Item cadastrado',
                                          value: itemName!,
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                                SizedBox(height: 18.h),
                                const CardNextStep(),
                                SizedBox(height: 14.h),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(16.r),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.05),
                                    borderRadius: BorderRadius.circular(22.r),
                                    border: Border.all(
                                      color:
                                          Colors.white.withValues(alpha: 0.08),
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 38.w,
                                        height: 38.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white
                                              .withValues(alpha: 0.08),
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        ),
                                        child: const Icon(
                                          Icons.verified_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'O que acontece agora?',
                                              style:
                                                  context.appText.body.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            SizedBox(height: 4.h),
                                            Text(
                                              'Nossa equipe poderá validar as informações enviadas para melhorar a confiabilidade dos dados no app.',
                                              style: context.appText.bodySmall
                                                  .copyWith(
                                                color: secondaryText,
                                                height: 1.4,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                Column(
                  children: [
                    ButtonOutline(
                      bgColor: Colors.white,
                      borderColor: Colors.white.withValues(alpha: 0.20),
                      textColor: Colors.black,
                      icon: const Icon(
                        Icons.share_outlined,
                        color: Colors.black,
                      ),
                      press: () {
                        UrlLauncherUtils.shareApp(context);
                      },
                      text: 'Compartilhar o app',
                    ),
                    SizedBox(height: 12.h),
                    ButtonInline(
                      textColor: Colors.white.withValues(alpha: 0.92),
                      text: "Fechar",
                      press: onClose ?? () => context.pop(),
                    ),
                  ],
                ),
                // Expanded(
                //   child: ListView(
                //     children: [
                //       // const OwlSadSpeechBubble(
                //       //   file: 'assets/lottie/owl_happy.json',
                //       //   message:
                //       //       "Perfeito! 🦉✨\nSeu item foi cadastrado com sucesso.\nAgora ele está protegido e monitorado.",
                //       // ),
                //       // Lottie.asset(
                //       //   "assets/lottie/loader_success.json",
                //       //   width: 180.w,
                //       //   height: 180.h,
                //       //   repeat: false,
                //       // ),
                //       Text(
                //         'Cadastro recebido!',
                //         textAlign: TextAlign.center,
                //         style: context.appText.headerxl.copyWith(
                //           color: Colors.white,
                //           fontWeight: FontWeight.w900,
                //           height: 1.1,
                //         ),
                //       ),
                //       const SizedBox(height: SpacingSize.md),
                //       Text(
                //         'Recebemos seu cadastro e ele passará por validações da nossa equipe antes de ficar visível no app.',
                //         textAlign: TextAlign.center,
                //         style: context.appText.bodySmall.copyWith(
                //           height: 1.35,
                //           color: Colors.white,
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //       const SizedBox(height: SpacingSize.xxl),
                //       const CardNextStep(),
                //       const SizedBox(height: SpacingSize.md),
                //       const Spacer(),
                //       ButtonOutline(
                //         bgColor: Colors.white,
                //         borderColor: context.primaryColor,
                //         textColor: Colors.black,
                //         icon: const Icon(
                //           Icons.share_outlined,
                //           color: Colors.black,
                //         ),
                //         press: () {
                //           UrlLauncherUtils.shareApp(context);
                //         },
                //         text: 'Compartilhar o app',
                //       ),
                //       const SizedBox(height: SpacingSize.md),
                //       ButtonInline(
                //         textColor:
                //             Theme.of(context).brightness == Brightness.dark
                //                 ? context.onSurface
                //                 : Colors.white,
                //         text: "Fechar",
                //         press: () => Navigator.pop(context),
                //         // onPressed: () {},
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
