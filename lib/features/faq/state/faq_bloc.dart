import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yousafe/features/faq/state/faq_event.dart';
import 'package:yousafe/features/faq/state/faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  FaqBloc() : super(FaqState()) {
    on<FaqChangedEvent>((event, emit) {
      final updatedIndexes = Set<int>.from(state.expandedIndexes);

      if (event.isExpanded) {
        updatedIndexes.add(event.index);
      } else {
        updatedIndexes.remove(event.index);
      }

      emit(state.copyWith(expandedIndexes: updatedIndexes));
    });
  }
}
