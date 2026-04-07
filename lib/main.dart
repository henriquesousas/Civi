import 'package:deehelp/app_name.dart';
import 'package:deehelp/core/env_config.dart';
import 'package:deehelp/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart'
    show MapboxOptions;
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EnvConfig.init();

  await initializeDateFormatting('pt_BR', null);

  await Supabase.initialize(
    url: EnvConfig.supabaseUrl,
    anonKey: EnvConfig.supabaseAnonKey,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // se quiser permitir virar de cabeça pra baixo:
    // DeviceOrientation.portraitDown,
  ]);

  MapboxOptions.setAccessToken(EnvConfig.mapBoxToken);

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
            // final themeData = ref.watch(themeDataProvider);
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            //   ref.read(themeProvider.notifier).loadSavedTheme();
            // });
            return MaterialApp.router(
              // localizationsDelegates: const [
              //   GlobalMaterialLocalizations.delegate,
              //   GlobalWidgetsLocalizations.delegate,
              //   GlobalCupertinoLocalizations.delegate,
              // ],
              // supportedLocales: const [
              //   Locale('en', 'US'),
              //   Locale('pt', 'BR'),
              // ],
              // localeResolutionCallback: (locale, supportedLocales) {
              //   R.load(locale ?? const Locale('pt', 'BR'));
              //   return locale;
              // },
              locale: const Locale('pt', 'BR'),
              routerConfig: router,
              // themeMode: ThemeMode.light,
              // darkTheme: AppTheme.dark(),
              // theme: themeData,
              theme: AppTheme.dark(),
              darkTheme: AppTheme.dark(),
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

class SystemUIHelper {
  static void setStyle(Brightness brightness) {
    if (brightness == Brightness.dark) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      );
    }
  }
}
