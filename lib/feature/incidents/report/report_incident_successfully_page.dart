import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/styles/app_text_style.dart';
import 'package:deehelp/old_core/ui/widgets/bubble/bubble_export.dart';
import 'package:deehelp/old_core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/feature/incidents/report/widgets/action_row.dart';
import 'package:deehelp/feature/incidents/report/widgets/check_row.dart';
import 'package:deehelp/feature/incidents/report/widgets/glass_header.dart';
import 'package:deehelp/feature/incidents/report/widgets/glass_inline_info.dart';
import 'package:deehelp/feature/incidents/report/widgets/mini_pill.dart';
import 'package:deehelp/feature/incidents/report/widgets/register/glass_card.dart';
import 'package:deehelp/feature/incidents/report/widgets/success/regiter_incident_success_args.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/feature/items/success/top_bar_v2.dart';
import 'package:deehelp/module/incident/domain/entity/incident_local.dart';
import 'package:deehelp/old_core/utils/url_launcher_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ReportIncidentSuccessfullyPage extends StatelessWidget {
  final RegiterIncidentSuccessArgs args;
  const ReportIncidentSuccessfullyPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  bool get _isPhone => args.itemType == ItemType.phone;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor =
        isDark ? const Color(0xFF050816) : AppColors.primaryColor;

    // final secondaryText = Colors.white.withValues(alpha: 0.82);

    // final softCard = isDark
    //     ? Colors.white.withValues(alpha: 0.06)
    //     : Colors.white.withValues(alpha: 0.12);

    return Scaffold(
      // backgroundColor: context.primaryColor,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: DecorativeBubblesBackground(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 18.h),
                child: Column(
                  children: [
                    TopBarV2(
                      onClose: () => context.pop(),
                    ),
                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          // const OwlSadSpeechBubble(
                          //   message:
                          //       "Estou triste com essa situação... 😔\nMas vamos agir rápido para resolver.",
                          // ),
                          const SizedBox(height: SpacingSize.lg),
                          const _SuccessHero(
                            title: 'Incidente reportado',
                            subtitle:
                                'Agora vamos aumentar as chances de recuperação com os próximos passos recomendados.',
                          ),
                          const SizedBox(height: SpacingSize.lg),
                          _IncidentSummaryCard(
                            itemName: args.item.name,
                            locationText: _getLocation(args.local),
                            alertId: args.alertId,
                            itemType: args.itemType,
                          ),
                          SizedBox(height: 14.h),
                          const GlassCard(
                            child: Padding(
                              padding: EdgeInsets.all(14),
                              child: GlassInlineInfo(
                                icon: Icons.assignment_turned_in_outlined,
                                title: 'Faça o boletim de ocorrência',
                                subtitle:
                                    'Registrar o BO o quanto antes ajuda na investigação e aumenta as chances de recuperação.',
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          const SizedBox(height: SpacingSize.md),
                          const GlassCard(
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: GlassInlineInfo(
                                icon: Icons.health_and_safety_outlined,
                                title: 'Cuide da sua segurança',
                                subtitle:
                                    'Se você ainda estiver em risco, procure um local seguro e acione ajuda imediatamente.',
                              ),
                            ),
                          ),
                          SizedBox(height: 14.h),
                          const SizedBox(height: SpacingSize.xs),
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
                          SizedBox(height: 14.h),
                          GlassCard(
                            child: Padding(
                              padding: EdgeInsets.all(14.r),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const GlassHeader(
                                    icon: Icons.bolt_outlined,
                                    title: 'Ações rápidas',
                                  ),
                                  SizedBox(height: 14.h),
                                  if (_isPhone) ...[
                                    const ActionRow(
                                      icon: Icons.lock_outline_rounded,
                                      title: 'Bloquear o aparelho',
                                      // subtitle:
                                      //     'Veja como proceder com IMEI e operadora',
                                      subtitle:
                                          'Entre em contato com sua operadora',
                                    ),
                                    SizedBox(height: 10.h),
                                  ],
                                  ActionRow(
                                    icon: Icons.share_outlined,
                                    title: 'Compartilhar alerta',
                                    subtitle:
                                        'Ajude a alertar outras pessoas da região',
                                    onTap: () =>
                                        UrlLauncherUtils.shareMyIncident(
                                      context,
                                      args.alertId,
                                      args.createdAt,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
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
                          SizedBox(height: 14.h),
                          // const GlassCard(
                          //   child: Padding(
                          //     padding: EdgeInsets.all(14),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         GlassHeader(
                          //           icon: Icons.track_changes_outlined,
                          //           title: 'O que acontece agora',
                          //         ),
                          //         SizedBox(height: SpacingSize.md),
                          //         Bullet(
                          //           text:
                          //               'Sua ocorrência foi registrada com sucesso.',
                          //         ),
                          //         Bullet(
                          //           text:
                          //               'Ela poderá passar por validação antes de ganhar maior visibilidade.',
                          //         ),
                          //         Bullet(
                          //           text:
                          //               'Você pode atualizar informações e acompanhar o status.',
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(height: SpacingSize.md),
                          ButtonOutline(
                            press: () => context.pop(),
                            bgColor: AppColors.primaryColorDark,
                            borderColor: AppColors.primaryColorDark,
                            textColor: Colors.white,
                            text: "Fechar",
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

class _SuccessHero extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SuccessHero({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 22.h, 20.w, 20.h),
        child: Column(
          children: [
            Container(
              width: 132.w,
              height: 132.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.07),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.10),
                ),
              ),
              child: Center(
                child: Lottie.asset(
                  "assets/lottie/loader_success.json",
                  width: 104.w,
                  height: 104.h,
                  repeat: false,
                ),
              ),
            ),
            SizedBox(height: 18.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(999.r),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.08),
                ),
              ),
              child: Text(
                'Alerta enviado',
                style: context.appTextOld.bodySmall.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.appTextOld.headerxl.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                height: 1.05,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: context.appTextOld.bodySmall.copyWith(
                color: Colors.white.withValues(alpha: 0.90),
                fontWeight: FontWeight.w500,
                height: 1.45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IncidentSummaryCard extends StatelessWidget {
  final String itemName;
  final String locationText;
  final String alertId;
  final ItemType itemType;

  const _IncidentSummaryCard({
    required this.itemName,
    required this.locationText,
    required this.alertId,
    required this.itemType,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemName,
              style: context.appTextOld.headermd.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 6.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.white.withValues(alpha: 0.82),
                  size: 16,
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    locationText,
                    style: context.appTextOld.caption.copyWith(
                      color: Colors.white.withValues(alpha: 0.88),
                      fontWeight: FontWeight.w600,
                      height: 1.35,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                MiniPill(
                  icon: Icons.fingerprint_outlined,
                  text: alertId,
                ),
                MiniPill(
                  icon: itemType.icon,
                  text: itemType == ItemType.phone ? 'Celular' : 'Veículo',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
