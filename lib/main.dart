import 'package:cloudflare_r2/cloudflare_r2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/env.dart';
import 'core/router/main_router.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';
import 'l10n/l10n.dart';
import 'main_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CloudFlareR2.init(
    accountId: Env.r2AccountId,
    accessKeyId: Env.r2AccessKeyId,
    secretAccessKey: Env.r2SecretAccessKeyId,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationProvider(
      child: MaterialApp.router(
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
        theme: AppTheme.lightTheme(context),
        themeMode: ThemeMode.light,
        title: "DeeHelp",
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
