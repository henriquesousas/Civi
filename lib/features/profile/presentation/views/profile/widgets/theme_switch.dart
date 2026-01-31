// widgets/theme_switch.dart
import 'package:deehelp/core/ui/theme/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSwitch extends ConsumerWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);

    return Switch.adaptive(
      value: themeState.mode == ThemeModeType.dark,
      onChanged: (value) {
        ref.read(themeProvider.notifier).toggleTheme();
      },
      activeColor: Theme.of(context).colorScheme.primary,
    );
  }
}

// Ou com ícone no AppBar
// class ThemeToggleButton extends ConsumerWidget {
//   const ThemeToggleButton({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final themeState = ref.watch(themeProvider);

//     return IconButton(
//       icon: Icon(
//         themeState.mode == ThemeModeType.dark
//             ? Icons.dark_mode
//             : Icons.light_mode,
//       ),
//       onPressed: () {
//         ref.read(themeProvider.notifier).toggleTheme();
//       },
//       tooltip: themeState.mode == ThemeModeType.dark
//           ? 'Mudar para Light Mode'
//           : 'Mudar para Dark Mode',
//     );
//   }
// }
