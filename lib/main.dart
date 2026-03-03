import 'package:cloudflare_r2/cloudflare_r2.dart';
import 'package:deehelp/app_name.dart';
import 'package:deehelp/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/resources.dart';
import 'core/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('pt_BR', null);

  await Supabase.initialize(
    url: "https://zgwniakmowojymmmljbw.supabase.co",
    anonKey: "sb_publishable_N5D6VJ2Qm832Onz-NvFGfA_bO1NohOE",
  );

  await CloudFlareR2.init(
    accountId: "2f0c45d371a6f728da6a889027b991f5",
    accessKeyId: "290d6a3180cc5b6fa78937b557bda224",
    secretAccessKey:
        "6fd0a3d0bbaa58909b0a8739d70dda002d709dc19ef9a237ac1473a29eba0312",
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(
    const ProviderScope(child: MainApp()),
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
          rebuildFactor: (old, data) => true,
          builder: (context, child) {
            // final mq = MediaQuery.of(context);
            // final isLandscape = mq.orientation == Orientation.landscape;

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
              title: AppName.appName,
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
