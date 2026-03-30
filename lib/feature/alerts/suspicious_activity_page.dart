import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/size/spacing_size.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/buttons/ui_hold_confirm_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

enum SuspiciousType {
  following,
  breakAttempt,
  weapon,
  robberyRisk,
  parkedTooLong,
  slowDriving,
  noPlate,
  recording,
  askingInfo,
  doorChecking,
  peeking,
  waiting,
}

class SuspiciousActivityPage extends StatefulWidget {
  const SuspiciousActivityPage({super.key});

  @override
  State<SuspiciousActivityPage> createState() => _SuspiciousActivityPageState();
}

class _SuspiciousActivityPageState extends State<SuspiciousActivityPage> {
  SuspiciousType? selectedType;
  final TextEditingController descriptionController = TextEditingController();

  final types = const [
    (SuspiciousType.robberyRisk, 'Risco de assalto'),
    (SuspiciousType.following, 'Seguindo pessoas'),
    (SuspiciousType.breakAttempt, 'Tentativa de invasão'),
    (SuspiciousType.parkedTooLong, 'Veículo parado há muito tempo'),
    (SuspiciousType.slowDriving, 'Rodando devagar observando'),
    (SuspiciousType.noPlate, 'Sem placa'),
    (SuspiciousType.recording, 'Filmando casas/pessoas'),
    (SuspiciousType.doorChecking, 'Mexendo em portões'),
    (SuspiciousType.peeking, 'Olhando residências'),
    (SuspiciousType.waiting, 'Aguardando suspeitamente'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: DefaultAppBar(
        title: "Atividade suspeita",
        showBackButton: true,
        leading: const Icon(
          Icons.close_rounded,
        ),
        press: () => context.pop(),
      ),

      /// BOTÃO FIXO
      bottomNavigationBar: _PublishButton(
        enabled: selectedType != null &&
            descriptionController.text.trim().isNotEmpty,
        onTap: _onPublish,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            Text(
              'Informe rapidamente o que você observou na região.',
              style: TextStyle(
                color: context.secondaryTextColor,
                fontSize: context.safeSp(12),
                height: 1.4,
              ),
            ),

            const SizedBox(height: 20),

            /// LOCAL
            const _SectionTitle('Local do alerta'),
            const SizedBox(height: 10),
            _LocationCard(),
            const SizedBox(height: 22),

            /// TIPO
            const _SectionTitle('O que você percebeu?'),
            const SizedBox(height: 10),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: types.map((e) {
                final isSelected = selectedType == e.$1;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedType = e.$1;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF2B5BEE)
                          // : Colors.white.withValues(alpha: 0.05),
                          : context.primaryBgCardHigh,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF2B5BEE)
                            // : Colors.white.withValues(alpha: 0.08),
                            : context.primaryBgCard,
                      ),
                    ),
                    child: Text(
                      e.$2,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : context.primaryTextColor,
                        fontSize: context.safeSp(12),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 22),

            /// DESCRIÇÃO
            // _SectionTitle('O que chamou sua atenção?'),
            // const SizedBox(height: 10),

            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.white.withValues(alpha: 0.04),
            //     borderRadius: BorderRadius.circular(16),
            //     border: Border.all(
            //       color: Colors.white.withValues(alpha: 0.06),
            //     ),
            //   ),
            //   child: TextField(
            //     controller: descriptionController,
            //     maxLines: 4,
            //     style: const TextStyle(color: Colors.white),
            //     onChanged: (_) => setState(() {}),
            //     decoration: InputDecoration(
            //       hintText:
            //           'Ex: veículo parado há muito tempo observando as casas da rua',
            //       hintStyle: TextStyle(
            //         color: Colors.white.withValues(alpha: 0.4),
            //       ),
            //       border: InputBorder.none,
            //       contentPadding: const EdgeInsets.all(14),
            //     ),
            //   ),
            // ),

            // const SizedBox(height: 22),

            /// FOTO OPCIONAL
            // _SectionTitle('Adicionar foto (opcional)'),
            // const SizedBox(height: 10),
            // GestureDetector(
            //   onTap: () {
            //     // TODO: abrir picker
            //   },
            //   child: Container(
            //     height: 120,
            //     decoration: BoxDecoration(
            //       color: Colors.white.withValues(alpha: 0.04),
            //       borderRadius: BorderRadius.circular(18),
            //       border: Border.all(
            //         color: Colors.white.withValues(alpha: 0.06),
            //       ),
            //     ),
            //     child: Center(
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           const Icon(
            //             CupertinoIcons.camera,
            //             color: Colors.white70,
            //           ),
            //           const SizedBox(height: 6),
            //           Text(
            //             'Adicionar imagem',
            //             style: TextStyle(
            //               color: Colors.white.withValues(alpha: 0.7),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            const SizedBox(height: 18),

            /// INFO
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.info_circle,
                    size: 16.w,
                    color: Colors.white70,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Evite se expor. Publique apenas situações reais.',
                      style: TextStyle(
                        color: context.secondaryTextColor,
                        fontSize: context.safeSp(11),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPublish() {
    // TODO: enviar alerta
  }
}

/// COMPONENTES

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: context.primaryTextColor,
        fontSize: context.safeSp(14),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.primaryBgCardLow,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: context.primaryBgCard,
        ),
      ),
      child: Row(
        children: [
          const Icon(
            CupertinoIcons.location,
            color: Color(0xFF82A7FF),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Rua Antônio Agú, Centro - Osasco',
              style: TextStyle(
                // color: Colors.white.withValues(alpha: 0.85),
                color: context.secondaryTextColor,
                fontSize: context.safeSp(13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PublishButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onTap;

  const _PublishButton({
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
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
      ),
    );
  }
}
