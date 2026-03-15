import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/bubble/bubble_export.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/core/utils/url_launcher_utils.dart';
import 'package:deehelp/feature/incidents/report/widgets/action_row.dart';
import 'package:deehelp/feature/incidents/report/widgets/check_row.dart';
import 'package:deehelp/feature/incidents/report/widgets/glass_header.dart';
import 'package:deehelp/feature/incidents/report/widgets/glass_inline_info.dart';
import 'package:deehelp/feature/incidents/report/widgets/mini_pill.dart';
import 'package:deehelp/feature/incidents/report/widgets/register/glass_card.dart';
import 'package:deehelp/feature/incidents/report/widgets/success/regiter_incident_success_args.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/feature/items/success/bullet.dart';
import 'package:deehelp/module/incident/domain/entity/incident_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class TesteReportIncidentSuccessfullyPage extends StatelessWidget {
  final RegiterIncidentSuccessArgs args;

  const TesteReportIncidentSuccessfullyPage({
    super.key,
    required this.args,
  });

  bool get _isPhone => args.itemType == ItemType.phone;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor =
        isDark ? const Color(0xFF050816) : AppColors.primaryColor;

    final secondaryText = Colors.white.withValues(alpha: 0.82);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: DecorativeBubblesBackground(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 18.h),
            child: Column(
              children: [
                _TopActions(
                  onClose: () => context.pop(),
                  onShare: () => UrlLauncherUtils.shareIncident(
                    context,
                    args.alertId,
                    args.createdAt,
                  ),
                ),
                SizedBox(height: 14.h),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const _SuccessHero(
                        title: 'Incidente reportado',
                        subtitle:
                            'Agora vamos aumentar as chances de recuperação com os próximos passos recomendados.',
                      ),
                      SizedBox(height: 14.h),
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
                      SizedBox(height: 14.h),
                      const GlassCard(
                        child: Padding(
                          padding: EdgeInsets.all(14),
                          child: GlassInlineInfo(
                            icon: Icons.health_and_safety_outlined,
                            title: 'Cuide da sua segurança',
                            subtitle:
                                'Se você ainda estiver em risco, procure um local seguro e acione ajuda imediatamente.',
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
                                icon: Icons.checklist_rounded,
                                title: 'Próximos passos',
                              ),
                              SizedBox(height: 14.h),
                              const CheckRow(
                                text: 'Registre o boletim de ocorrência',
                              ),
                              CheckRow(
                                text: _isPhone
                                    ? 'Bloqueie o IMEI junto à operadora'
                                    : 'Acione seguradora ou rastreador, se houver',
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
                                ActionRow(
                                  icon: Icons.lock_outline_rounded,
                                  title: 'Bloquear o aparelho',
                                  subtitle:
                                      'Veja como proceder com IMEI e operadora',
                                  onTap: () {},
                                ),
                                SizedBox(height: 10.h),
                              ],
                              ActionRow(
                                icon: Icons.share_outlined,
                                title: 'Compartilhar alerta',
                                subtitle:
                                    'Ajude a alertar outras pessoas da região',
                                onTap: () => UrlLauncherUtils.shareIncident(
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
                      //         SizedBox(height: 14),
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
                      //               'Você poderá atualizar informações e acompanhar o status no aplicativo.',
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 22.h),
                      ButtonOutline(
                        press: () => context.pop(),
                        bgColor: Colors.white,
                        borderColor: Colors.white.withValues(alpha: 0.20),
                        textColor: Colors.black,
                        text: "Concluir",
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Você também poderá acompanhar esta ocorrência na área de minhas ocorrências.',
                        textAlign: TextAlign.center,
                        style: context.appText.caption.copyWith(
                          color: secondaryText,
                          height: 1.45,
                        ),
                      ),
                      SizedBox(height: 12.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getLocation(IncidentLocal? local) {
    final city = local?.city?.trim();
    final state = local?.state?.trim();

    if ((city == null || city.isEmpty) && (state == null || state.isEmpty)) {
      return "Local não informado";
    }

    if (city != null && city.isNotEmpty && state != null && state.isNotEmpty) {
      return "Ocorrência em $city - $state";
    }

    return city?.isNotEmpty == true
        ? "Ocorrência em $city"
        : "Ocorrência em $state";
  }
}

class _TopActions extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onShare;

  const _TopActions({
    required this.onClose,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _GlassIconButton(
          icon: Icons.close_rounded,
          onTap: onClose,
        ),
        const Spacer(),
        _GlassIconButton(
          icon: Icons.share_outlined,
          onTap: onShare,
        ),
      ],
    );
  }
}

class _GlassIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _GlassIconButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 46.w,
        height: 46.w,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.14),
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
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
                style: context.appText.bodySmall.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.appText.headerxl.copyWith(
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
              style: context.appText.bodySmall.copyWith(
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
              style: context.appText.headermd.copyWith(
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
                    style: context.appText.caption.copyWith(
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
