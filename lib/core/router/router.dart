import 'dart:async';

import 'package:deehelp/app_startup_provider.dart';
import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:deehelp/feature/about/about_router.dart';
import 'package:deehelp/feature/alerts/alerts_router.dart';
import 'package:deehelp/feature/alerts/suspicious_activity_page.dart';
import 'package:deehelp/feature/auth/presentation/export_auth.dart';
import 'package:deehelp/feature/faq/export_faq.dart';
import 'package:deehelp/feature/incidents/incident_router.dart';
import 'package:deehelp/feature/items/items_router.dart';
import 'package:deehelp/feature/location/export_location.dart';
import 'package:deehelp/feature/profile/export_profile.dart';
import 'package:deehelp/feature/search/search_router.dart';
import 'package:deehelp/feature/shell/app_sheel_router.dart';
import 'package:deehelp/feature/sos/sos_router.dart';
import 'package:deehelp/feature/splash/splash_router.dart';
import 'package:deehelp/core/router/router_refresh_notifier.dart';
import 'package:deehelp/test_alert_choose.dart';
import 'package:deehelp/test_alert_zone_page.dart';
import 'package:deehelp/test_bottom.dart';
import 'package:deehelp/test_brand_page.dart';
import 'package:deehelp/test_list_prod_page.dart';
import 'package:deehelp/test_location_disable.dart';
import 'package:deehelp/test_map.dart';
import 'package:deehelp/test_mapa_detail.dart';
import 'package:deehelp/test_nickname_required_page.dart';
import 'package:deehelp/test_noise.dart';
import 'package:deehelp/test_phone_register_page.dart';
import 'package:deehelp/test_post.dart';
import 'package:deehelp/test_profile_v2.dart';
import 'package:deehelp/test_registrar.dart';
import 'package:deehelp/test_registrar2.dart';
import 'package:deehelp/test_router_preview.dart';
import 'package:deehelp/test_suspicius.dart';
import 'package:deehelp/test_vehicle_register_page.dart';
import 'package:deehelp/test_welcome.dart';
import 'package:deehelp/test_welcome_page2.dart';
import 'package:deehelp/teste_notification.dart';
import 'package:deehelp/v2/feature/feed/presentation/fedd_page.dart';
import 'package:deehelp/v2/feature/location_disable/location_disable_router.dart';
import 'package:deehelp/v2/feature/location_disable/presentation/location_disable_page.dart';
import 'package:deehelp/v2/feature/login/login_router.dart';
import 'package:deehelp/v2/feature/login/presentation/login_page.dart';
import 'package:deehelp/v2/feature/notification/notification_router.dart';
import 'package:deehelp/v2/feature/occurrence/detail/alert_detail_router.dart';
import 'package:deehelp/v2/feature/product/product_router.dart';
import 'package:deehelp/v2/feature/profile/nickname/nickname_routert.dart';
import 'package:deehelp/v2/feature/shell/main_shell_page.dart';
import 'package:deehelp/v2/feature/map/presentation/map_page.dart';
import 'package:deehelp/v2/feature/notification/presentation/notification_page.dart';
import 'package:deehelp/v2/feature/occurrence/detail/presentation/alert_detail_page.dart';
import 'package:deehelp/v2/feature/product/presentation/list/list_product_page.dart';
import 'package:deehelp/v2/feature/product/presentation/register/phone/register_phone_page.dart';
import 'package:deehelp/v2/feature/product/presentation/register/vehicle/register_vehicle_page.dart';
import 'package:deehelp/v2/feature/profile/nickname/presentation/add_nickname_page.dart';
import 'package:deehelp/v2/feature/occurrence/send_alert/presentation/send_alert_page.dart';
import 'package:deehelp/v2/feature/shell/main_shell_router.dart';
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
  // HomeRouter.path,
  LocationRouter.gpsDisabled,
  LocationRouter.locationDenied,
];

