import 'package:cloudflare_r2/cloudflare_r2.dart';
import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/env.dart';
import 'core/res/resources.dart';
import 'core/router/router.dart';
import 'core/ui/theme/app_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('pt_BR', null);

  await Supabase.initialize(
    url: "https://qyqwuyrigoqubqpnayde.supabase.co",
    anonKey: "sb_publishable_d4aHVgwM22a71tnZ7BZsIg_b9DPt9wD",
  );

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
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return ScreenUtilInit(
          designSize: context.designSize(),
          minTextAdapt: true,
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          rebuildFactor: (old, data) => true,
          builder: (context, child) {
            return MaterialApp.router(
              // localizationsDelegates: AppLocalizations.localizationsDelegates,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', 'US'),
                Locale('pt', 'BR'),
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                R.load(locale ?? const Locale('pt', 'BR'));
                return locale;
              },
              locale: const Locale('pt', 'BR'),
              routerConfig: MainRouter.router,
              theme: AppTheme.lightTheme(context),
              themeMode: ThemeMode.light,
              title: "DeeHelp",
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}

/**
 * 

core
	ui
	providers
	errors
	utils
	validation
	notification
	valueobjects
	router
	localization
	res
	base
		entity.dart
		usecase.dart
		riverpod_base_page.dart
feature
	auth
	dashboard
	map
	faq
	profile
 */
