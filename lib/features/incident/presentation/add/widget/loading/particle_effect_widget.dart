// import 'package:flutter/material.dart';

// class ParticleEffectWidget extends StatefulWidget {
//   const ParticleEffectWidget({super.key});

//   @override
//   State<ParticleEffectWidget> createState() => _ParticleEffectWidgetState();
// }

// class _ParticleEffectWidgetState extends State<ParticleEffectWidget>
//     with TickerProviderStateMixin {
//   late AnimationController _glowController;

//   @override
//   void initState() {
//     super.initState();

//     _glowController = AnimationController(
//       duration: const Duration(seconds: 3),
//       vsync: this,
//     )..repeat(reverse: true);
//   }

//   @override
//   void dispose() {
//     _glowController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _glowController,
//       builder: (context, child) {
//         return Opacity(
//           opacity: 0.1 + (_glowController.value * 0.1),
//           child: Container(
//             decoration: BoxDecoration(
//               gradient: RadialGradient(
//                 center: Alignment.center,
//                 radius: 1.5,
//                 colors: [
//                   Colors.white.withValues(alpha: 0.3),
//                   Colors.transparent,
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
