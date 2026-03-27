// import 'package:deehelp/core/extension/color_extension.dart';
// import 'package:deehelp/core/services/permissions/location/providers/location_providers.dart';
// import 'package:deehelp/core/theme/export_theme.dart';
// import 'package:deehelp/core/utils/navigation_utils.dart';
// import 'package:deehelp/feature/home/widgets/card_header.dart';
// import 'package:deehelp/feature/home/widgets/empty_incident_state.dart';
// import 'package:deehelp/feature/home/widgets/incident_loading.dart';
// import 'package:deehelp/feature/home/widgets/incident_row_item.dart';
// import 'package:deehelp/feature/home/widgets/pill.dart';
// import 'package:deehelp/feature/home/widgets/quick_action_tile.dart';
// import 'package:deehelp/feature/home/widgets/thini_divider.dart';
// import 'package:deehelp/feature/incidents/incident_router.dart';
// import 'package:deehelp/feature/incidents/providers/incident_selected_provider.dart';
// import 'package:deehelp/feature/items/items_router.dart';
// import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
// import 'package:deehelp/feature/profile/export_profile.dart';
// import 'package:deehelp/feature/search/search_args.dart';
// import 'package:deehelp/feature/search/search_router.dart';
// import 'package:deehelp/feature/sos/sos_router.dart';
// import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
// import 'package:deehelp/feature/home/home_viewmodel_provider.dart';
// import 'widgets/home_app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';

// class HomePage extends ConsumerStatefulWidget {
//   const HomePage({super.key});

