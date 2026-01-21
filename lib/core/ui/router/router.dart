import 'dart:async';

import 'package:deehelp/core/ui/router/app_router.dart';
import 'package:deehelp/core/ui/router/slide_transition_page.dart';
import 'package:deehelp/features/auth/external/di/auth_repository_provider.dart';
import 'package:deehelp/features/auth/external/di/auth_state_provider.dart';
import 'package:deehelp/features/auth/external/repositories/supabase_auth_repository.dart';
import 'package:deehelp/features/incident/incident_module.dart';
import 'package:deehelp/features/profile/presentation/views/add_nickname/add_nickname_page.dart';
import 'package:deehelp/features/dashboard/presentation/dashsboard_page.dart';
import 'package:deehelp/features/faq/faq_provider.dart';
import 'package:deehelp/features/map/presentation/map_page.dart';
import 'package:deehelp/features/onboarding/page/onboard_page.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/presentation/views/add/add_product_page.dart';
import 'package:deehelp/features/products/presentation/views/add/steps/add_product_success_page.dart';
import 'package:deehelp/features/products/presentation/views/listing/product_listing_page.dart';
import 'package:deehelp/features/products/presentation/views/update/update_product_page.dart';
import 'package:deehelp/features/profile/presentation/views/profile/profile_page.dart';
import 'package:deehelp/features/search/search_page.dart';
import 'package:deehelp/features/splash/splash_page.dart';
import 'package:deehelp/features/test_page.dart';
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
  AppRouter.splash,
  AppRouter.onboarding,
];

var goRouterProvider = Provider<GoRouter>(
  (ref) {
    final authRepo = ref.watch(authStateProvider);
    final authRepository =
        ref.watch(authRepositoryProvider) as AuthStateChangeNotifier;
    return GoRouter(
      initialLocation: AppRouter.splash,
      debugLogDiagnostics: true,
      refreshListenable: GoRouterRefreshStream(
        authRepository.onAuthStateChanged(),
      ),
      redirect: (context, state) {
        return authRepo.when(
          data: (session) {
            final currentPath = state.matchedLocation;
            final isSplash = currentPath == AppRouter.splash;
            final isOnboarding = currentPath == AppRouter.onboarding;
            final isPublicRoute = _publicRoutes.contains(currentPath);

            if (session == null) {
              return isPublicRoute ? null : AppRouter.onboarding;
            }

            if (isSplash || isOnboarding) {
              return AppRouter.dashboard;
            }

            return null;
          },
          error: (v, s) => null,
          loading: () => null,
        );
      },
      routes: [
        ...IncidentModule.routers,
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const TestPage(),
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
          path: AppRouter.splash,
          builder: (context, state) => const SplashPage(),
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
          path: AppRouter.profile,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: const ProfilePage(),
          ),
        ),
        GoRoute(
          path: AppRouter.faq,
          pageBuilder: (context, state) => slideTransitionPage(
            key: state.pageKey,
            child: FaqProvider.page,
          ),
        ),
        // GoRoute(
        //   path: AppRouter.addIncident,
        //   pageBuilder: (context, state) => slideTransitionPage(
        //     key: state.pageKey,
        //     child: const AddIncidentPage(),
        //   ),
        // ),
        // GoRoute(
        //   path: AppRouter.incidents,
        //   pageBuilder: (context, state) => slideTransitionPage(
        //     key: state.pageKey,
        //     child: const ListingIncidentPage(),
        //   ),
        // ),
        // GoRoute(
        //   path: AppRouter.updateIncident,
        //   pageBuilder: (context, state) => slideTransitionPage(
        //     key: state.pageKey,
        //     child: const UpdateIncidentPage(),
        //   ),
        // ),
        // GoRoute(
        //   path: AppRouter.updateIncidentTile,
        //   pageBuilder: (context, state) {
        //     final data = state.extra as Map<String, dynamic>;
        //     final args = UpdateIncidentArgs.from(data);

        //     return slideTransitionPage(
        //       key: state.pageKey,
        //       child: UpdateIncidentPageTile(args: args),
        //     );
        //   },
        // ),
        // GoRoute(
        //   path: AppRouter.addIncidentSuccess,
        //   pageBuilder: (context, state) => slideTransitionPage(
        //     key: state.pageKey,
        //     child: IncidentRegisteredSuccessfullyWidget(
        //       vehicleType: 'carro',
        //       location: 'Centro, São Paulo - SP',
        //       incidentTime: DateTime.now(),
        //     ),
        //   ),
        // ),
        // GoRoute(
        //   path: AppRouter.addIncidentError,
        //   pageBuilder: (context, state) => slideTransitionPage(
        //     key: state.pageKey,
        //     child: IncidentErrorWidget(
        //       onRetry: () {},
        //     ),
        //   ),
        // ),
        // GoRoute(
        //   path: AppRouter.sendIncident,
        //   pageBuilder: (context, state) => slideTransitionPage(
        //     key: state.pageKey,
        //     child: const SendingAlertScreen(
        //       vehicleType: 'carro',
        //       location: 'Centro, São Paulo - SP',
        //     ),
        //   ),
        // ),
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
              child: SearchPage(),
            );
          },
        ),
      ],
    );
  },
);
