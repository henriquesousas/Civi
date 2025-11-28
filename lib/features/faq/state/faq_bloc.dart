import 'package:flutter_bloc/flutter_bloc.dart';

import 'faq_event.dart';
import 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  int selectedIndex = 0;
  FaqBloc() : super(const FaqState()) {
    on<FaqChangedEvent>((event, emit) {
      final updatedIndexes = Set<int>.from(state.expandedIndexes);
      if (selectedIndex == event.index) {
        selectedIndex = -1;
        return;
      }
      selectedIndex = event.index;

      emit(state.copyWith(
          expandedIndexes: updatedIndexes, index: selectedIndex));
    });
  }
}
