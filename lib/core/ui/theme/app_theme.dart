import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/text_button_theme.dart';
import 'package:flutter/material.dart';

import 'button_theme.dart';
import 'checkbox_theme.dart';
import 'input_decoration_theme.dart';
import 'theme_data.dart';

// final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>(
//   (ref) {
//     final notifier = ThemeNotifier();
//     // Carregar tema salvo quando o provider for inicializado
//     notifier.loadSavedTheme();
//     return notifier;
//   },
// );

// // Provider para acessar apenas o ThemeData
// final themeDataProvider = Provider<ThemeData>((ref) {
//   return ref.watch(themeProvider).themeData;
// });

// // Provider para acessar apenas o modo
// final themeModeProvider = Provider<AppThemeMode>((ref) {
//   return ref.watch(themeProvider).mode;
// });

// enum AppThemeMode {
//   light,
//   dark,
//   system,
// }

// class ThemeState {
//   final AppThemeMode mode;
//   final ThemeData themeData;

//   ThemeState({
//     required this.mode,
//     required this.themeData,
//   });

//   ThemeState copyWith({
//     AppThemeMode? mode,
//     ThemeData? themeData,
//   }) {
//     return ThemeState(
//       mode: mode ?? this.mode,
//       themeData: themeData ?? this.themeData,
//     );
//   }
// }

// class ThemeNotifier extends StateNotifier<ThemeState> {
//   ThemeNotifier() : super(_initialState());

//   static ThemeState _initialState() {
//     return ThemeState(
//       mode: AppThemeMode.light,
//       themeData: _getThemeData(AppThemeMode.dark),
//     );
//   }

//   static ThemeData _getThemeData(AppThemeMode mode) {
//     switch (mode) {
//       case AppThemeMode.light:
//         return _lightTheme();
//       case AppThemeMode.dark:
//         return _darkTheme;
//       case AppThemeMode.system:
//         return _lightTheme(); // Default
//     }
//   }

//   static ThemeData _lightTheme() {
//     final baseColorScheme = const ColorScheme.light(
//       secondaryContainer: Colors.white,
//     );

//     return ThemeData(
//       brightness: Brightness.light,
//       fontFamily: "Plus Jakarta",
//       colorScheme: baseColorScheme,
//       primarySwatch: AppColors.primaryMaterialColor,
//       primaryColor: AppColors.primaryColor,
//       scaffoldBackgroundColor: const Color(0xFFF8FAFC),
//       iconTheme: const IconThemeData(color: AppColors.blackColor),
//       textTheme: const TextTheme(
//         bodyMedium: TextStyle(color: AppColors.blackColor40),
//       ),
//       elevatedButtonTheme: elevatedButtonThemeData,
//       textButtonTheme: textButtonThemeData,
//       outlinedButtonTheme: outlinedButtonTheme(),
//       inputDecorationTheme: lightInputDecorationTheme,
//       checkboxTheme: checkboxThemeData.copyWith(
//         side: const BorderSide(color: AppColors.blackColor40),
//       ),
//       appBarTheme: appBarLightTheme,
//       scrollbarTheme: scrollbarThemeData,
//       dataTableTheme: dataTableLightThemeData,
//     );
//   }

//   static final ThemeData _darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     primaryColor: Colors.blueAccent,
//     primarySwatch: Colors.blue,
//     scaffoldBackgroundColor: const Color.fromARGB(15, 198, 6, 6),
//     appBarTheme: AppBarTheme(
//       backgroundColor: Colors.grey[900],
//       foregroundColor: Colors.white,
//     ),
//     textTheme: const TextTheme(
//       bodyLarge: TextStyle(color: Colors.white),
//       bodyMedium: TextStyle(color: Colors.white70),
//     ),
//     colorScheme: ColorScheme.fromSwatch(
//       primarySwatch: Colors.blue,
//       brightness: Brightness.dark,
//     ),
//   );

//   Future<void> setTheme(AppThemeMode newMode) async {
//     final newThemeData = _getThemeData(newMode);
//     state = state.copyWith(mode: newMode, themeData: newThemeData);

//     // Salvar preferência local
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('themeMode', newMode.index);
//   }

//   Future<void> loadSavedTheme() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedIndex = prefs.getInt('themeMode');

//     if (savedIndex != null) {
//       final savedMode = AppThemeMode.values[savedIndex];
//       final themeData = _getThemeData(savedMode);
//       state = state.copyWith(mode: savedMode, themeData: themeData);
//     }
//   }
// }

class AppTheme {
  static ThemeData lightTheme() {
    final baseColorScheme = ColorScheme.light(
      secondaryContainer: Colors.grey.shade200,
      surface: Colors.grey.shade500, // Fundo principal
      onSurface: AppColors.textColorHeader, // Texto principal
      surfaceDim: AppColors.textColorBody, //Texto secundario
      surfaceContainer: Colors.white,

      outlineVariant: Colors.grey.shade300,
      outline: Colors.grey.shade800,
    );

    return ThemeData(
      useMaterial3: true,
      appBarTheme: appBarLightTheme,
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      brightness: Brightness.light,
      fontFamily: "Plus Jakarta",
      colorScheme: baseColorScheme,
      primarySwatch: AppColors.primaryMaterialColor,
      primaryColor: AppColors.primaryColor,
      iconTheme: const IconThemeData(color: AppColors.blackColor),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppColors.blackColor40),
      ),
      elevatedButtonTheme: elevatedButtonThemeData,
      textButtonTheme: textButtonThemeData,
      outlinedButtonTheme: outlinedButtonTheme(),
      inputDecorationTheme: lightInputDecorationTheme,
      checkboxTheme: checkboxThemeData.copyWith(
        side: const BorderSide(color: AppColors.blackColor40),
      ),
      scrollbarTheme: scrollbarThemeData,
      dataTableTheme: dataTableLightThemeData,
    );
  }

  static ThemeData dark() {
    final baseColorScheme = ColorScheme.light(
      secondaryContainer: Color(0xFF1f222a),
      surface: const Color(0xFF1f222a), // Fundo principal
      onSurface: Colors.white, // Texto principal
      surfaceDim: Colors.white70, //Texto secundario
      //Fundo para componentes (cards, listas) em diferentes níveis de elevação.
      surfaceContainer: const Color(0xFF1f222a),
      // outlineVariant versão mais suave, usada em bordas
      outlineVariant: Colors.grey.shade800,
      // outline → “borda principal”
      outline: Colors.grey.shade500,
      // outline: Colors.grey.shade500,
      onPrimary: Colors.white,
      onSecondary: Colors.white,

      // primary: Color(0xFF0A84FF),
      // secondary: Color(0xFFFF9F0A),
    );

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black87,
      brightness: Brightness.light,
      fontFamily: "Plus Jakarta",
      colorScheme: baseColorScheme,
      primarySwatch: AppColors.primaryMaterialColor,
      primaryColor: AppColors.primaryColor,
      iconTheme: const IconThemeData(color: AppColors.blackColor),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppColors.blackColor40),
      ),
      elevatedButtonTheme: elevatedButtonThemeData,
      textButtonTheme: textButtonThemeData,
      outlinedButtonTheme: outlinedButtonTheme(),
      inputDecorationTheme: lightInputDecorationTheme,
      checkboxTheme: checkboxThemeData.copyWith(
        side: const BorderSide(color: AppColors.blackColor40),
      ),
      appBarTheme: appBarDarkTheme,
      scrollbarTheme: scrollbarThemeData,
      dataTableTheme: dataTableLightThemeData,
    );
  }
}
