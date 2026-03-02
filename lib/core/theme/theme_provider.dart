// core/ui/theme/theme_provider.dart
import 'package:deehelp/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeModeType {
  light,
  dark,
  system,
}

class ThemeState {
  final ThemeModeType mode;
  final ThemeData themeData;
  final bool isDarkMode;

  ThemeState({
    required this.mode,
    required this.themeData,
    required this.isDarkMode,
  });

  ThemeState copyWith({
    ThemeModeType? mode,
    ThemeData? themeData,
    bool? isDarkMode,
  }) {
    return ThemeState(
      mode: mode ?? this.mode,
      themeData: themeData ?? this.themeData,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}

class ThemeNotifier extends StateNotifier<ThemeState> {
  ThemeNotifier()
      : super(
          ThemeState(
            mode: ThemeModeType.system,
            themeData: AppTheme.lightTheme(),
            isDarkMode: false,
          ),
        );

  // Obter tema baseado no modo
  ThemeData _getThemeData(ThemeModeType mode) {
    switch (mode) {
      case ThemeModeType.dark:
        return AppTheme.dark();
      case ThemeModeType.system:
      default:
        return AppTheme.lightTheme();
    }
  }

  // Alterar tema
  Future<void> setTheme(ThemeModeType newMode) async {
    final isDark = newMode == ThemeModeType.dark;
    final newThemeData = _getThemeData(newMode);

    state = state.copyWith(
      mode: newMode,
      themeData: newThemeData,
      isDarkMode: isDark,
    );

    // Salvar preferência
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', newMode.index);
  }

  // Alternar entre light/dark
  Future<void> toggleTheme() async {
    final newMode = state.mode == ThemeModeType.dark
        ? ThemeModeType.light
        : ThemeModeType.dark;
    await setTheme(newMode);
  }

  // Carregar tema salvo
  Future<void> loadSavedTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedIndex = prefs.getInt('themeMode');

      if (savedIndex != null &&
          savedIndex >= 0 &&
          savedIndex < ThemeModeType.values.length) {
        final savedMode = ThemeModeType.values[savedIndex];
        await setTheme(savedMode);
      }
    } catch (e) {
      // Em caso de erro, mantém o tema padrão
      print('Erro ao carregar tema: $e');
    }
  }
}

// Provider principal
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  return ThemeNotifier();
});

// Provider para ThemeData
final themeDataProvider = Provider<ThemeData>((ref) {
  return ref.watch(themeProvider).themeData;
});

// Provider para verificar se está dark mode
final isDarkModeProvider = Provider<bool>((ref) {
  return ref.watch(themeProvider).isDarkMode;
});
