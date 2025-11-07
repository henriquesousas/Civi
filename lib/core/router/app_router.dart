import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/router/slide_transition_page.dart';
import 'package:deehelp/features/auth/presentation/login/login_with_google_page.dart';
import 'package:deehelp/features/favorites/favourite_view.dart';
import 'package:deehelp/features/home/home_view.dart';
import 'package:deehelp/features/itens/create/create_new_item_page.dart';
import 'package:deehelp/features/itens/edit/item_edit_page.dart';
import 'package:deehelp/features/itens/list/my_items_page.dart';
import 'package:deehelp/features/main/main_page.dart';
import 'package:deehelp/features/occurrence/occurrence_detail_page.dart';
import 'package:deehelp/features/occurrence/occurrence_page.dart';
import 'package:deehelp/features/onboarding/onboarding_page.dart';
import 'package:deehelp/features/settings/about/about_us_view.dart';
import 'package:deehelp/features/settings/faq/faq_provider.dart';
import 'package:deehelp/features/settings/help/help_page.dart';
import 'package:deehelp/features/settings/privacy_policy/privacy_policy_page.dart';
import 'package:deehelp/features/settings/settings_page.dart';
import 'package:deehelp/features/settings/terms/use_terms_view.dart';
import 'package:deehelp/features/splash/splash_page.dart';
import 'package:deehelp/features/welcome/old/welcome_provider.dart';
import 'package:deehelp/features/welcome/welcome_page.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/login/login_page.dart';
import '../../features/auth/presentation/otp/otp_verification_page.dart';
import '../../features/auth/presentation/register/register_account_page.dart';

class AppRouter {
  static var router = GoRouter(
    initialLocation: RouterConstant.splash,
    debugLogDiagnostics: true,
    // redirect: _redirect,
    // refreshListenable: authRepository,
    routes: [
      GoRoute(
        path: RouterConstant.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: RouterConstant.onboarding,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const OnboardingPage(),
        ),
      ),
      GoRoute(
        path: RouterConstant.itemEdit,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const ItemEditPage(),
        ),
      ),
      GoRoute(
        path: RouterConstant.otpVerification,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const OtpVerificationPage(),
        ),
      ),
      GoRoute(
        path: RouterConstant.login,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: RouterConstant.loginWithGoogle,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const LoginWithGooglePage(),
        ),
      ),
      GoRoute(
        path: RouterConstant.occurrences,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const OccurrencePage(),
        ),
      ),
      GoRoute(
        path: RouterConstant.registerAccount,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const RegisterAccountPage(),
        ),
      ),
      GoRoute(
        path: RouterConstant.welcome,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const WelcomePage(),
        ),
      ),
      GoRoute(
        path: RouterConstant.settings,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const SettingsPage(),
        ),
      ),
      GoRoute(
        path: RouterConstant.faq,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: FaqProvider.page,
        ),
      ),
      GoRoute(
        path: RouterConstant.terms,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const UserTermsView(),
        ),
      ),
      GoRoute(
        path: RouterConstant.privacyPolicy,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const PrivacyPolicyPage(),
        ),
      ),
      // GoRoute(
      //   path: RouterConstant.profileEdit,
      //   pageBuilder: (context, state) => slideTransitionPage(
      //     key: state.pageKey,
      //     child: const ProfileEditPage(),
      //   ),
      // ),
      GoRoute(
        path: RouterConstant.help,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const HelpPage(),
        ),
      ),
      GoRoute(
        path: RouterConstant.myItems,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const MyItemsPage(),
        ),
      ),
      GoRoute(
        path: RouterConstant.createNewItem,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const CreateNewItemPage(),
        ),
      ),
      GoRoute(
        path: RouterConstant.productDetail,
        pageBuilder: (context, state) => slideTransitionPage(
          key: state.pageKey,
          child: const OccurrenceDetailPage(),
        ),
      ),
      GoRoute(
        path: RouterConstant.onboarding2,
        builder: (context, state) => WelcomeProvider.page,
      ),
      // GoRoute(
      //   path: RouterConstant.profile,
      //   builder: (context, state) => ProfileProvider.page,
      // ),
      GoRoute(
        path: RouterConstant.aboutUs,
        builder: (context, state) => AboutUsView(),
      ),
      // GoRoute(
      //   path: RouterConstant.myProfile,
      //   builder: (context, state) => ProfileEditView(),
      // ),
      GoRoute(
        path: RouterConstant.home,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: RouterConstant.favorites,
        builder: (context, state) => FavouriteView(),
      ),
      GoRoute(
        path: RouterConstant.bottomView,
        builder: (context, state) => MainPage(),
      ),
    ],
  );
}
