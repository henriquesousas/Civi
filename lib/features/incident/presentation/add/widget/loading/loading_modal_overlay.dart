// // lib/core/ui/widgets/loading_modal_overlay.dart
// import 'package:deehelp/features/incident/presentation/add/loading_modal_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'loading_modal.dart';

// class LoadingModalOverlay extends ConsumerWidget {
//   final Widget child;

//   const LoadingModalOverlay({super.key, required this.child});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final modalState = ref.watch(loadingModalProvider);

//     return Stack(
//       children: [
//         // Conteúdo principal
//         child,

//         // Overlay escuro
//         if (modalState.isVisible)
//           Container(
//             color: Colors.black.withOpacity(0.6),
//           ),

//         // Modal de loading
//         if (modalState.isVisible)
//           Positioned.fill(
//             child: GestureDetector(
//               onTap: () {
//                 // Impede fechar ao tocar fora (opcional)
//                 // ref.read(loadingModalProvider.notifier).hide();
//               },
//               behavior: HitTestBehavior.opaque,
//               child: Center(
//                 child: AnimatedLoadingModal(
//                   title: modalState.title,
//                   subtitle: modalState.subtitle,
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
