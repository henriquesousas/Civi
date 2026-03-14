import 'dart:async';

import 'package:deehelp/app_startup_provider.dart';
import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:deehelp/feature/about/about_router.dart';
import 'package:deehelp/feature/auth/presentation/export_auth.dart';
import 'package:deehelp/feature/faq/export_faq.dart';
import 'package:deehelp/feature/home/export_home.dart';
import 'package:deehelp/feature/incidents/incident_router.dart';
import 'package:deehelp/feature/items/items_router.dart';
import 'package:deehelp/feature/location/export_location.dart';
import 'package:deehelp/feature/profile/export_profile.dart';
import 'package:deehelp/feature/search/search_router.dart';
import 'package:deehelp/feature/shell/app_sheel_router.dart';
import 'package:deehelp/feature/sos/sos_router.dart';
import 'package:deehelp/feature/splash/splash_router.dart';
import 'package:deehelp/core/router/router_refresh_notifier.dart';
import 'package:deehelp/teste_page4.dart';
import 'package:deehelp/teste_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) {
      notifyListeners();
    });
  }
  late final StreamSubscription<dynamic> _subscription;
  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

final _publicRoutes = [
  SplashRouter.path,
  HomeRouter.path,
  LocationRouter.gpsDisabled,
  LocationRouter.locationDenied,
];

var goRouterProvider = Provider<GoRouter>(
  (ref) {
    Future.microtask(() => ref.read(appStartupProvider.notifier).initCheck());

    return GoRouter(
      initialLocation: SplashRouter.path,
      debugLogDiagnostics: true,
      refreshListenable: RouterRefreshNotifier(ref),
      redirect: (context, state) {
        final appStatus = ref.read(appStartupProvider);
        final currentPath = state.matchedLocation;
        final isPublicRoute = _publicRoutes.contains(currentPath);
        // return '/';
        // return ItemsRouter.success;
        switch (appStatus) {
          case AppStatus.loading:
            return SplashRouter.path;

          case AppStatus.unauthenticated:
            return isPublicRoute ? AppSheelRouter.path : null;

          case AppStatus.needLocation:
            return LocationRouter.locationDenied;

          case AppStatus.gpsInactive:
            return LocationRouter.gpsDisabled;

          case AppStatus.ready:
            return isPublicRoute ? AppSheelRouter.path : null;
        }
      },
      routes: [
        ...AppSheelRouter.routers,
        ...SplashRouter.routers,
        ...LocationRouter.routers,
        ...HomeRouter.routers,
        ...ProfileRouter.routers,
        ...AboutRouter.routers,
        ...FaqPageRouter.routers,
        ...AuthRouter.routers,
        ...ItemsRouter.routers,
        ...IncidentRouter.routers,
        ...SOSRouter.routers,
        ...SearchRouter.routers,
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => slideTransitionPage(
              key: state.pageKey,
              // child: const MapPage(),
              // child: const MapPage2(),
              // child: const MounsHouse(),
              // child: const CardBottom(),
              child: TestPage5Dark()
              // child: ItemDetailsPage(
              //   item: ItemDetailsModel(
              //     name: 'Citroen C3 Tendance',
              //     status: ItemStatus.active,
              //     createdAtLabel: 'Cadastrado em 12/03/2026',
              //     identifierLabel: 'Placa',
              //     identifierValue: 'FGH-2A11',
              //     color: 'Branco',
              //     extraLabel1: 'Ano',
              //     extraValue1: '2018',
              //     lastLocation: 'Osasco • SP',
              //     lastUpdateLabel: 'Atualizado há 2 horas',
              //     notes: 'Veículo cadastrado para monitoramento preventivo.',
              //     imageUrls: [
              //       'https://pub-0366da0e0a6d49998a77e988d464e762.r2.dev/products/374d51f7-b49a-4360-b5f7-3a8e5c4d995b/1773265765129.jpeg',
              //       'https://pub-0366da0e0a6d49998a77e988d464e762.r2.dev/products/374d51f7-b49a-4360-b5f7-3a8e5c4d995b/1773343050076.jpeg',
              //       'https://pub-0366da0e0a6d49998a77e988d464e762.r2.dev/products/374d51f7-b49a-4360-b5f7-3a8e5c4d995b/1773265791164.jpeg',
              //     ],
              //     onDelete: () {},
              //     onEditIdentifier: () {},
              //   ),
              // ),
              ),
        ),
      ],
    );
  },
);
