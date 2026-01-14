// // lib/core/ui/widgets/loading_modal.dart
// import 'package:deehelp/core/ui/theme/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class LoadingModal extends ConsumerWidget {
//   final String title;
//   final String? subtitle;
//   final Color backgroundColor;
//   final Color loadingColor;

//   const LoadingModal({
//     super.key,
//     required this.title,
//     this.subtitle,
//     this.backgroundColor = AppColors.warningColor,
//     this.loadingColor = Colors.white,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       insetPadding: EdgeInsets.all(20),
//       child: Container(
//         padding: EdgeInsets.all(24),
//         decoration: BoxDecoration(
//           color: backgroundColor,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.3),
//               blurRadius: 20,
//               spreadRadius: 2,
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Ícone de loading animado
//             _buildLoadingIndicator(),

//             SizedBox(height: 24),

//             // Título
//             Text(
//               title,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.center,
//             ),

//             // Subtítulo (opcional)
//             if (subtitle != null) ...[
//               SizedBox(height: 12),
//               Text(
//                 subtitle!,
//                 style: TextStyle(
//                   color: Colors.white.withOpacity(0.9),
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],

//             SizedBox(height: 8),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildLoadingIndicator() {
//     return Container(
//       width: 60,
//       height: 60,
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.1),
//         shape: BoxShape.circle,
//       ),
//       child: Center(
//         child: SizedBox(
//           width: 30,
//           height: 30,
//           child: CircularProgressIndicator(
//             strokeWidth: 3,
//             valueColor: AlwaysStoppedAnimation<Color>(loadingColor),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Versão com animação mais elaborada
// class AnimatedLoadingModal extends StatefulWidget {
//   final String title;
//   final String? subtitle;
//   final Color backgroundColor;
//   final Color loadingColor;

//   const AnimatedLoadingModal({
//     super.key,
//     required this.title,
//     this.subtitle,
//     this.backgroundColor = AppColors.primaryColor,
//     this.loadingColor = Colors.white,
//   });

//   @override
//   State<AnimatedLoadingModal> createState() => _AnimatedLoadingModalState();
// }

// class _AnimatedLoadingModalState extends State<AnimatedLoadingModal>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );

//     _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
//     );

//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeIn),
//     );

//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaleTransition(
//       scale: _scaleAnimation,
//       child: FadeTransition(
//         opacity: _fadeAnimation,
//         child: LoadingModal(
//           title: widget.title,
//           subtitle: widget.subtitle,
//           backgroundColor: widget.backgroundColor,
//           loadingColor: widget.loadingColor,
//         ),
//       ),
//     );
//   }
// }