//   @override
//   ConsumerState<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends ConsumerState<HomePage> {
//   String? _region;
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback(
//       (_) {
//         final currenLocation = ref.watch(currentLocationProvider);
//         _region = '${currenLocation?.city} • ${currenLocation?.state}';
//         ref
//             .read(homeViewmodelProvider.notifier)
//             .getRecentIncidents(currenLocation);
//       },
//     );

//     super.initState();
//   }

//   bool isToday(DateTime date) {
//     final now = DateTime.now();
//     return date.year == now.year &&
//         date.month == now.month &&
//         date.day == now.day;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(homeViewmodelProvider);

//     // final incidents = state.asData?.value ?? [];

//     // final hasTodayIncident =
//     //     incidents.any((incident) => isToday(incident.occurredAt));

//     return Scaffold(
//       appBar: HomeAppBar(
//         region: _region,
//         press: () => context.push(ProfileRouter.path),
//       ),
//       body: SafeArea(
//         child: ListView(
//           padding: const EdgeInsets.all(LayoutSpacingSize.page),
//           children: [
//             // Visibility(
//             //   visible: hasTodayIncident,
//             //   child: RegionAlertCard(
//             //     tag: "Roubo de celular",
//             //     meta: "Últimas 24h • 1,8 km",
//             //     onTap: () {
//             //       // abrir mapa/ocorrências próximas
//             //     },
//             //     onSeeDetails: () {
//             //       // navegar para detalhes / listagem filtrada
//             //     },
//             //   ),
//             // ),
//             // Lottie.asset("assets/lottie/warning.json"),
//             const SizedBox(height: 14),
//             PageCard(
//               child: Column(
//                 children: [
//                   const CardHeader(
//                     title: 'Acesso rápido',
//                     subtitle: 'Atalhos úteis para a sua região',
//                     icon: Icons.flash_on_rounded,
//                   ),
//                   const ThinDivider(),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                               child: QuickActionTile(
//                                 icon: Icons.record_voice_over_rounded,
//                                 title: 'Ocorrência',
//                                 subtitle: 'Registrar',
//                                 accent: AppColors.danger,
//                                 onTap: () {
//                                   //  context.push(IncidentRouter.register)
//                                   final path = NavigationUtils.safeNavigation(
//                                       IncidentRouter.register, ref);
//                                   context.push(path);
//                                 },
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: QuickActionTile(
//                                 icon: Icons.search_rounded,
//                                 title: 'Pesquisar',
//                                 subtitle: 'Placa / IMEI',
//                                 accent: context.primaryColor,
//                                 onTap: () => context.push(
//                                   SearchRouter.search,
//                                   extra: SearchArgs(showBackButton: true),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 12),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: QuickActionTile(
//                                 icon: Icons.inventory_2_outlined,
//                                 title: 'Item',
//                                 subtitle: 'Registrar novo',
//                                 accent: AppColors.success,
//                                 onTap: () {
//                                   final path = NavigationUtils.safeNavigation(
//                                     ItemsRouter.register,
//                                     ref,
//                                   );
//                                   context.push(path);
//                                 },
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: QuickActionTile(
//                                 icon: Icons.shield_outlined,
//                                 title: 'Emergência',
//                                 subtitle: 'Contatos rápidos',
//                                 accent: const Color(0xFF6B7280),
//                                 onTap: () => context.push(SOSRouter.path),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 14),
//             state.maybeMap(
//               data: (data) {
//                 if (data.value.isEmpty) {
//                   return const Expanded(child: EmptyIncidentsState());
//                 }
//                 return _incidents(data.value);
//               },
//               loading: (loading) {
//                 return const IncidentLoading();
//               },
//               orElse: () => const Expanded(child: EmptyIncidentsState()),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _incidents(List<IncidentOutput> incidents) {
//     return PageCard(
//       child: Column(
//         children: [
//           Row(
//             children: [
//               const Expanded(
//                 child: CardHeader(
//                   title: 'Ocorrências recentes',
//                   subtitle: 'Últimos registros próximos de você',
//                   icon: Icons.public_rounded,
//                   showBottomPadding: false,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 10, top: 12),
//                 child: Pill(
//                   text: '${incidents.length} itens',
//                   icon: Icons.format_list_bulleted_rounded,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           const ThinDivider(),
//           ListView.separated(
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: incidents.length,
//             separatorBuilder: (_, __) => const ThinDivider(indent: 14),
//             itemBuilder: (_, i) => IncidentRowItem(
//               incident: incidents[i],
//               onTap: () {
//                 ref.watch(incidentSelectedProvider.notifier).state =
//                     incidents[i];
//                 context.push(IncidentRouter.detail);
//               },
//             ),
//           ),
//           const ThinDivider(),
//         ],
//       ),
//     );
//   }
// }

// // class RegionAlertCard extends StatelessWidget {
// //   final String title;
// //   final String subtitle;
// //   final String? meta;
// //   final String? tag;
// //   final VoidCallback? onTap;
// //   final VoidCallback? onSeeDetails;

// //   const RegionAlertCard({
// //     super.key,
// //     this.title = 'Atenção na sua região',
// //     this.subtitle =
// //         'Registramos um roubo recentemente próximo de você. Fique atento(a) e redobre os cuidados.',
// //     this.meta,
// //     this.tag,
// //     this.onTap,
// //     this.onSeeDetails,
// //   });

// //   static const _ink = Color(0xFF1F2A44);
// //   static const _muted = Color(0xFF6B7AAE);
// //   static const _primary = Color(0xFF2B5BEE);
// //   static const _danger = Color(0xFFE53935);

// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //       borderRadius: BorderRadius.circular(22),
// //       onTap: onTap,
// //       child: Ink(
// //         decoration: BoxDecoration(
// //           color: const Color(0xFFFFF4F4), // 🔴 fundo leve
// //           borderRadius: BorderRadius.circular(22),
// //           border: Border.all(
// //             color: _danger.withOpacity(0.25),
// //           ),
// //           boxShadow: const [
// //             BoxShadow(
// //               color: Color(0x12000000),
// //               blurRadius: 18,
// //               offset: Offset(0, 10),
// //             ),
// //           ],
// //         ),
// //         child: Padding(
// //           padding: const EdgeInsets.all(16),
// //           child: Row(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               _AlertIcon(),
// //               const SizedBox(width: 14),
// //               Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Row(
// //                       children: [
// //                         Expanded(
// //                           child: Text(
// //                             title,
// //                             style: const TextStyle(
// //                               fontSize: 15,
// //                               fontWeight: FontWeight.w900,
// //                               color: _ink,
// //                             ),
// //                           ),
// //                         ),
// //                         if (tag != null) _TagPill(text: tag!),
// //                       ],
// //                     ),
// //                     const SizedBox(height: 6),
// //                     Text(
// //                       subtitle,
// //                       style: const TextStyle(
// //                         fontSize: 13,
// //                         fontWeight: FontWeight.w600,
// //                         color: _muted,
// //                         height: 1.3,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 12),
// //                     Row(
// //                       children: [
// //                         if (meta != null)
// //                           Row(
// //                             children: [
// //                               const Icon(Icons.near_me_outlined,
// //                                   size: 16, color: _muted),
// //                               const SizedBox(width: 6),
// //                               Text(
// //                                 meta!,
// //                                 style: const TextStyle(
// //                                   fontSize: 12.5,
// //                                   fontWeight: FontWeight.w700,
// //                                   color: _muted,
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         const Spacer(),
// //                         TextButton(
// //                           onPressed: onSeeDetails,
// //                           style: TextButton.styleFrom(
// //                             foregroundColor: _primary,
// //                             padding: const EdgeInsets.symmetric(
// //                                 horizontal: 12, vertical: 8),
// //                             shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(14),
// //                             ),
// //                           ),
// //                           child: const Text(
// //                             'Ver detalhes',
// //                             style: TextStyle(fontWeight: FontWeight.w900),
// //                           ),
// //                         ),
// //                       ],
// //                     )
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _AlertIcon extends StatelessWidget {
// //   static const _danger = Color(0xFFE53935);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: 46,
// //       height: 46,
// //       decoration: BoxDecoration(
// //         color: _danger.withOpacity(0.12),
// //         borderRadius: BorderRadius.circular(16),
// //         border: Border.all(color: _danger.withOpacity(0.25)),
// //       ),
// //       child: const Icon(
// //         Icons.warning_amber_rounded,
// //         color: _danger,
// //         size: 24,
// //       ),
// //     );
// //   }
// // }

// // class _TagPill extends StatelessWidget {
// //   final String text;
// //   const _TagPill({required this.text});

// //   static const _danger = Color(0xFFE53935);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: const EdgeInsets.only(left: 8),
// //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
// //       decoration: BoxDecoration(
// //         color: _danger,
// //         borderRadius: BorderRadius.circular(99),
// //       ),
// //       child: Text(
// //         text,
// //         style: const TextStyle(
// //           color: Colors.white,
// //           fontSize: 11,
// //           fontWeight: FontWeight.w900,
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _MetaRow extends StatelessWidget {
// //   final IconData icon;
// //   final String text;

// //   const _MetaRow({required this.icon, required this.text});

// //   static const _muted = Color(0xFF6B7AAE);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       children: [
// //         Icon(icon, size: 16, color: _muted),
// //         const SizedBox(width: 6),
// //         Text(
// //           text,
// //           style: const TextStyle(
// //             fontSize: 12.2,
// //             fontWeight: FontWeight.w700,
// //             color: _muted,
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class _Pill extends StatelessWidget {
// //   final String text;
// //   final Color bg;
// //   final Color fg;
// //   final Color border;

// //   const _Pill({
// //     required this.text,
// //     required this.bg,
// //     required this.fg,
// //     required this.border,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
// //       decoration: BoxDecoration(
// //         color: bg,
// //         borderRadius: BorderRadius.circular(99),
// //         border: Border.all(color: border),
// //       ),
// //       child: Text(
// //         text,
// //         style: TextStyle(
// //           color: fg,
// //           fontSize: 11,
// //           fontWeight: FontWeight.w900,
// //           letterSpacing: 0.2,
// //         ),
// //       ),
// //     );
// //   }
// // }
