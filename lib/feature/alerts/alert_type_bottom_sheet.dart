import 'package:deehelp/old_core/extension/dialog_extension.dart';
import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/theme/app_colors.dart';
import 'package:deehelp/old_core/theme/size/spacing_size.dart';
import 'package:deehelp/old_core/ui/widgets/buttons/ui_hold_confirm_button.dart';
import 'package:deehelp/feature/alerts/providers/add_alert_viewmodel_provider.dart';
import 'package:deehelp/feature/alerts/rouberry_attempt_type_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AlertTypeBottomSheet {
  static Future<void> show(
    BuildContext context, {
    required VoidCallback onSuspiciousTap,
    required VoidCallback onRobberyTap,
  }) {
    // return showModalBottomSheet(
    //   context: context,
    //   isScrollControlled: false,
    //   backgroundColor: Colors.transparent,
    //   builder: (_) {
    //     return _AlertTypeContent(
    //       onRobberyTap: onRobberyTap,
    //       onSuspiciousTap: onSuspiciousTap,
    //     );
    //   },
    // );
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return FractionallySizedBox(
          heightFactor: 0.75,
          // heightFactor: context.screenHeight / 3,
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: _AlertTypeContent(
              onRobberyTap: onRobberyTap,
              onSuspiciousTap: onSuspiciousTap,
            ),
          ),
        );
      },
    );
  }
}

class _AlertTypeContent extends ConsumerStatefulWidget {
  final VoidCallback onSuspiciousTap;
  final VoidCallback onRobberyTap;

  const _AlertTypeContent({
    required this.onSuspiciousTap,
    required this.onRobberyTap,
  });

  @override
  ConsumerState<_AlertTypeContent> createState() => _AlertTypeContentState();
}

class _AlertTypeContentState extends ConsumerState<_AlertTypeContent> {
  int? selectedIndex;

  final alertTypes = [
    {
      'id': 'robberyAttempt',
      'title': 'Objeto lançado no veículo',
      'description':
          'Tentativa de roubo com objeto lançado para obrigar motorista a parar',
      'icon': Icons.car_crash_rounded,
      'iconBackgroundColor': const Color(0xFF16284F),
      'iconColor': const Color(0xFF78A6FF),
      // 'iconBackgroundColor': const Color(0xFF123325),
      // 'iconColor': const Color(0xFF34D399)
      // 'iconBackgroundColor': const Color(0xFF3A2C12),
      // 'iconColor': const Color(0xFFFBBF24),
    },
    // {
    //   'id': 'motorcycleApproach',
    //   'title': 'Aproximação de motocicleta',
    //   'description': 'Motocicleta se aproximando de forma suspeita.',
    //   'icon': Icons.two_wheeler_rounded,
    // 'iconBackgroundColor': const Color(0xFF16284F),
    // 'iconColor': const Color(0xFF78A6FF),
    // },
    // {
    //   'id': 'onFootApproach',
    //   'title': 'Abordagem a pé',
    //   'description': 'pessoa se aproximando para tentar intimidar ou roubar.',
    //   'icon': Icons.directions_walk_rounded,
    //   'iconBackgroundColor': const Color(0xFF123325),
    //   'iconColor': const Color(0xFF34D399)
    // },
    {
      'id': 'vehicleInvasionAttempt',
      'title': 'Abordagem de veículo',
      'description': 'Tentaram abrir ou forçar a entrada no veículo.',
      'icon': Icons.vpn_key_rounded,
      'iconBackgroundColor': const Color(0xFF2D1B47),
      'iconColor': const Color(0xFFA78BFA)
    },
    {
      'id': 'suspiciousActivity',
      'title': 'Atividade suspeita',
      'description': 'Carro,moto ou pessoa circulando de forma suspeita',
      'icon': Icons.visibility_rounded,
      'iconBackgroundColor': const Color(0x0ff32c12),
      'iconColor': const Color(0xFFFBBF24)
    },
  ];

  @override
  Widget build(BuildContext context) {
    final borderColor = context.outlineVariantColor;

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
        }
      },
    );

    return FractionallySizedBox(
      heightFactor: 0.99,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        decoration: BoxDecoration(
          color: context.primaryBgCard,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          border: Border.all(color: borderColor),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: context.outline,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Publicar alerta',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: context.primaryTextColor,
                    ),
              ),
              const SizedBox(height: 6),
              Text(
                'Escolha o tipo de alerta que deseja reportar',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.secondaryTextColor,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: alertTypes.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.80.h,
                  ),
                  itemBuilder: (context, index) {
                    final item = alertTypes[index];
                    final isSelected = selectedIndex == index;

                    return _AlertCard(
                      title: item['title'] as String,
                      description: item['description'] as String,
                      iconBackgroundColor: item['iconBackgroundColor'] as Color,
                      iconColor: item['iconColor'] as Color,
                      icon: item['icon'] as IconData,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: UIHoldConfirmButton(
                  onProgressCompleted: () async {
                    if (selectedIndex == null) {
                      context.showTopNotice(
                        "Selecione um tipo de alerta para continuar.",
                        type: DialogType.error,
                      );
                      return;
                    }

                    final id = alertTypes[selectedIndex!]['id'] as String;
                    final title = alertTypes[selectedIndex!]['title'] as String;

                    ref
                        .read(addAlertViewModelProvider.notifier)
                        .sendAlert(title, id);
                  },
                  onApiCall: () async {},
                  onProgressChange: (v) {},
                  hapticFeedback: true,
                  title: "Segure para publicar",
                  textColor: Colors.white,
                  backgroundColor: AppColors.primaryColorDark,
                  borderRadius: BorderRadius.circular(999),
                  contentPadding: const EdgeInsets.all(SpacingSize.xl),
                ),
              )
              // ButtonOutline(
              //   press: () {},
              //   bgColor: AppColors.primaryColor,
              //   borderColor: AppColors.primaryColor,
              //   text: "Publicar",
              // ),
              // SizedBox(
              //   width: double.infinity,
              //   child: FilledButton(
              //     onPressed: selectedIndex == null
              //         ? null
              //         : () {
              //             final selected = alertTypes[selectedIndex!]['title'];

              //             if (selected == 'Atividade suspeita') {
              //               context.pop();
              //               widget.onSuspiciousTap();
              //             } else if (selected == 'Roubo ou tentativa') {
              //               context.pop();
              //               widget.onRobberyTap();
              //             }
              //           },
              //     child: const Text('Continuar'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AlertCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;

  /// Nova abordagem
  final Color? iconColor;
  final Color? iconBackgroundColor;

  const _AlertCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
    required this.isSelected,
    this.iconColor,
    this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final iconBaseColor = iconColor ?? colorScheme.primary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? AppColors.primaryColor : context.outline,
              width: isSelected ? 2 : 1,
            ),
            color: isSelected
                ? AppColors.primaryColor.withValues(alpha: 0.06)
                : context.primaryBgCardLow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Icon
              Container(
                width: 42.w,
                height: 42.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: iconBaseColor.withValues(alpha: 0.12),
                ),
                child: Icon(
                  icon,
                  color: iconBaseColor,
                  size: 18.w,
                ),
              ),

              const SizedBox(height: 12),

              /// Title
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: context.primaryTextColor,
                      fontSize: context.safeSp(14),
                    ),
              ),

              const SizedBox(height: 6),

              /// Description
              Text(
                description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: context.primaryTextColor,
                      fontSize: context.safeSp(10),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
