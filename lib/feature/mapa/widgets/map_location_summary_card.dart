import 'dart:ui';

import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:flutter/material.dart';

class ExpandableIncidentCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onViewIncidents;
  final VoidCallback? onRegisterIncident;
  final VoidCallback? onCardTap;
  final Function(bool) onExpand;
  final bool startOpened;

  const ExpandableIncidentCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.onViewIncidents,
    this.onRegisterIncident,
    this.onCardTap,
    this.startOpened = false,
    required this.onExpand,
  });

  @override
  State<ExpandableIncidentCard> createState() => _ExpandableIncidentCardState();
}

class _ExpandableIncidentCardState extends State<ExpandableIncidentCard>
    with TickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  void initState() {
    _isExpanded = widget.startOpened;
    super.initState();
  }

  void _toggleCard() {
    setState(() {
      _isExpanded = !_isExpanded;
    });

    widget.onExpand.call(_isExpanded);
    widget.onCardTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    const radiusValue = 2.0;
    final radius = BorderRadius.circular(radiusValue);

    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: radius,
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.withValues(alpha: 0.3),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.10),
                  blurRadius: 28,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: InkWell(
              onTap: _toggleCard,
              borderRadius: radius,
              splashColor: Colors.black.withValues(alpha: 0.03),
              highlightColor: Colors.black.withValues(alpha: 0.015),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 280),
                  curve: Curves.easeInOutCubic,
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 3,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HighlightIcon(
                            icon: Icon(
                              Icons.location_city_rounded,
                              color: context.primaryColor,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: context.appTextOld.headerlg.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF111827),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  widget.subtitle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.appTextOld.caption.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF6B7280),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8FAFC),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFFE5E7EB),
                              ),
                            ),
                            child: AnimatedRotation(
                              turns: _isExpanded ? 0.5 : 0.0,
                              duration: const Duration(milliseconds: 260),
                              child: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 22,
                                color: Color(0xFF374151),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (_isExpanded) ...[
                        const SizedBox(height: 14),
                        Container(
                          height: 1,
                          color: const Color(0xFFE5E7EB),
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 46,
                                child: ButtonOutline(
                                  press: widget.onViewIncidents ?? () {},
                                  text: "Ver incidentes",
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: SizedBox(
                                height: 46,
                                child: ButtonPrimary(
                                  press: widget.onRegisterIncident ?? () {},
                                  text: "Novo alerta",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// import 'package:deehelp/core/extension/size_extension.dart';
// import 'package:deehelp/core/theme/export_theme.dart';
// import 'package:deehelp/core/ui/styles/app_text_style.dart';
// import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
// import 'package:flutter/material.dart';

// class MapLocationSummaryCard extends StatelessWidget {
//   final String title;
//   final String alertsText;
//   final VoidCallback? onEditTap;

//   const MapLocationSummaryCard({
//     super.key,
//     required this.title,
//     required this.alertsText,
//     this.onEditTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: context.isLandscape
//           ? context.percentHeight(0.3)
//           : context.percentHeight(0.1),
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         border: Border.all(
//           color: const Color(0xFFE5E7EB),
//         ),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x14000000),
//             blurRadius: 16,
//             offset: Offset(0, 6),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           // const Text(
//           //   '🏠',
//           //   style: TextStyle(fontSize: 18),
//           // ),
//           const Text(
//             '🔥',
//             style: TextStyle(fontSize: 18),
//           ),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: context.appText.headermd.copyWith(
//                     height: 1.0,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   alertsText,
//                   style: context.appText.caption.copyWith(
//                     fontWeight: FontWeight.w400,
//                     color: const Color(0xFF6B7280),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 10),
//           // GestureDetector(
//           //   onTap: onEditTap,
//           //   child: Container(
//           //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           //     decoration: BoxDecoration(
//           //       color: const Color(0xFFF3F4F6),
//           //       borderRadius: BorderRadius.circular(12),
//           //       border: Border.all(
//           //         color: const Color(0xFFE5E7EB),
//           //       ),
//           //     ),
//           //     child: Text(
//           //       'Ver incidentes',
//           //       style: context.appText.caption.copyWith(
//           //         color: const Color(0xFF374151),
//           //         fontWeight: FontWeight.w600,
//           //       ),
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

// class ExpandableIncidentCard extends StatefulWidget {
//   final String title;
//   final String subtitle;
//   final VoidCallback? onViewIncidents;
//   final VoidCallback? onRegisterIncident;
//   final VoidCallback? onCardTap;
//   final Function(bool) onExpand;
//   final bool startOpened;

//   const ExpandableIncidentCard({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     this.onViewIncidents,
//     this.onRegisterIncident,
//     this.onCardTap,
//     this.startOpened = false,
//     required this.onExpand,
//   });

//   @override
//   State<ExpandableIncidentCard> createState() => _ExpandableIncidentCardState();
// }

// class _ExpandableIncidentCardState extends State<ExpandableIncidentCard>
//     with TickerProviderStateMixin {
//   bool _isExpanded = false;

//   @override
//   void initState() {
//     _isExpanded = widget.startOpened;
//     super.initState();
//   }

//   void _toggleCard() {
//     setState(() {
//       _isExpanded = !_isExpanded;
//     });

//     // widget.onCardTap?.call();
//     widget.onExpand.call(_isExpanded);
//   }

//   @override
//   Widget build(BuildContext context) {
//     const radius = 20.0;

//     return Material(
//       color: Colors.transparent,
//       borderRadius: BorderRadius.circular(radius),
//       child: Ink(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(radius),
//           border: Border.all(
//             color: Colors.black.withValues(alpha: 0.05),
//           ),
//           // boxShadow: [
//           //   BoxShadow(
//           //     color: Colors.black.withValues(alpha: 0.08),
//           //     blurRadius: 18,
//           //     offset: const Offset(0, 6),
//           //   ),
//           // ],
//         ),
//         child: InkWell(
//           onTap: _toggleCard,
//           // borderRadius: BorderRadius.circular(radius),
//           // splashColor: Colors.black.withValues(alpha: 0.05),
//           // highlightColor: Colors.black.withValues(alpha: 0.02),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: AnimatedSize(
//               duration: const Duration(milliseconds: 260),
//               curve: Curves.easeInOut,
//               alignment: Alignment.topCenter,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // const Text(
//                       //   '🔥',
//                       //   style: TextStyle(fontSize: 22),
//                       // ),
//                       const Text(
//                         '🏠',
//                         style: TextStyle(fontSize: 22),
//                       ),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Osasco - SP",
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 1,
//                               style: context.appText.headerlg,
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               widget.subtitle,
//                               style: context.appText.caption.copyWith(
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       AnimatedRotation(
//                         turns: _isExpanded ? 0.5 : 0.0,
//                         duration: const Duration(milliseconds: 260),
//                         child: Icon(
//                           Icons.keyboard_arrow_up,
//                           size: IconSizes.md,
//                           color: Colors.black.withValues(alpha: 0.75),
//                         ),
//                       ),
//                     ],
//                   ),
//                   if (_isExpanded) ...[
//                     const SizedBox(height: 14),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: ButtonOutline(
//                               press: () {}, text: "Ver incidentes"),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: ButtonPrimary(
//                             press: () {},
//                             text: "Novo Alerta",
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

