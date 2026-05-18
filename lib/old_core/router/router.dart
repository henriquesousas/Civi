import 'package:deehelp/business/auth/providers/loggued_user_provider.dart';
import 'package:deehelp/old_core/providers/supabase_provider.dart';
import 'package:deehelp/old_core/router/router_refresh_notifier.dart';
import 'package:deehelp/feature/auth/presentation/export_auth.dart';
import 'package:deehelp/feature/profile/export_profile.dart';
import 'package:deehelp/feature/splash/splash_router.dart';
import 'package:deehelp/core/data/auth/session_user_notifier.dart';
import 'package:deehelp/v2/feature/location_disable/location_disable_router.dart';
import 'package:deehelp/v2/feature/notification/notification_router.dart';
import 'package:deehelp/v2/feature/occurrence/detail/alert_detail_router.dart';
import 'package:deehelp/v2/feature/product/product_router.dart';
import 'package:deehelp/v2/feature/profile/profile_routert.dart';
import 'package:deehelp/v2/feature/shell/main_shell_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// class GoRouterRefreshStream extends ChangeNotifier {
//   GoRouterRefreshStream(Stream<dynamic> stream) {
//     notifyListeners();
//     _subscription = stream.asBroadcastStream().listen((_) {
//       notifyListeners();
//     });
//   }
//   late final StreamSubscription<dynamic> _subscription;
//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }
// }

// final _publicRoutes = [
//   SplashRouter.path,
//   // HomeRouter.path,
//   LocationRouter.gpsDisabled,
//   LocationRouter.locationDenied,
// ];

var goRouterProvider = Provider<GoRouter>(
  (ref) {
    // Future.microtask(() => ref.read(appStartupProvider.notifier).initCheck());
    final sessionNotifier = ref.watch(sessionUserNotifier);
    return GoRouter(
      initialLocation: AuthRouter.path,
      debugLogDiagnostics: true,
      // refreshListenable: RouterRefreshNotifier(ref),
      refreshListenable: SessionUserNotifier(ref.watch(supabaseClientProvider)),
      redirect: (context, state) async {
        final isLoggedIn = sessionNotifier.user != null;
        if (!isLoggedIn) {
          //Verificar se ja clicou no Continuar sem Login
          return AuthRouter.path;
        }
        return MainShellRouter.path;
      },
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
        ...MainShellRouter.routers,
        ...LocationDisableRouter.routers,
        ...AuthRouter.routers,
        ...NotificationRouter.routers,
        ...AlertDetailRouter.routers,
        ...ProfileRouter.routers,
        ...ProfileRouterOld.routers,
        ...ProductRouter.routers,
        // GoRoute(
        //   path: '/',
        //   pageBuilder: (context, state) => slideTransitionPage(
        //     key: state.pageKey,
        //     // child: const MapPage(),
        //     // child: const MapPage2(),
        //     // child: const MounsHouse(),
        //     // child: const CardBottom(),

        //     // child: EventsScreen(),
        //     // child: TesteDetailPage(),
        //     // child: ItemDetailsPage(item: ,),
        //     // child: ImeiInfoPage(),
        //     // child: SuspiciousActivityPage(),
        //     // child: NoiseComplaintPage(),
        //     // child: FloodAlertPage(
        //     //   locationLabel: 'Centro Osascos',
        //     // ),
        //     // child: ItemTypeSelectionPageLightV2(),
        //     // child: ItemTypeSelectionPageDarkV2(),
        //     // child: ItemNameStepLightPage(
        //     //   itemTypeLabel: "Carro",
        //     // ),
        //     // child: ItemColorStepPage(),
        //     // child: ItemDescriptionPageLight(),
        //     // child: ItemDetailPageLight(),
        //     // child: ItemDetailPageLightV2(),
        //     // child: ItemPhonePageLight(),
        //     // child: ItemPhotoStepPage(),
        //     // child: ItemPhotoStepDarkPage(),
        //     // child: ItemRegisteredSuccessfullyDarkPage(),
        //     // child: SuspiciousActivityPageLight(),
        //     // child: ThankYouAlertCard(),
        //     // child: TestAlertHomePage(), //OK
        //     // child: SendAlertPage(),
        //     // child: TestMapaDetail(),
        //     // child: TestMapa(),
        //     // child: MapPage(),
        //     // child: MainShellPage(),
        //     // child: AlertDetail()
        //     // child: TestProfileV2(), //Profile
        //     // child: TesteSettings(),
        //     // child: SocialProfileScreen(),
        //     child: TestProfileBadgePage(),
        //     // child: TestBadgeUnlockedPage(),
        //     // child: TestBadgePage(),
        //     // child: TestPost(), //OK
        //     // child: FeedPostPage(),
        //     // child: TesteNicknamePage(),
        //     // child: AddNicknamePage(),
        //     // child: TestNicknameRequiredPage(),
        //     // child: TestAlertZonePage(),
        //     // child: TestListProdPage(),
        //     // child: ListProductPage(),
        //     // child: TestVehicleRegisterPage(),
        //     // child: RegisterVehiclePage(),
        //     // child: TestPhoneRegisterPage(),
        //     // child: RegisterPhonePage(),
        //     // child: TestLocationDisabledPage(),
        //     // child: LocationDisablePage(),
        //     // child: TestWelcome2(),
        //     // child: LoginPage(),
        //     // child: TestBrandPage(),
        //     // child: TestMapa(),
        //     // child: TestNotification(), //OK
        //     // child: NotificationPage(),
        //     // child: FloodAlertPage(locationLabel: "Rua Joao ventura"),
        //     // child: SuspiciousActivityPage(),
        //   ),
        // ),
      ],
    );
  },
);
