import 'package:deehelp/core/router/main_router.dart';
import 'package:deehelp/core/theme/app_theme.dart';
import 'package:deehelp/main_provider.dart';
import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';
import 'l10n/l10n.dart';

class DeeHelp extends StatelessWidget {
  const DeeHelp({super.key});

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
        routerConfig: MainRouter.router,
        // theme: AppTheme.themeLight(),
        theme: AppTheme.lightTheme(context),
        themeMode: ThemeMode.light,
        title: "DeeHelp",
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

/*
*
* FlutterSwitch(
            width: SizeConfig.width42,
            height: SizeConfig.height20,
            inactiveColor: AppColorsV2.modeInactiveColor,
            toggleSize: SizeConfig.width16,
            padding: SizeConfig.padding02,
            activeColor: Theme.of(context).colorScheme.primary,
            borderRadius: 40,
            value: false,
            onToggle: (value) {},
          ),*/
