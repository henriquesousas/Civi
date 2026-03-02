// import 'package:deehelp/core/extension/context_extension.dart';
// import 'package:deehelp/core/extension/date_extension.dart';
// import 'package:deehelp/old_core/ui/theme/app_colors.dart';
// import 'package:deehelp/old_core/ui/widgets/button/ui_elevated_button.dart';
// import 'package:deehelp/old_core/ui/widgets/textfield/ui_text_field_rounded.dart';
// import 'package:deehelp/feature/incidents/providers/report_incident_viewmodel_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ReportIncidentSelectDate extends ConsumerWidget {
//   const ReportIncidentSelectDate({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final viewModel = ref.watch(reportIncidentViewmodelProvider.notifier);
//     final state = ref.watch(reportIncidentViewmodelProvider);
//     return Row(
//       spacing: 5,
//       children: [
//         Expanded(
//           flex: 3,
//           child: UITextFieldRounded(
//             showLabelText: false,
//             labelText: "",
//             hintText: "Data do ocorrido...",
//             onTap: () async {
//               final picked = await context.pickDate(
//                 initialDate: state.occurredAt,
//               );
//               if (picked != null && picked != state.occurredAt) {
//                 viewModel.onOccurredAtChange(picked);
//               }
//             },
//             prefixIcon: const Icon(
//               Icons.calendar_month_outlined,
//               color: AppColors.textColorBody,
//             ),
//             readOnly: true,
//             controller: TextEditingController(
//               text: state.occurredAt != null
//                   ? state.occurredAt?.toDayMonthYearFormat()
//                   : "",
//             ),
//             error: state.errorOccurredAt,
//             fillColor: Theme.of(context).colorScheme.secondaryContainer,
//             borderColor: Theme.of(context).colorScheme.outlineVariant,
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: UIElevatedButton(
//             radius: 8,
//             text: "Hoje",
//             press: () {
//               viewModel.onOccurredAtChange(DateTime.now());
//             },
//           ),
//         )
//       ],
//     );
//   }
// }
