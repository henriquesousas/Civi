// import 'dart:async';

// import 'package:deehelp/core/extensions/screen_size_extension.dart';
// import 'package:deehelp/core/ui/theme/app_text_styles.dart';
// import 'package:deehelp/core/ui/theme/dimens.dart';
// import 'package:deehelp/features/incident/presentation/add/widget/loading/incident_loading_message.dart';
// import 'package:deehelp/features/incident/presentation/providers/incident_viewmodel_providers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class IncidentLoadingProgressWidget extends ConsumerStatefulWidget {
//   const IncidentLoadingProgressWidget({super.key});

//   @override
//   ConsumerState<IncidentLoadingProgressWidget> createState() =>
//       _IncidentLoadingProgressWidgetState();
// }

// class _IncidentLoadingProgressWidgetState
//     extends ConsumerState<IncidentLoadingProgressWidget> {
//   double _progress = 0.0;
//   int _dotsCount = 0;
//   int _currentMessageIndex = 0;
//   late Timer _timer;
//   final List<String> _loadingMessages = [
//     "Analisando dados do incidente",
//     "Verificando localização",
//     "Gerando protocolo de segurança",
//     "Preparando alerta comunitário",
//     "Finalizando registro"
//   ];

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _startLoading();
//   // }

//   @override
//   void initState() {
//     super.initState();
//     // Inicia apenas a animação visual aqui
//     _startVisualAnimation();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     // Inicia o progresso real após ter acesso ao ref
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _startRealProgress();
//     });
//   }

//   void _startVisualAnimation() {
//     // Timer para os pontos animados
//     Timer.periodic(const Duration(milliseconds: 300), (timer) {
//       if (mounted) {
//         setState(() {
//           _dotsCount = (_dotsCount + 1) % 4;
//         });
//       }
//     });

//     // Timer para mudar as mensagens
//     Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (mounted && _currentMessageIndex < _loadingMessages.length - 1) {
//         setState(() {
//           _currentMessageIndex++;
//         });
//       }
//     });
//   }

//   void _startRealProgress() {
//     const totalDuration = 5;
//     const interval = 50;
//     const increments = totalDuration * 1000 / interval;
//     const incrementValue = 1.0 / increments;

//     // final viewModel = ref.read(addIncidentViewmodelProvider.notifier);

//     _timer = Timer.periodic(const Duration(milliseconds: interval), (timer) {
//       if (mounted) {
//         setState(() {
//           // if (currentProgress == "99") {
//           //   viewModel.setProgressDone();
//           //   _progress = 1.0;
//           //   timer.cancel();
//           //   return;
//           // }

//           _progress += incrementValue;
//           final currentProgress = (_progress * 100).toStringAsFixed(0);
//           debugPrint("Progress ${_progress}");
//           debugPrint("Current Progress ${currentProgress}");
//           if (currentProgress == "100") {
//             // _progress = 1.0;
//             timer.cancel();
//             // debugPrint("Finalizou timer!");
//           }
//           // if (_progress >= 1.0) {
//           //   _progress = 1.0;
//           //   timer.cancel();
//           // }
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   String _getDots() {
//     return '.' * _dotsCount;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         IncidentLoadingMessage(
//           dots: _getDots(),
//           message: _loadingMessages[_currentMessageIndex],
//         ),
//         const SizedBox(height: Dimens.size40),
//         // Text(
//         //   "${(_progress * 100).toStringAsFixed(0)}%",
//         //   style: TextStyle(
//         //     fontSize: 32,
//         //     fontWeight: FontWeight.w700,
//         //     color: Colors.white,
//         //     shadows: [
//         //       Shadow(
//         //         blurRadius: 6,
//         //         color: Colors.black.withValues(alpha: 0.4),
//         //       ),
//         //     ],
//         //   ),
//         // ),
//         const SizedBox(height: Dimens.size16),
//         Container(
//           height: Dimens.size16,
//           // width: context.screenWidth * 0.8,
//           decoration: BoxDecoration(
//             color: Colors.white.withValues(alpha: 0.2),
//             borderRadius: BorderRadius.circular(8),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withValues(alpha: 0.2),
//                 blurRadius: 8,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Stack(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.white.withValues(alpha: 0.1),
//                 ),
//               ),

//               // Progresso
//               AnimatedContainer(
//                 duration: const Duration(milliseconds: 200),
//                 width: context.screenWidth * 0.8 * _progress,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   gradient: LinearGradient(
//                     colors: [
//                       Colors.white,
//                       Colors.blue[100]!,
//                     ],
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.white.withValues(alpha: 0.8),
//                       blurRadius: 10,
//                       spreadRadius: 2,
//                     ),
//                   ],
//                 ),
//               ),

//               // Efeito de brilho no progresso
//               // if (_progress > 0)
//               //   Positioned(
//               //     right: 0,
//               //     top: 0,
//               //     bottom: 0,
//               //     child: Container(
//               //       width: Dimens.size20.w,
//               //       decoration: BoxDecoration(
//               //         borderRadius: const BorderRadius.only(
//               //           topRight: Radius.circular(8),
//               //           bottomRight: Radius.circular(8),
//               //         ),
//               //         gradient: LinearGradient(
//               //           colors: [
//               //             Colors.white.withValues(alpha: 0.8),
//               //             Colors.transparent,
//               //           ],
//               //           begin: Alignment.centerLeft,
//               //           end: Alignment.centerRight,
//               //         ),
//               //       ),
//               //     ),
//               //   ),
//             ],
//           ),
//         ),
//         // const SizedBox(height: Dimens.size16),
//         // Text(
//         //   _progress < 0.98
//         //       ? "Processando seu registro${_getDots()}"
//         //       : "✓ Registro concluído com sucesso!",
//         //   style: context.appTextStyles.sectionTitle3.copyWith(
//         //     color: Colors.white.withValues(alpha: 0.9),
//         //     fontWeight: FontWeight.w500,
//         //   ),
//         // ),
//       ],
//     );
//   }
// }
