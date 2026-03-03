import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/bubble/bubble_export.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:deehelp/feature/incidents/report/widgets/action_row.dart';
import 'package:deehelp/feature/incidents/report/widgets/check_row.dart';
import 'package:deehelp/feature/incidents/report/widgets/glass_header.dart';
import 'package:deehelp/feature/incidents/report/widgets/glass_inline_info.dart';
import 'package:deehelp/feature/incidents/report/widgets/mini_pill.dart';
import 'package:deehelp/feature/incidents/report/widgets/register/glass_card.dart';
import 'package:deehelp/feature/incidents/report/widgets/speech_bubble.dart';
import 'package:deehelp/feature/incidents/report/widgets/success/regiter_incident_success_args.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/feature/items/success/bullet.dart';
import 'package:deehelp/module/incident/domain/entity/incident_local.dart';
import 'package:deehelp/module/incident/domain/enum/type_alert.dart';
import 'package:deehelp/core/utils/url_launcher_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReportIncidentSuccessfullyPage extends StatelessWidget {
  final RegiterIncidentSuccessArgs args;
  const ReportIncidentSuccessfullyPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SafeArea(
        child: DecorativeBubblesBackground(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => context.pop(),
                          child: HighlightIcon(
                            containerSize: IconSizes.xxl,
                            radius: RadiusSize.md,
                            border: Border.all(
                                color: Colors.white.withValues(alpha: 0.18)),
                            bgColor: AppColors.primaryColorVariant
                                .withValues(alpha: 0.7),
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => UrlLauncherUtils.shareIncident(
                              context, args.alertId, args.createdAt),
                          child: HighlightIcon(
                            containerSize: IconSizes.xxl,
                            radius: RadiusSize.md,
                            border: Border.all(
                                color: Colors.white.withValues(alpha: 0.18)),
                            bgColor: AppColors.primaryColorVariant
                                .withValues(alpha: 0.7),
                            icon: const Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: SpacingSize.lg),
                    Expanded(
                      child: ListView(
                        children: [
                          const OwlSadSpeechBubble(
                            message:
                                "Estou triste com essa situação... 😔\nMas vamos agir rápido para resolver.",
                          ),
                          const SizedBox(height: SpacingSize.lg),
                          Text(
                            'Incidente reportado!',
                            textAlign: TextAlign.center,
                            style: context.appText.headerxl.copyWith(
                              color: Colors.white,
                              letterSpacing: 0.2,
                            ),
                          ),
                          const SizedBox(height: SpacingSize.lg),
                          Text(
                            "Agora vamos aumentar as chances de recuperação seguindo os próximos passos",
                            textAlign: TextAlign.center,
                            style: context.appText.bodySmall.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withValues(alpha: 0.92),
                              height: 1.35,
                            ),
                          ),
                          const SizedBox(height: SpacingSize.lg),
                          GlassCard(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    args.item.name,
                                    style: context.appText.headermd.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: SpacingSize.xs),
                                  Text(
                                    _getLocation(args.local),
                                    style: context.appText.caption.copyWith(
                                      color:
                                          Colors.white.withValues(alpha: 0.90),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: SpacingSize.md),
                                  Wrap(
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: [
                                      MiniPill(
                                        icon: Icons.fingerprint_outlined,
                                        text: args.alertId,
                                      ),
                                      MiniPill(
                                        icon: Icons.flash_on_outlined,
                                        text: args.typeAlert ==
                                                TypeAlert.immediately
                                            ? 'Imediato'
                                            : 'Detalhado',
                                      ),
                                      MiniPill(
                                        icon: args.itemType.icon,
                                        text: args.itemType != ItemType.phone
                                            ? 'Veículo'
                                            : 'Celular',
                                      ),
                                    ],
                                  ),
                                  // if (args.itemType == ItemType.phone &&
                                  //     (imei?.isNotEmpty ?? false)) ...[
                                  //   const SizedBox(height: 12),
                                  //   _GlassInlineInfo(
                                  //     icon: Icons.dialpad_outlined,
                                  //     title: 'IMEI',
                                  //     subtitle: imei!,
                                  //     trailing: _InlineChipButton(
                                  //       label: 'Copiar',
                                  //       icon: Icons.copy_outlined,
                                  //       onTap: () => _copyImei(context),
                                  //     ),
                                  //   ),
                                  // ],
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: SpacingSize.md),
                          const GlassCard(
                            child: Padding(
                              padding: EdgeInsets.all(14),
                              child: GlassInlineInfo(
                                icon: Icons.assignment_turned_in_outlined,
                                title: 'Faça o boletim de ocorrência',
                                subtitle:
                                    'Recomendamos registrar o BO o mais rápido possível. Isso ajuda na investigação e aumenta as chances de recuperação.',
                              ),
                            ),
                          ),

                          const SizedBox(height: SpacingSize.md),

                          // ✅ Safety note
                          const GlassCard(
                            child: Padding(
                              padding: EdgeInsets.all(14),
                              child: GlassInlineInfo(
                                icon: Icons.health_and_safety_outlined,
                                title: 'Cuide da sua segurança',
                                subtitle:
                                    'Se você estiver em risco, procure um local seguro e acione ajuda imediatamente.',
                              ),
                            ),
                          ),
                          const SizedBox(height: SpacingSize.md),

                          GlassCard(
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const GlassHeader(
                                    icon: Icons.checklist_outlined,
                                    title: 'Próximos passos',
                                  ),
                                  const SizedBox(height: SpacingSize.md),
                                  const CheckRow(
                                    text: 'Registre o boletim de ocorrência',
                                  ),
                                  CheckRow(
                                    text: args.itemType == ItemType.phone
                                        ? 'Bloqueie o IMEI junto à operadora'
                                        : 'Acione seguradora/rastreador, se houver',
                                  ),
                                  const CheckRow(
                                    text: 'Avise pessoas próximas',
                                  ),
                                  const CheckRow(
                                    text: 'Acompanhe atualizações no app',
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: SpacingSize.md),

                          // ✅ Contextual actions
                          GlassCard(
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                children: [
                                  if (args.itemType == ItemType.phone) ...[
                                    ActionRow(
                                      icon: Icons.lock_outline,
                                      title:
                                          'Orientações para bloquear o aparelho',
                                      subtitle:
                                          'Como proceder com IMEI e operadora',
                                      onTap: () => {},
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                  // if (args.itemType != ItemType.phone) ...[
                                  //   ActionRow(
                                  //     icon: Icons.shield_outlined,
                                  //     title: 'Avisar seguradora/rastreador',
                                  //     subtitle:
                                  //         'Entre em contato com seu serviço de proteção',
                                  //     onTap: () => {},
                                  //   ),
                                  //   const SizedBox(height: 10),
                                  // ],
                                  ActionRow(
                                    icon: Icons.share_outlined,
                                    title: 'Compartilhar',
                                    subtitle: 'Ajude a alertar outras pessoas',
                                    onTap: () => UrlLauncherUtils.shareIncident(
                                        context, args.alertId, args.createdAt),
                                  ),
                                  const SizedBox(height: 10),
                                  ActionRow(
                                    icon: Icons.local_police_outlined,
                                    title: 'Chamar a polícia',
                                    subtitle: 'Discar 190',
                                    onTap: () =>
                                        UrlLauncherUtils.makePhoneCall("190"),
                                    highlight: true,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: SpacingSize.md),

                          // ✅ Transparency: what happens now
                          const GlassCard(
                            child: Padding(
                              padding: EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GlassHeader(
                                    icon: Icons.track_changes_outlined,
                                    title: 'O que acontece agora',
                                  ),
                                  SizedBox(height: SpacingSize.md),
                                  Bullet(
                                    text:
                                        'Sua ocorrência foi registrada com sucesso.',
                                  ),
                                  Bullet(
                                    text:
                                        'Ela poderá passar por validação antes de ganhar maior visibilidade.',
                                  ),
                                  Bullet(
                                    text:
                                        'Você pode atualizar informações e acompanhar o status.',
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: SpacingSize.md),

                          // Primary CTA
                          ButtonOutline(
                            press: () => context.pop(),
                            bgColor: Colors.white,
                            text: "Concluir",
                          ),

                          const SizedBox(height: SpacingSize.md),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String _getLocation(IncidentLocal? local) {
    if (local?.city?.isEmpty == true && local?.state?.isEmpty == true) {
      return "Local não informado.";
    }

    return "Roubado (a) em ${local?.city} - ${local?.state}";
  }
}

// class _SpeechBubble extends StatelessWidget {
//   final String message;

//   const _SpeechBubble({required this.message});

//   @override
//   Widget build(BuildContext context) {
//     const borderColor = Colors.white;
//     const textColor = Colors.white;

//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         /// Caixa principal
//         Container(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 18,
//             vertical: 16,
//           ),
//           decoration: BoxDecoration(
//             color: Colors.transparent,
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(
//               color: borderColor.withOpacity(0.9),
//               width: 1.6,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.15),
//                 blurRadius: 20,
//                 offset: const Offset(0, 10),
//               ),
//             ],
//           ),
//           child: Text(
//             message,
//             style: const TextStyle(
//               fontSize: 14,
//               height: 1.5,
//               fontWeight: FontWeight.w500,
//               color: textColor,
//             ),
//           ),
//         ),

//         /// Rabinho transparente com borda
//         Positioned(
//           left: -10,
//           top: 26,
//           child: CustomPaint(
//             size: const Size(18, 18),
//             painter: _BubbleTailPainter(borderColor),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _BubbleTailPainter extends CustomPainter {
//   final Color borderColor;

//   _BubbleTailPainter(this.borderColor);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final path = Path();
//     path.moveTo(size.width, 0);
//     path.lineTo(0, size.height / 2);
//     path.lineTo(size.width, size.height);
//     path.close();

//     // Sombra suave
//     canvas.drawShadow(path, Colors.black.withOpacity(0.15), 6, true);

//     // Apenas borda
//     final paint = Paint()
//       ..color = borderColor.withOpacity(0.9)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1.6;

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
