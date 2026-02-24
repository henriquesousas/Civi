import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_feature/app_feature.dart';

import 'package:deehelp/app_startup_provider.dart';
import 'package:deehelp/feature/about/about_router.dart';
import 'package:deehelp/feature/auth/presentation/export_auth.dart';
import 'package:deehelp/feature/faq/export_faq.dart';
import 'package:deehelp/feature/home/export_home.dart';
import 'package:deehelp/feature/incidents/incident_router.dart';
import 'package:deehelp/feature/items/items_router.dart';
import 'package:deehelp/feature/location/export_location.dart';
import 'package:deehelp/feature/profile/export_profile.dart';
import 'package:deehelp/feature/sos/sos_router.dart';
import 'package:deehelp/feature/splash/splash_router.dart';
import 'package:deehelp/old_core/ui/router/app_router.dart';
import 'package:deehelp/old_core/ui/router/slide_transition_page.dart';
import 'package:deehelp/old_features/emergency-call/public_list_emergency_call_page.dart';
import 'package:deehelp/old_features/profile/presentation/views/add_nickname/add_nickname_page.dart';
import 'package:deehelp/old_features/dashboard/presentation/dashsboard_page.dart';
import 'package:deehelp/old_features/faq/faq_provider.dart';
import 'package:deehelp/old_features/map/presentation/map_page.dart';
import 'package:deehelp/old_features/onboarding/page/onboard_page.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:deehelp/old_features/products/presentation/views/add/add_product_page.dart';
import 'package:deehelp/old_features/products/presentation/views/add/steps/add_product_success_page.dart';
import 'package:deehelp/old_features/products/presentation/views/listing/product_listing_page.dart';
import 'package:deehelp/old_features/products/presentation/views/update/update_product_page.dart';
import 'package:deehelp/old_features/profile/presentation/views/profile/profile_page.dart';
import 'package:deehelp/old_features/search/search_page.dart';
import 'package:deehelp/old_features/test_page.dart';
// import 'package:deehelp/features/splash/splash_page.dart';
import 'package:deehelp/old_features/welcome/welcome_page.dart';
import 'package:deehelp/router_refresh_notifier.dart';
import 'package:deehelp/test_ocorrences.dart';
import 'package:deehelp/test_page10.dart';
import 'package:deehelp/test_page11.dart';
import 'package:deehelp/test_page12.dart';
import 'package:deehelp/test_page13.dart';
import 'package:deehelp/test_page2.dart';
import 'package:deehelp/test_page3.dart';
import 'package:deehelp/test_page4.dart';
import 'package:deehelp/test_page40.dart';
import 'package:deehelp/test_page5.dart';
import 'package:deehelp/test_page5_1.dart';
import 'package:deehelp/test_page6.dart';
import 'package:deehelp/test_page7.dart';
import 'package:deehelp/test_page8.dart';
import 'package:deehelp/test_page9.dart';
import 'package:deehelp/test_page_dark.dart';
import 'package:deehelp/teste_home.dart';
import 'package:deehelp/teste_incident_loading.dart';
import 'package:deehelp/teste_nickname_page.dart';
import 'package:deehelp/teste_nickname_required_page.dart';
import 'package:deehelp/teste_page_contato.dart';
import 'package:deehelp/teste_page_login.dart';
import 'package:deehelp/teste_sheel_page.dart';
import 'package:deehelp/teste_sos_page.dart';
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
  AppRouter.onboarding,
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
        // return AuthRouter.path;
        switch (appStatus) {
          case AppStatus.loading:
            return SplashRouter.path;

          case AppStatus.unauthenticated:
            return isPublicRoute ? HomeRouter.path : null;

          case AppStatus.needLocation:
            return LocationRouter.locationDenied;

          case AppStatus.gpsInactive:
            return LocationRouter.gpsDisabled;

          case AppStatus.ready:
            return isPublicRoute ? HomeRouter.path : null;
        }
      },
      routes: [
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
        // ...IncidentModule.routers,
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,

            //Home
            // child: const TestPage(),
            //SOS
            // child: const TesteSOSPage(),
            //GPS
            // child: TestPage13(),
            // Search
            // child: const TestPage2(),
            //Profile
            // child: const TestPage3(),
            // Lista de items
            // child: const TestPage4(),
            // Cadastro de item
            // child: const TestPage40(),
            // Detalhes do item
            // child: TestPage5(),
            // child: TestPage5(),
            // child: TestPage5_1(
            //   args: EditFieldArgs(
            //     title: "Marca",
            //     label: "marca",
            //     hint: "marca",
            //     initialValue: "Motorola",
            //     maxLen: 10,
            //   ),
            // ),
            // Item cadastrado sucesso
            // child: TestPage6(),
            // child: AddProductSuccessPage()
            //Detalhes da ocorrencia
            // child: TestPage7(),
            // Reportat incident
            // child: TestOcorrencia(),
            // child: TestPage8(),
            // ReportIncidentSuccess
            child: const TestPage9(),
            // Splash
            // child: const TestPage10(),
            // Welcome
            // child: const TestPage11(),
            //FAQ DARK
            // child: const TestPage12FaqPage(),
            // child: TestPageLogin(
            //   onGoogleTap: () {},
            //   onGuestTap: () {},
            // ),
            // child: const TestPageDark(),
            // child: const MapPage(),
            // child: TestePageContato(),
            // child: TesteHome(),
            // child: TesteShellPage(),
            // child: TesteIncidentLoading(),
            // child: TesteNicknamePage(),
            // child: TesteNicknameRequiredPage(),
          ),
        ),
        GoRoute(
          path: AppRouter.onboarding,
          pageBuilder: (context, state) {
            return slideTransitionPage(
                key: state.pageKey, child: const OnboardPage());
          },
        ),
        GoRoute(
          path: AppRouter.myProducts,
          pageBuilder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?;
            final isAddIncident =
                extra?[ProductListingPage.isAddIncidentKey] as bool? ?? false;
            return slideTransitionPage(
              key: state.pageKey,
              child: ProductListingPage(
                isAddIncident: isAddIncident,
              ),
            );
          },
        ),
        GoRoute(
          path: AppRouter.addProduct,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const AddProductPage(),
          ),
        ),
        GoRoute(
          path: AppRouter.editProduct,
          pageBuilder: (context, state) {
            final Product? product = state.extra as Product?;
            return slideTransitionPage(
              key: state.pageKey,
              child: UpdateProductPage(product: product!),
            );
          },
        ),
        GoRoute(
          path: AppRouter.addProductSuccess,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const AddProductSuccessPage(),
          ),
        ),
        GoRoute(
          path: AppRouter.map,
          builder: (context, state) => const MapPage(),
        ),
        GoRoute(
          path: AppRouter.dashboard,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const DashsboardPage(),
          ),
        ),
        GoRoute(
          path: AppRouter.faq,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: FaqProvider.page,
          ),
        ),
        GoRoute(
          path: AppRouter.addNickname,
          pageBuilder: (context, state) {
            return slideTransitionPage(
              key: state.pageKey,
              child: AddNicknamePage(),
            );
          },
        ),
        GoRoute(
          path: AppRouter.search,
          pageBuilder: (context, state) {
            return slideTransitionPage(
              key: state.pageKey,
              child: const SearchPage(),
            );
          },
        ),
        // GoRoute(
        //   path: AppRouter.locationRequired,
        //   pageBuilder: (context, state) {
        //     return slideTransitionPage(
        //       key: state.pageKey,
        //       child: const LocationRequiredPage(),
        //     );
        //   },
        // ),
        GoRoute(
          path: AppRouter.publicEmergencyCall,
          pageBuilder: (context, state) {
            return slideTransitionPage(
              key: state.pageKey,
              child: const PublicListEmergencyCallPage(),
            );
          },
        ),
        GoRoute(
          path: AppRouter.welcome,
          pageBuilder: (context, state) {
            return slideTransitionPage(
              key: state.pageKey,
              child: const WelcomeScreen(),
            );
          },
        ),
      ],
    );
  },
);
