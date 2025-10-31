import 'package:deehelp/app/app_provider.dart';
import 'package:deehelp/app/router/app_router.dart';
import 'package:deehelp/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';

class YouSafeApp extends StatelessWidget {
  const YouSafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationProvider(
      child: MaterialApp.router(
        //TODO: Remover
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: L10n.all,
        localeResolutionCallback: (locale, supportedLocales) {
          if (locale?.languageCode == 'en') {
            return const Locale('en', 'US');
          }
          return locale;
        },
        locale: const Locale("en"),
        routerConfig: AppRouter.router,
        theme: AppTheme.themeLight(),
        title: "DeeHelp",
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
