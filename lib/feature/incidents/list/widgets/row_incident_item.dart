// import 'package:deehelp/core/extension/color_extension.dart';
// import 'package:deehelp/core/theme/export_theme.dart';
// import 'package:deehelp/core/ui/styles/app_text_style.dart';
// import 'package:deehelp/core/ui/widgets/badge/export_badge.dart';
// import 'package:deehelp/core/ui/widgets/image/export_image.dart';
// import 'package:deehelp/feature/home/widgets/recent_incident_card.dart';
// import 'package:deehelp/feature/incidents/list/widgets/fake_incident_list_model.dart';
// import 'package:deehelp/feature/incidents/list/widgets/meta_pill.dart';
// import 'package:deehelp/feature/incidents/list/widgets/see_detail_button.dart';
// import 'package:flutter/material.dart';

// class RowIncidentItem extends StatelessWidget {
//   final FakeIncidentListModel item;
//   final VoidCallback onTap;

//   const RowIncidentItem({
//     super.key,
//     required this.item,
//     required this.onTap,
//   });

//   bool get _hasImage =>
//       item.imageUrl != null && item.imageUrl!.trim().isNotEmpty;

//   IconData get _fallbackIcon => switch (item.itemType) {
//         ItemType.car => Icons.directions_car_rounded,
//         ItemType.moto => Icons.two_wheeler_rounded,
//         ItemType.phone => Icons.smartphone_rounded,
//       };

//   String _kindLabel(IncidentKind kind) => switch (kind) {
//         IncidentKind.robbery => 'Roubo',
//         IncidentKind.theft => 'Furto',
//         IncidentKind.recovered => 'Recuperado',
//       };

//   Color _kindColor(IncidentKind kind) => switch (kind) {
//         IncidentKind.robbery => const Color(0xFFE53935),
//         IncidentKind.theft => const Color(0xFFF59E0B),
//         IncidentKind.recovered => const Color(0xFF16A34A),
//       };

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(RadiusSize.xl),
//       child: Ink(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(RadiusSize.xl),
//           border: Border.all(color: context.outlineVariantColor),
//           boxShadow: const [
//             BoxShadow(
//               color: Color(0x0F000000),
//               blurRadius: 18,
//               offset: Offset(0, 10),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(LayoutSpacingSize.card),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(18),
//                     child: Container(
//                       width: 82,
//                       height: 74,
//                       color: const Color(0xFFF5F7FD),
//                       child: (item.isVehicle && _hasImage)
//                           ? CustomNetworkImage(imageUrl: item.imageUrl!)
//                           : Center(
//                               child: Icon(
//                                 _fallbackIcon,
//                                 color: context.secondaryColor,
//                                 size: IconSizes.lg,
//                               ),
//                             ),
//                     ),
//                   ),
//                   const SizedBox(width: SpacingSize.md),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 item.itemName,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: context.appText.headermd,
//                               ),
//                             ),
//                             StatusBadge(
//                               style: StatusStyle.from(ItemStatus.active),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: SpacingSize.sm),
//                         Text(
//                           item.location,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: context.appText.bodySmall,
//                         ),
//                         const SizedBox(height: SpacingSize.sm),
//                         Wrap(
//                           spacing: 8,
//                           runSpacing: 8,
//                           children: [
//                             MetaPill(
//                               icon: Icons.schedule_rounded,
//                               text: item.happenedAt,
//                             ),
//                             MetaPill(
//                               icon: Icons.cloud_upload_outlined,
//                               text: item.postedAt,
//                             ),
//                             // _StatusPill(status: item.status),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: SpacingSize.md),
//               Divider(height: 1, color: context.secondaryContainer),
//               const SizedBox(height: SpacingSize.md),
//               Row(
//                 children: [
//                   Icon(
//                     Icons.description_outlined,
//                     size: IconSizes.xs,
//                     color: context.secondaryColor,
//                   ),
//                   const SizedBox(width: SpacingSize.xs),
//                   Text(
//                     'Como foi o roubo',
//                     style: context.appText.caption.copyWith(
//                       fontWeight: FontWeight.w900,
//                       color: context.secondaryColor,
//                       letterSpacing: 0.2,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: SpacingSize.sm),
//               Container(
//                 padding: const EdgeInsets.all(SpacingSize.md),
//                 decoration: BoxDecoration(
//                     color: context.secondaryContainer,
//                     borderRadius:
//                         const BorderRadius.all(Radius.circular(RadiusSize.sm))),
//                 child: Text(
//                   item.how.trim().isEmpty ? 'Não informado.' : item.how.trim(),
//                   maxLines: 3,
//                   overflow: TextOverflow.ellipsis,
//                   style: context.appText.caption.copyWith(
//                     fontWeight: FontWeight.w700,
//                     height: 1.25,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: SpacingSize.md),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SeeDetailButton(
//                     alignment: Alignment.centerLeft,
//                     text: 'Celular roubado',
//                   ),
//                   SeeDetailButton(
//                     alignment: Alignment.centerRight,
//                     text: 'Ver detalhes',
//                     showIndicator: true,
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
