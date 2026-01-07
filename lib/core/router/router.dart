import 'package:deehelp/core/router/app_router.dart';
import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:deehelp/features/auth/presentation/nickname/add_nickname_page.dart';
import 'package:deehelp/features/dashboard/presentation/dashsboard_page.dart';
import 'package:deehelp/features/faq/faq_provider.dart';
import 'package:deehelp/features/incident/presentation/add/add_incident_page.dart';
import 'package:deehelp/features/incident/presentation/add/alert_error_screen.dart';
import 'package:deehelp/features/incident/presentation/add/incide_success_screen.dart';
import 'package:deehelp/features/incident/presentation/add/sending_alert_screen.dart';
import 'package:deehelp/features/map/presentation/map_page.dart';
import 'package:deehelp/features/onboarding/page/onboard_page.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/presentation/views/add/add_product_page.dart';
import 'package:deehelp/features/products/presentation/views/add/steps/add_product_success_page.dart';
import 'package:deehelp/features/products/presentation/views/listing/product_listing_page.dart';
import 'package:deehelp/features/products/presentation/views/update/update_product_page.dart';
import 'package:deehelp/features/profile/presentation/profile_page.dart';
import 'package:deehelp/features/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

class MainRouter {
  static var router = GoRouter(
    initialLocation: AppRouter.splash,
    debugLogDiagnostics: true,
    // redirect: _redirect,
    // refreshListenable: authRepository,
    routes: [
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
      GoRoute(
        path: AppRouter.addIncident,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const AddIncidentPage(),
        ),
      ),
      GoRoute(
        path: AppRouter.addIncidentSuccess,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: IncidentSuccessScreen(
            vehicleType: 'carro',
            location: 'Centro, São Paulo - SP',
            incidentTime: DateTime.now(),
          ),
        ),
      ),
      GoRoute(
        path: AppRouter.addIncidentError,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: AlertErrorScreen(
            onRetry: () {},
          ),
        ),
      ),
      GoRoute(
        path: AppRouter.sendIncident,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const SendingAlertScreen(
            vehicleType: 'carro',
            location: 'Centro, São Paulo - SP',
          ),
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
    ],
  );
}
