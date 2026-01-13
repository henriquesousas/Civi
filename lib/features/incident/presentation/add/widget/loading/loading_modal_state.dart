// // lib/core/ui/providers/loading_modal_provider.dart
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class LoadingModalState {
//   final bool isVisible;
//   final String title;
//   final String? subtitle;

//   const LoadingModalState({
//     this.isVisible = false,
//     this.title = 'Salvando incidente',
//     this.subtitle,
//   });

//   LoadingModalState copyWith({
//     bool? isVisible,
//     String? title,
//     String? subtitle,
//   }) {
//     return LoadingModalState(
//       isVisible: isVisible ?? this.isVisible,
//       title: title ?? this.title,
//       subtitle: subtitle ?? this.subtitle,
//     );
//   }
// }

// class LoadingModalNotifier extends StateNotifier<LoadingModalState> {
//   LoadingModalNotifier() : super(const LoadingModalState());

//   void show({
//     String title = 'Salvando incidente',
//     String? subtitle = 'Por favor, aguarde um momento...',
//   }) {
//     state = state.copyWith(
//       isVisible: true,
//       title: title,
//       subtitle: subtitle,
//     );
//   }

//   void hide() {
//     state = state.copyWith(isVisible: false);
//   }

//   void updateMessage({
//     String? title,
//     String? subtitle,
//   }) {
//     if (state.isVisible) {
//       state = state.copyWith(
//         title: title ?? state.title,
//         subtitle: subtitle ?? state.subtitle,
//       );
//     }
//   }
// }

// final loadingModalProvider =
//     StateNotifierProvider<LoadingModalNotifier, LoadingModalState>(
//   (ref) => LoadingModalNotifier(),
// );
