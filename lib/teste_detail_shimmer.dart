// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';

// class TesteDetailShimmerPage extends StatelessWidget {
//   const TesteDetailShimmerPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF0B0B0F),
//       body: Stack(
//         children: [
//           Shimmer.fromColors(
//             baseColor: const Color(0xFF15161D),
//             highlightColor: const Color(0xFF22242C),
//             child: CustomScrollView(
//               physics: const NeverScrollableScrollPhysics(),
//               slivers: [
//                 const SliverToBoxAdapter(
//                   child: _ShimmerPhotosCard(),
//                 ),
//                 SliverToBoxAdapter(
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 18, 20, 120),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         /// pills
//                         const Wrap(
//                           spacing: 8,
//                           runSpacing: 8,
//                           children: [
//                             _ShimmerPill(width: 84),
//                             _ShimmerPill(width: 74),
//                             _ShimmerPill(width: 82),
//                           ],
//                         ),

//                         const SizedBox(height: 18),

//                         /// título
//                         const _ShimmerBox(
//                           width: 190,
//                           height: 30,
//                           radius: 12,
//                         ),

//                         const SizedBox(height: 10),

//                         const _ShimmerBox(
//                           width: 280,
//                           height: 18,
//                           radius: 10,
//                         ),

//                         const SizedBox(height: 24),

//                         const _ShimmerInfoTile(),

//                         const SizedBox(height: 22),
//                         const Divider(color: Color(0xFF1E1F26), height: 1),
//                         const SizedBox(height: 22),

//                         const _ShimmerInfoTile(hasTrailing: true),

//                         const SizedBox(height: 18),

//                         const _ShimmerRelatedItemCard(),

//                         const SizedBox(height: 24),

//                         const _ShimmerBox(
//                           width: 110,
//                           height: 24,
//                           radius: 10,
//                         ),

//                         const SizedBox(height: 14),

//                         const _ShimmerParagraph(lines: [
//                           1.0,
//                           0.96,
//                           0.88,
//                           0.72,
//                         ]),

//                         const SizedBox(height: 24),

//                         const Row(
//                           children: [
//                             Expanded(
//                               child: _ShimmerMetricCard(),
//                             ),
//                             SizedBox(width: 12),
//                             Expanded(
//                               child: _ShimmerMetricCard(),
//                             ),
//                           ],
//                         ),

//                         const SizedBox(height: 12),

//                         const Row(
//                           children: [
//                             Expanded(
//                               child: _ShimmerMetricCard(),
//                             ),
//                             SizedBox(width: 12),
//                             Expanded(
//                               child: _ShimmerMetricCard(),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           /// bottom action shimmer
//           Positioned(
//             left: 16,
//             right: 16,
//             bottom: 18,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(26),
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF121319).withValues(alpha: 0.92),
//                     borderRadius: BorderRadius.circular(26),
//                     border: Border.all(
//                       color: Colors.white.withValues(alpha: 0.06),
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withValues(alpha: 0.24),
//                         blurRadius: 20,
//                         offset: const Offset(0, 8),
//                       ),
//                     ],
//                   ),
//                   child: Shimmer.fromColors(
//                     baseColor: const Color(0xFF15161D),
//                     highlightColor: const Color(0xFF22242C),
//                     child: const Row(
//                       children: [
//                         Expanded(
//                           child: _ShimmerBox(
//                             width: double.infinity,
//                             height: 20,
//                             radius: 10,
//                           ),
//                         ),
//                         SizedBox(width: 16),
//                         _ShimmerBox(
//                           width: 142,
//                           height: 52,
//                           radius: 18,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ShimmerPhotosCard extends StatelessWidget {
//   const _ShimmerPhotosCard();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
//       clipBehavior: Clip.antiAlias,
//       decoration: BoxDecoration(
//         color: const Color(0xFF121319),
//         borderRadius: BorderRadius.circular(28),
//         border: Border.all(
//           color: Colors.white.withValues(alpha: 0.05),
//         ),
//       ),
//       child: Stack(
//         children: [
//           const Positioned.fill(
//             child: _ShimmerBox(
//               width: double.infinity,
//               height: double.infinity,
//               radius: 0,
//             ),
//           ),
//           Positioned.fill(
//             child: IgnorePointer(
//               child: DecoratedBox(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Colors.black.withValues(alpha: 0.28),
//                       Colors.transparent,
//                       Colors.transparent,
//                       Colors.black.withValues(alpha: 0.50),
//                     ],
//                     stops: const [0.0, 0.18, 0.56, 1.0],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 14,
//             left: 14,
//             right: 14,
//             child: Row(
//               children: const [
//                 _ShimmerCircleButton(),
//                 Spacer(),
//                 _ShimmerCircleButton(),
//                 SizedBox(width: 10),
//                 _ShimmerCircleButton(),
//               ],
//             ),
//           ),
//           Positioned(
//             top: 68,
//             right: 14,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//               decoration: BoxDecoration(
//                 color: Colors.black.withValues(alpha: 0.25),
//                 borderRadius: BorderRadius.circular(999),
//                 border: Border.all(
//                   color: Colors.white.withValues(alpha: 0.05),
//                 ),
//               ),
//               child: const _ShimmerBox(
//                 width: 28,
//                 height: 12,
//                 radius: 999,
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 16,
//             left: 0,
//             right: 0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 _ShimmerDot(width: 22),
//                 SizedBox(width: 8),
//                 _ShimmerDot(width: 8),
//                 SizedBox(width: 8),
//                 _ShimmerDot(width: 8),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ShimmerCircleButton extends StatelessWidget {
//   const _ShimmerCircleButton();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 42,
//       height: 42,
//       decoration: BoxDecoration(
//         color: const Color(0xFF1B1D25),
//         shape: BoxShape.circle,
//         border: Border.all(
//           color: Colors.white.withValues(alpha: 0.05),
//         ),
//       ),
//     );
//   }
// }

