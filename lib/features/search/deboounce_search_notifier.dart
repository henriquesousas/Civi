import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class DebouncedSearchNotifier extends StateNotifier<String> {
  Timer? _debounceTimer;
  final Duration _debounceDuration;

  DebouncedSearchNotifier({Duration? debounceDuration})
      : _debounceDuration =
            debounceDuration ?? const Duration(milliseconds: 500),
        super('');

  void updateQuery(String query) {
    // Cancela timer anterior
    _debounceTimer?.cancel();

    // Se vazio, atualiza imediatamente
    if (query.isEmpty) {
      state = '';
      return;
    }

    // Cria novo timer com debounce
    _debounceTimer = Timer(_debounceDuration, () {
      state = query;
    });
  }

  void clear() {
    _debounceTimer?.cancel();
    state = '';
  }

  // Método para forçar atualização imediata (sem debounce)
  void updateImmediately(String query) {
    _debounceTimer?.cancel();
    state = query;
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}
