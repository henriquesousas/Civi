import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/size/spacing_size.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/buttons/ui_hold_confirm_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RobberyAttemptTypePage extends StatefulWidget {
  const RobberyAttemptTypePage({super.key});

  @override
  State<RobberyAttemptTypePage> createState() => _RobberyAttemptTypePageState();
}

class _RobberyAttemptTypePageState extends State<RobberyAttemptTypePage> {
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
    // _AlertOption(
    //   id: 'phone_theft',
    //   title: 'Roubo de celular',
    //   subtitle: 'Celular ou pertence foi roubado durante a abordagem.',
    //   icon: Icons.smartphone_rounded,
    //   iconBackgroundColor: Color(0xFF3A1818),
    //   iconColor: Color(0xFFFB7185),
    // ),
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
                                const Color(0xFF2B5BEE).withValues(alpha: 0.14),
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
                onProgressCompleted: () async {},
                onApiCall: () async {},
                onProgressChange: (v) {},
                hapticFeedback: true,
                title: "Segure para publicar",
                textColor: Colors.white,
                backgroundColor: AppColors.primaryColorDark,
                contentPadding: const EdgeInsets.all(SpacingSize.xl),
              ),
            )
            // Container(
            //   padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
            //   decoration: BoxDecoration(
            //     color: context.primaryBgCard,
            //     border: Border(
            //       top: BorderSide(color: context.outlineVariantColor),
            //     ),
            //   ),
            //   child: SafeArea(
            //     top: false,
            //     child: SizedBox(
            //       width: double.infinity,
            //       height: 54,
            //       child: FilledButton(
            //         onPressed: selectedType == null ? null : () {},
            //         style: FilledButton.styleFrom(
            //           backgroundColor: const Color(0xFF2B5BEE),
            //           disabledBackgroundColor:
            //               const Color(0xFF2B5BEE).withOpacity(0.35),
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(16),
            //           ),
            //         ),
            //         child: const Text(
            //           'Continuar',
            //           style: TextStyle(
            //             fontSize: 16,
            //             fontWeight: FontWeight.w700,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
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
