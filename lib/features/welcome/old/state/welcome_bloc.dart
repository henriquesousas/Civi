import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deehelp/features/welcome/old/state/welcome_events.dart';
import 'package:deehelp/features/welcome/old/state/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvents, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<PageChangedEvent>((event, emit) {
      emit(WelcomeState(page: event.newPage));
    });
  }
}
