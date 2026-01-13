// import 'package:deehelp/core/ui/theme/dimens.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class IncidentLoadingTopImage extends StatefulWidget {
//   const IncidentLoadingTopImage({super.key});

//   @override
//   State<IncidentLoadingTopImage> createState() =>
//       _IncidentLoadingTopImageState();
// }

// class _IncidentLoadingTopImageState extends State<IncidentLoadingTopImage>
//     with TickerProviderStateMixin {
//   late AnimationController _pulseController;

//   @override
//   void initState() {
//     super.initState();
//     _pulseController = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..repeat(reverse: true);
//   }

//   @override
//   void dispose() {
//     _pulseController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _pulseController,
//       builder: (context, child) {
//         return Stack(
//           alignment: Alignment.center,
//           children: [
//             // Efeito de onda externa
//             Container(
//               width: Dimens.size160.w + (_pulseController.value * 40),
//               height: Dimens.size160.h + (_pulseController.value * 40),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white.withValues(alpha: 0.05),
//               ),
//             ),

//             // Efeito de onda interna
//             Container(
//               width: Dimens.size140.w + (_pulseController.value * 30),
//               height: Dimens.size140.h + (_pulseController.value * 30),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white.withValues(alpha: 0.1),
//               ),
//             ),

//             // Ícone principal
//             Container(
//               width: Dimens.size120.w,
//               height: Dimens.size120.h,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.white.withValues(alpha: 0.5),
//                     blurRadius: 20,
//                     spreadRadius: 5,
//                   ),
//                   BoxShadow(
//                     color: Colors.blue[700]!.withValues(alpha: 0.5),
//                     blurRadius: 30,
//                     spreadRadius: 10,
//                   ),
//                 ],
//               ),
//               child: Center(
//                 child: Icon(
//                   Icons.security,
//                   size: Dimens.size64.w,
//                   color: Colors.blue[900],
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
