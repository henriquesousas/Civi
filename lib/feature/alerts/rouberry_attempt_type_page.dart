import 'dart:ui';

import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/size/layout_spacing_size.dart';
import 'package:deehelp/core/theme/size/progress_indicator_size.dart';
import 'package:deehelp/core/theme/size/radius_size.dart';
import 'package:deehelp/core/theme/size/spacing_size.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/core/ui/widgets/buttons/ui_hold_confirm_button.dart';
import 'package:deehelp/feature/alerts/providers/add_alert_viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class RobberyAttemptTypePage extends ConsumerStatefulWidget {
  const RobberyAttemptTypePage({super.key});

  @override
  ConsumerState<RobberyAttemptTypePage> createState() =>
      _RobberyAttemptTypePageState();
}

class _RobberyAttemptTypePageState
    extends ConsumerState<RobberyAttemptTypePage> {
  String? selectedType;

  final List<_AlertOption> options = const [
    _AlertOption(
      id: 'broken_window',
      title: 'Quebra de vidro (Veículo)',
      subtitle: 'Quebraram o vidro do veículo para furtar algo.',
      icon: Icons.car_crash_rounded,
      iconBackgroundColor: Color(0xFF3A2C12),
      iconColor: Color(0xFFFBBF24),
    ),
    _AlertOption(
      id: 'motorcycle_approach',
      title: 'Abordagem por moto',
      subtitle: 'Suspeitos em moto abordaram ou tentaram abordar alguém.',
      icon: Icons.two_wheeler_rounded,
      iconBackgroundColor: Color(0xFF16284F),
      iconColor: Color(0xFF78A6FF),
    ),
    _AlertOption(
      id: 'on_foot_approach',
      title: 'Abordagem a pé',
      subtitle: 'Uma pessoa se aproximou e tentou intimidar ou roubar.',
      icon: Icons.directions_walk_rounded,
      iconBackgroundColor: Color(0xFF123325),
      iconColor: Color(0xFF34D399),
    ),
    _AlertOption(
      id: 'vehicle_invasion_attempt',
      title: 'Tentativa de invasão',
      subtitle: 'Tentaram abrir ou forçar a entrada no veículo.',
      icon: Icons.vpn_key_rounded,
      iconBackgroundColor: Color(0xFF2D1B47),
      iconColor: Color(0xFFA78BFA),
    ),
    _AlertOption(
      id: 'suspicious_activity',
      title: 'Atividade suspeita',
      subtitle: 'Você observou alguma atividade suspeita na área.',
      icon: Icons.report_problem_rounded,
      iconBackgroundColor: Color(0xFF32C12),
      iconColor: Color(0xFFFBBF24),
    ),
    // _AlertOption(
    //   id: 'other',
    //   title: 'Outro',
    //   subtitle: 'Selecione esta opção se o caso não estiver na lista.',
    //   icon: Icons.more_horiz_rounded,
    //   iconBackgroundColor: Color(0xFF232A35),
    //   iconColor: Color(0xFF9CA3AF),
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    const selectedColor = Color(0xFF123D91);
    const selectedBorder = Color(0xFF2B5BEE);

    ref.listen(
      addAlertViewModelProvider,
      (previous, currentState) {
        if (currentState.isLoading) {
          showDialogOverlay(context);
        }

        if (currentState.registeredsuccessfully) {
          if (Navigator.canPop(context)) {
            Navigator.of(context, rootNavigator: true).pop();
          }

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => ThankYouDialog(
              onContinue: () {
                Navigator.of(context, rootNavigator: true)
                    .pop(); // fecha dialog
                context.pop(); //echa tela
              },
            ),
          );
          // showDialog(
          //   context: context,
          //   barrierColor: Colors.black54,
          //   builder: (_) => Center(
          //     child: ThankYouAlertCard(),
          //   ),
          // );

          // 3. Fecha a tela atual (depois de um pequeno delay)
          // Future.delayed(const Duration(milliseconds: 300), () {
          //   if (context.mounted) {
          //     context.pop();
          //   }
          // });
        }
      },
    );

    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: DefaultAppBar(
        title: "O que aconteceu?",
        showBackButton: true,
        leading: const Icon(
          Icons.close_rounded,
        ),
        press: () => context.pop(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      // color: Color(0XFFF3F4F6),
                      color: context.primaryBgCardLow,
                      // color: context.primaryBgCard,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: context.outlineVariantColor),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 36.w,
                          height: 36.h,
                          decoration: BoxDecoration(
                            color:
                                AppColors.primaryColor.withValues(alpha: 0.14),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.info_outline_rounded,
                            color: const Color(0xFF78A6FF),
                            size: 20.w,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Selecione a opção mais próxima do que aconteceu. Você poderá adicionar mais detalhes na próxima etapa.',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: context.secondaryTextColor,
                                      height: 1.45,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...options.map(
                    (option) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _SelectableOptionCard(
                        option: option,
                        selected: selectedType == option.id,
                        surfaceColor: context.primaryBgCard,
                        borderColor: context.outlineVariantColor,
                        selectedColor: selectedColor,
                        selectedBorder: selectedBorder,
                        textPrimary: context.primaryTextColor,
                        textSecondary: context.secondaryTextColor,
                        onTap: () {
                          setState(() {
                            selectedType = option.id;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: UIHoldConfirmButton(
                onProgressCompleted: () async {
                  // if (selectedType == null) return;

                  // final type = options
                  //     .where((element) => element.id == selectedType)
                  //     .first;
                  // ref
                  //     .read(addAlertViewModelProvider.notifier)
                  //     .sendAlert(type.title);
                },
                onApiCall: () async {},
                onProgressChange: (v) {},
                hapticFeedback: true,
                title: "Segure para publicar",
                textColor: Colors.white,
                backgroundColor: AppColors.primaryColorDark,
                contentPadding: const EdgeInsets.all(SpacingSize.xl),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showDialogOverlay(BuildContext context, {String? message}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withValues(alpha: 0.15), // leve escurecido
    builder: (_) {
      return PopScope(
        canPop: true,
        child: Stack(
          children: [
            // Blur no fundo
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(color: Colors.transparent),
            ),

            // Card central
            Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: context.percentWidth(0.6),
                  padding: const EdgeInsets.symmetric(
                    horizontal: LayoutSpacingSize.container,
                    vertical: LayoutSpacingSize.container,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(RadiusSize.xl),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x22000000),
                        blurRadius: 24,
                        offset: Offset(0, 12),
                      ),
                    ],
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .outlineVariant
                          .withValues(alpha: 0.6),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 4),

                      // Loader + animação suave
                      SizedBox(
                        width: ProgressIndicatorSizes.xl,
                        height: ProgressIndicatorSizes.xl,
                        child: CircularProgressIndicator(
                          strokeWidth: 3.2,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),

                      const SizedBox(height: 14),

                      Text(
                        "Enviando alerta",
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "Aguarde...",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class _SelectableOptionCard extends StatelessWidget {
  final _AlertOption option;
  final bool selected;
  final VoidCallback onTap;
  final Color surfaceColor;
  final Color borderColor;
  final Color selectedColor;
  final Color selectedBorder;
  final Color textPrimary;
  final Color textSecondary;

  const _SelectableOptionCard({
    required this.option,
    required this.selected,
    required this.onTap,
    required this.surfaceColor,
    required this.borderColor,
    required this.selectedColor,
    required this.selectedBorder,
    required this.textPrimary,
    required this.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color:
                selected ? selectedColor.withValues(alpha: 0.12) : surfaceColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: selected ? selectedBorder : borderColor,
              width: selected ? 1.4 : 1,
            ),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: selectedBorder.withValues(alpha: 0.16),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [],
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  // color: selected
                  //     ? option.iconColor.withOpacity(0.16)
                  //     : option.iconBackgroundColor,
                  color: option.iconBackgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  option.icon,
                  color: option.iconColor,
                  size: 20.w,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      option.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: textPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      option.subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: textSecondary,
                            height: 1.4,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? selectedBorder : Colors.transparent,
                  border: Border.all(
                    color: selected ? selectedBorder : borderColor,
                    width: 1.5,
                  ),
                ),
                child: selected
                    ? Icon(
                        Icons.check_rounded,
                        size: 12.w,
                        color: Colors.white,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AlertOption {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconColor;

  const _AlertOption({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconColor,
  });
}

// class ThankYouAlertCard extends StatelessWidget {
//   final VoidCallback? onClose;

//   const ThankYouAlertCard({
//     super.key,
//     this.onClose,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         // color: const Color(0xFF111827),
//         color: AppColors.green,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           // color: const Color(0xFF2B5BEE).withValues(alpha: 0.25),
//           color: AppColors.green.withValues(alpha: 0.25),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.18),
//             blurRadius: 18,
//             offset: const Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 44,
//             height: 44,
//             decoration: BoxDecoration(
//               color: AppColors.green.withValues(alpha: 0.14),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               Icons.favorite_rounded,
//               color: AppColors.danger2,
//               size: 20.w,
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Obrigado por compartilhar este alerta',
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: context.safeSp(14),
//                     fontWeight: FontWeight.w800,
//                     height: 1.2,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   'Cada aviso ajuda a comunidade a agir com mais atenção e segurança.',
//                   maxLines: 3,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     color: Colors.white.withOpacity(0.76),
//                     fontSize: context.safeSp(12),
//                     fontWeight: FontWeight.w500,
//                     height: 1.35,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 8),
//           InkWell(
//             borderRadius: BorderRadius.circular(99),
//             onTap: onClose,
//             child: Container(
//               width: 32,
//               height: 32,
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.05),
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(
//                 Icons.close_rounded,
//                 color: Colors.white70,
//                 size: 18,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void showThankYouNotice(BuildContext context) {
//   final overlay = Overlay.of(context);

//   late OverlayEntry entry;

//   entry = OverlayEntry(
//     builder: (_) {
//       final top = MediaQuery.of(context).padding.top + 12;

//       return Positioned(
//         top: top,
//         left: 16,
//         right: 16,
//         child: Material(
//           color: Colors.transparent, // 🔥 importante
//           child: SafeArea(
//             bottom: false,
//             child: ThankYouAlertCard(
//               onClose: () => entry.remove(),
//             ),
//           ),
//         ),
//       );
//     },
//   );

//   overlay.insert(entry);

//   Future.delayed(const Duration(minutes: 10), () {
//     if (entry.mounted) {
//       entry.remove();
//     }
//   });
// }

class ThankYouDialog extends StatelessWidget {
  final VoidCallback onContinue;

  const ThankYouDialog({
    super.key,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
        decoration: BoxDecoration(
          color: context.primaryBgCardLow,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: context.outline,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.35),
              blurRadius: 30,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/lottie/thanks.json',
              width: context.percentWidth(0.9),
              height: context.percentHeight(0.2),
            ),

            const SizedBox(height: 20),

            // 🔹 Título
            Text(
              'Obrigado por compartilhar!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.primaryTextColor,
                fontSize: context.safeSp(22),
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 10),

            // 🔹 Mensagem
            Text(
              'Seu alerta ajuda a proteger pessoas perto de você e deixa a comunidade mais segura.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.secondaryTextColor,
                fontSize: context.safeSp(12),
                height: 1.4,
              ),
            ),

            const SizedBox(height: 24),

            // 🔹 Botão
            ButtonPrimary(
              press: onContinue,
              text: "Fechar",
              // textColor:
              //     context.isDark() ? Colors.white : AppColors.primaryColor,
              // borderColor:
              //     context.isDark() ? Colors.white : AppColors.primaryColor,
              // bgColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