// class _ShimmerDot extends StatelessWidget {
//   final double width;

//   const _ShimmerDot({required this.width});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: 8,
//       decoration: BoxDecoration(
//         color: const Color(0xFF22242C),
//         borderRadius: BorderRadius.circular(999),
//       ),
//     );
//   }
// }

// class _ShimmerPill extends StatelessWidget {
//   final double width;

//   const _ShimmerPill({required this.width});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
//       decoration: BoxDecoration(
//         color: const Color(0xFF13141A),
//         borderRadius: BorderRadius.circular(999),
//         border: Border.all(
//           color: Colors.white.withValues(alpha: 0.04),
//         ),
//       ),
//       child: _ShimmerBox(
//         width: width,
//         height: 14,
//         radius: 999,
//       ),
//     );
//   }
// }

// class _ShimmerInfoTile extends StatelessWidget {
//   final bool hasTrailing;

//   const _ShimmerInfoTile({this.hasTrailing = false});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: 42,
//           height: 42,
//           decoration: BoxDecoration(
//             color: const Color(0xFF15161D),
//             borderRadius: BorderRadius.circular(14),
//           ),
//         ),
//         const SizedBox(width: 14),
//         const Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _ShimmerBox(
//                 width: 78,
//                 height: 12,
//                 radius: 8,
//               ),
//               SizedBox(height: 8),
//               _ShimmerBox(
//                 width: double.infinity,
//                 height: 18,
//                 radius: 10,
//               ),
//               SizedBox(height: 8),
//               _ShimmerBox(
//                 width: 220,
//                 height: 18,
//                 radius: 10,
//               ),
//             ],
//           ),
//         ),
//         if (hasTrailing) ...[
//           const SizedBox(width: 12),
//           Container(
//             width: 22,
//             height: 22,
//             decoration: BoxDecoration(
//               color: const Color(0xFF1B1D25),
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//         ],
//       ],
//     );
//   }
// }

// class _ShimmerRelatedItemCard extends StatelessWidget {
//   const _ShimmerRelatedItemCard();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: const Color(0xFF13141A),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: Colors.white.withValues(alpha: 0.05),
//         ),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 58,
//             height: 58,
//             decoration: BoxDecoration(
//               color: const Color(0xFF1C1D24),
//               borderRadius: BorderRadius.circular(16),
//             ),
//           ),
//           const SizedBox(width: 14),
//           const Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _ShimmerBox(
//                   width: 100,
//                   height: 12,
//                   radius: 8,
//                 ),
//                 SizedBox(height: 8),
//                 _ShimmerBox(
//                   width: 160,
//                   height: 18,
//                   radius: 10,
//                 ),
//                 SizedBox(height: 8),
//                 _ShimmerBox(
//                   width: double.infinity,
//                   height: 16,
//                   radius: 10,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ShimmerMetricCard extends StatelessWidget {
//   const _ShimmerMetricCard();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: const Color(0xFF13141A),
//         borderRadius: BorderRadius.circular(18),
//         border: Border.all(
//           color: Colors.white.withValues(alpha: 0.05),
//         ),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 42,
//             height: 42,
//             decoration: BoxDecoration(
//               color: const Color(0xFF1C1D24),
//               borderRadius: BorderRadius.circular(14),
//             ),
//           ),
//           const SizedBox(width: 12),
//           const Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _ShimmerBox(
//                   width: 66,
//                   height: 12,
//                   radius: 8,
//                 ),
//                 SizedBox(height: 8),
//                 _ShimmerBox(
//                   width: 90,
//                   height: 16,
//                   radius: 10,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ShimmerParagraph extends StatelessWidget {
//   final List<double> lines;

//   const _ShimmerParagraph({required this.lines});

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (_, constraints) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: lines
//               .map(
//                 (factor) => Padding(
//                   padding: const EdgeInsets.only(bottom: 10),
//                   child: _ShimmerBox(
//                     width: constraints.maxWidth * factor,
//                     height: 16,
//                     radius: 10,
//                   ),
//                 ),
//               )
//               .toList(),
//         );
//       },
//     );
//   }
// }

// class _ShimmerBox extends StatelessWidget {
//   final double width;
//   final double height;
//   final double radius;

//   const _ShimmerBox({
//     required this.width,
//     required this.height,
//     this.radius = 12,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width == double.infinity ? null : width,
//       height: height == double.infinity ? null : height,
//       decoration: BoxDecoration(
//         color: const Color(0xFF22242C),
//         borderRadius: BorderRadius.circular(radius),
//       ),
//     );
//   }
// }
