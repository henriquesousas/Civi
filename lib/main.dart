// import 'package:cloudflare_r2/cloudflare_r2.dart';
import 'package:cloudflare_r2/cloudflare_r2.dart';
import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/theme/theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/env.dart';
import 'core/resources.dart';
import 'core/ui/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('pt_BR', null);

  await Supabase.initialize(
    url: "https://qyqwuyrigoqubqpnayde.supabase.co",
    anonKey: "sb_publishable_d4aHVgwM22a71tnZ7BZsIg_b9DPt9wD",
  );

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  await CloudFlareR2.init(
    accountId: Env.r2AccountId,
    accessKeyId: Env.r2AccessKeyId,
    secretAccessKey: Env.r2SecretAccessKeyId,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(
    ProviderScope(
        child: DevicePreview(
      enabled: false,
      builder: (context) => const MainApp(),
    )),
  );
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  void initState() {
    super.initState();
    // Future.microtask(() => ref.read(themeProvider.notifier).loadSavedTheme());
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ref.read(themeProvider.notifier).loadSavedTheme();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        // final router = ref.watch(goRouterProvider);
        // final themeData = ref.watch(themeDataProvider);
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        //   ref.read(themeProvider.notifier).loadSavedTheme();
        // });

        return ScreenUtilInit(
          // designSize: context.designSize(),
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          // rebuildFactor: (old, data) => true,
          builder: (context, child) {
            final router = ref.watch(goRouterProvider);
            final themeData = ref.watch(themeDataProvider);
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            //   ref.read(themeProvider.notifier).loadSavedTheme();
            // });
            return MaterialApp.router(
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
              routerConfig: router,
              // theme: AppTheme.lightTheme(),
              // themeMode: ThemeMode.light,
              // darkTheme: AppTheme.dark(),
              theme: themeData,
              themeMode: ThemeMode.dark,
              // themeMode:
              //     themeState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
              title: "Kotto",
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
