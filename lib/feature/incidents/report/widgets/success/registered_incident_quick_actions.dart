import 'package:deehelp/old_core/ui/extensions/dialog_extension.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_core/utils/url_launcher_utils.dart';
import 'package:deehelp/feature/incidents/providers/report_incident_viewmodel_provider.dart';
import 'package:deehelp/feature/incidents/report/widgets/success/registered_incident_quick_action_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisteredIncidentQuickActions extends ConsumerWidget {
  const RegisteredIncidentQuickActions({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(Dimens.size20.w),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(Dimens.size20.w),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.25),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RegisteredIncidentQuickActionItem(
            icon: Icons.people_alt_rounded,
            value: 'Compartilhar',
            label: 'Amigos',
            press: () async {
              await UrlLauncherUtils.shareIncident(
                context,
                ref.watch(reportIncidentViewmodelProvider).alertId ?? '',
                DateTime.now(),
              );
            },
          ),
          Container(
            width: 1,
            height: Dimens.size40.h,
            color: Colors.white.withValues(alpha: 0.3),
          ),
          RegisteredIncidentQuickActionItem(
            icon: Icons.local_police,
            value: 'Polícia',
            label: 'Ligar',
            press: () {
              try {
                UrlLauncherUtils.makePhoneCall("190");
              } catch (e) {
                context.showDilaog(
                  "Não foi possível fazer a ligação",
                  "Por favor faça a ligação para 190 manualmente.",
                );
              }
            },
          ),
          // Container(
          //   width: 1,
          //   height: Dimens.size40.h,
          //   color: Colors.white.withValues(alpha: 0.3),
          // ),
          // QuickActionTileWidget(
          //   icon: Icons.shield,
          //   value: '100%',
          //   label: 'Confiabilidade',
          //   press: () {
          //     customModalBottomSheet(
          //       context,
          //       child: InformativoCardsPage(),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