var goRouterProvider = Provider<GoRouter>(
  (ref) {
    Future.microtask(() => ref.read(appStartupProvider.notifier).initCheck());

    return GoRouter(
      // initialLocation: SplashRouter.path,
      initialLocation: '/',
      debugLogDiagnostics: true,
      // refreshListenable: RouterRefreshNotifier(ref),
      // redirect: (context, state) {
      //   final appStatus = ref.read(appStartupProvider);
      //   final currentPath = state.matchedLocation;
      //   final isPublicRoute = _publicRoutes.contains(currentPath);
      //   // return '/';
      //   return MainShellRouter.path;
      //   switch (appStatus) {
      //     case AppStatus.loading:
      //       // return SplashRouter.path;
      //       return AppSheelRouter.path;

      //     case AppStatus.unauthenticated:
      //       return isPublicRoute ? AppSheelRouter.path : null;

      //     case AppStatus.needLocation:
      //       return LocationRouter.locationDenied;

      //     case AppStatus.gpsInactive:
      //       return LocationRouter.gpsDisabled;

      //     case AppStatus.ready:
      //       return isPublicRoute ? AppSheelRouter.path : null;
      //   }
      // },
      routes: [
        ...SplashRouter.routers,
        // ...AppSheelRouter.routers,
        // ...LocationRouter.routers,
        // ...AlertsRouter.routers,
        // ...ProfileRouter.routers,
        // ...AboutRouter.routers,
        // ...FaqPageRouter.routers,
        // ...AuthRouter.routers,
        // ...ItemsRouter.routers,
        // ...IncidentRouter.routers,
        // ...SOSRouter.routers,
        // ...SearchRouter.routers,
        //Rotas V2
        ...MainShellRouter.routers,
        ...LocationDisableRouter.routers,
        ...LoginRouter.routers,
        ...NotificationRouter.routers,
        ...AlertDetailRouter.routers,
        ...NicknameRouter.routers,
        ...ProductRouter.routers,

        GoRoute(
          path: '/',
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            // child: const MapPage(),
            // child: const MapPage2(),
            // child: const MounsHouse(),
            // child: const CardBottom(),

            // child: EventsScreen(),
            // child: TesteDetailPage(),
            // child: ItemDetailsPage(item: ,),
            // child: ImeiInfoPage(),
            // child: SuspiciousActivityPage(),
            // child: NoiseComplaintPage(),
            // child: FloodAlertPage(
            //   locationLabel: 'Centro Osascos',
            // ),
            // child: ItemTypeSelectionPageLightV2(),
            // child: ItemTypeSelectionPageDarkV2(),
            // child: ItemNameStepLightPage(
            //   itemTypeLabel: "Carro",
            // ),
            // child: ItemColorStepPage(),
            // child: ItemDescriptionPageLight(),
            // child: ItemDetailPageLight(),
            // child: ItemDetailPageLightV2(),
            // child: ItemPhonePageLight(),
            // child: ItemPhotoStepPage(),
            // child: ItemPhotoStepDarkPage(),
            // child: ItemRegisteredSuccessfullyDarkPage(),
            // child: SuspiciousActivityPageLight(),
            // child: ThankYouAlertCard(),
            // child: TestAlertHomePage(), //OK
            // child: SendAlertPage(),
            // child: TestMapaDetail(),
            // child: TestMapa(),
            // child: MapPage(),
            // child: MainShellPage(),
            // child: AlertDetail()
            // child: TestProfileV2(), //Profile
            // child: TestPost(), //OK
            // child: FeedPostPage(),
            // child: TesteNicknamePage(),
            // child: AddNicknamePage(),
            // child: TestNicknameRequiredPage(),
            // child: TestAlertZonePage(),
            child: TestListProdPage(),
            // child: ListProductPage(),
            // child: TestVehicleRegisterPage(),
            // child: RegisterVehiclePage(),
            // child: TestPhoneRegisterPage(),
            // child: RegisterPhonePage(),
            // child: TestLocationDisabledPage(),
            // child: LocationDisablePage(),
            // child: TestWelcome2(),
            // child: LoginPage(),
            // child: TestBrandPage(),
            // child: TestMapa(),
            // child: TestNotification(), //OK
            // child: NotificationPage(),
            // child: FloodAlertPage(locationLabel: "Rua Joao ventura"),
            // child: SuspiciousActivityPage(),
          ),
        ),
      ],
    );
  },
);
