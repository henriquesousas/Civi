// import 'package:deehelp/core/extension/context_extension.dart';
// import 'package:deehelp/core/extension/time_extension.dart';
// import 'package:deehelp/old_core/ui/theme/app_colors.dart';
// import 'package:deehelp/old_core/ui/widgets/button/ui_elevated_button.dart';
// import 'package:deehelp/old_core/ui/widgets/textfield/ui_text_field_rounded.dart';
// import 'package:deehelp/module/incident/domain/enum/type_alert.dart';
// import 'package:deehelp/feature/incidents/providers/report_incident_viewmodel_provider.dart';
// import 'package:deehelp/feature/incidents/report/widgets/register/report_incident_card_animated.dart';
// import 'package:deehelp/feature/incidents/report/widgets/register/report_incident_info.dart';
// import 'package:deehelp/feature/incidents/report/widgets/register/report_incident_select_date.dart';
// import 'package:deehelp/feature/incidents/report/widgets/register/card_type_incident.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ReportIncidentCardDetailed extends ConsumerWidget {
//   const ReportIncidentCardDetailed({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final viewModel = ref.watch(reportIncidentViewmodelProvider.notifier);
//     final state = ref.watch(reportIncidentViewmodelProvider);
//     final hasProductSelected = state.product != null;
//     return Visibility(
//       visible: hasProductSelected,
//       child: CardTypeIncident(
//         press: () => viewModel.selectAlertType(TypeAlert.detailed),
//         selected: state.type == TypeAlert.detailed,
//         title: "Detalhado",
//         subTitle:
//             "Registre o roubo do seu veículo com informações completas, como características do veículo, local e horário do ocorrido, ajudando na identificação e no acompanhamento do caso.",
//         child: ReportIncidentCardAnimated(
//           height: state.type == TypeAlert.detailed ? null : 0,
//           opacity: state.type == TypeAlert.detailed ? 1 : 0,
//           child: Column(
//             spacing: 10,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const ReportIncidentInfo(),
//               const ReportIncidentSelectDate(),
//               UITextFieldRounded(
//                 showLabelText: false,
//                 labelText: "",
//                 hintText: "Hora do ocorrido...",
//                 onTap: () {
//                   context
//                       .pickTime(
//                     initialTime: state.timeOccurredAt,
//                   )
//                       .then((picked) {
//                     if (picked != null && picked != state.timeOccurredAt) {
//                       viewModel.onTimeOccurredAtChange(picked);
//                     }
//                   });
//                 },
//                 readOnly: true,
//                 prefixIcon: const Icon(
//                   Icons.av_timer,
//                   color: AppColors.textColorBody,
//                 ),
//                 controller: TextEditingController(
//                   text: state.timeOccurredAt != null
//                       ? state.timeOccurredAt?.to24hFormat()
//                       : "",
//                 ),
//                 fillColor: Theme.of(context).colorScheme.secondaryContainer,
//                 borderColor: Theme.of(context).colorScheme.outlineVariant,
//               ),
//               UITextFieldRounded(
//                 showLabelText: false,
//                 labelText: "",
//                 hintText: "Estado...",
//                 controller: state.stateController,
//                 onChanged: (value) => viewModel.onStateChange(value),
//                 error: state.stateError,
//                 fillColor: Theme.of(context).colorScheme.secondaryContainer,
//                 borderColor: Theme.of(context).colorScheme.outlineVariant,
//               ),
//               UITextFieldRounded(
//                 showLabelText: false,
//                 labelText: "",
//                 hintText: "Cidade...",
//                 controller: state.cityController,
//                 onChanged: (value) => viewModel.onCityChange(value),
//                 error: state.cityError,
//                 fillColor: Theme.of(context).colorScheme.secondaryContainer,
//                 borderColor: Theme.of(context).colorScheme.outlineVariant,
//               ),
//               UITextFieldRounded(
//                 showLabelText: false,
//                 labelText: "",
//                 hintText: "Rua,Avenida próximo (não precisa ser exato)",
//                 onChanged: (v) => viewModel.onFullAddressChange(v),
//                 error: state.errorFullAddress,
//                 fillColor: Theme.of(context).colorScheme.secondaryContainer,
//                 borderColor: Theme.of(context).colorScheme.outlineVariant,
//               ),
//               UITextFieldRounded(
//                 showLabelText: false,
//                 labelText: "",
//                 hintText: "Como acontenceu, conte mais detalhes...",
//                 onChanged: (v) => viewModel.onHowToChange(v),
//                 maxLine: 8,
//                 fillColor: Theme.of(context).colorScheme.secondaryContainer,
//                 borderColor: Theme.of(context).colorScheme.outlineVariant,
//               ),
//               UIElevatedButton(
//                 text: "Salvar incidente",
//                 isEnabled: state.isFormValid,
//                 isLoading: state.isLoading,
//                 press: () => viewModel.saveDetailed(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
