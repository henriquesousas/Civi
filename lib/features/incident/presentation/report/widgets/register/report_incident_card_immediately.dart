import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/widgets/button/ui_hold_confirm_button.dart';
import 'package:deehelp/features/incident/domain/enum/type_alert.dart';
import 'package:deehelp/features/incident/presentation/providers/report_incident_viewmodel_provider.dart';
import 'package:deehelp/features/incident/presentation/report/widgets/register/card_type_incident.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportIncidentCardImmediately extends ConsumerWidget {
  const ReportIncidentCardImmediately({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(reportIncidentViewmodelProvider.notifier);
    final state = ref.watch(reportIncidentViewmodelProvider);
    return Visibility(
      visible: state.product != null,
      child: CardTypeIncident(
        press: () => viewModel.selectAlertType(TypeAlert.immediately),
        selected: state.type == TypeAlert.immediately,
        title: "Imediato",
        subTitle:
            "Ideal para situações urgentes. Com poucos toques, você envia um alerta instantâneo informando o roubo do seu veículo à comunidade.",
        child: Visibility(
          visible: state.type == TypeAlert.immediately,
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Você poderá adicionar mais detalhes depois.",
                style: context.appTextStyles.bodyTextStyle1.copyWith(
                  // color: AppColors.textColorBody,
                  color: Theme.of(context).colorScheme.surfaceDim,
                ),
              ),
              UIHoldConfirmButton(
                hapticFeedback: true,
                title: state.isLoading ? "Aguarde..." : "Segure pra confirmar",
                textColor: AppColors.whiteColor,
                backgroundColor: AppColors.primaryColorDark,
                contentPadding: const EdgeInsets.all(22),
                onProgressCompleted: () async => viewModel.saveImmediatelly(),
                onApiCall: () async {},
                onProgressChange: (v) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
