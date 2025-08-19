import 'package:go_router/go_router.dart';
import 'package:yousafe/app/router/router_config.dart';
import 'package:yousafe/app/router/slide_transition_page.dart';
import 'package:yousafe/features/about/about_us_view.dart';
import 'package:yousafe/features/auth/login/login_page.dart';
import 'package:yousafe/features/auth/otp/otp_verification_page.dart';
import 'package:yousafe/features/auth/register/register_account_page.dart';
import 'package:yousafe/features/faq/faq_provider.dart';
import 'package:yousafe/features/favorites/favourite_view.dart';
import 'package:yousafe/features/home/home_view.dart';
import 'package:yousafe/features/main/main_page.dart';
import 'package:yousafe/features/onboarding/onboarding_page.dart';
import 'package:yousafe/features/policy/privacy_policy_view.dart';
import 'package:yousafe/features/product/product_detail_view.dart';
import 'package:yousafe/features/profile/profile_edit_view.dart';
import 'package:yousafe/features/profile/profile_provider.dart';
import 'package:yousafe/features/settings/settings_page.dart';
import 'package:yousafe/features/splash/splash_page.dart';
import 'package:yousafe/features/terms/use_terms_view.dart';
import 'package:yousafe/features/welcome/old/welcome_provider.dart';
import 'package:yousafe/features/welcome/welcome_page.dart';

class AppRouter {
  static var router = GoRouter(
    initialLocation: Routes.bottomView,
    debugLogDiagnostics: true,
    // redirect: _redirect,
    // refreshListenable: authRepository,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        path: Routes.onboarding,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const OnboardingPage(),
        ),
      ),
      GoRoute(
        path: Routes.otpVerification,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const OtpVerificationPage(),
        ),
      ),
      GoRoute(
        path: Routes.login,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: Routes.registerAccount,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const RegisterAccountPage(),
        ),
      ),
      GoRoute(
        path: Routes.welcome,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const WelcomePage(),
        ),
      ),
      GoRoute(
        path: Routes.settings,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const SettingsPage(),
        ),
      ),
      GoRoute(
        path: Routes.onboarding2,
        builder: (context, state) => WelcomeProvider.page,
      ),
      GoRoute(
        path: Routes.profile,
        builder: (context, state) => ProfileProvider.page,
      ),
      GoRoute(
        path: Routes.faq,
        builder: (context, state) => FaqProvider.page,
      ),
      GoRoute(
        path: Routes.terms,
        builder: (context, state) => UserTermsView(),
      ),
      GoRoute(
        path: Routes.privacyPolicy,
        builder: (context, state) => PrivacyPolicyView(),
      ),
      GoRoute(
        path: Routes.aboutUs,
        builder: (context, state) => AboutUsView(),
      ),
      GoRoute(
        path: Routes.myProfile,
        builder: (context, state) => ProfileEditView(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: Routes.favorites,
        builder: (context, state) => FavouriteView(),
      ),
      GoRoute(
        path: Routes.productDetail,
        builder: (context, state) => ProductDetailView(),
      ),
      GoRoute(
        path: Routes.bottomView,
        builder: (context, state) => MainPage(),
      ),
    ],
  );
}
