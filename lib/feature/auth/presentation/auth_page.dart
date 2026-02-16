import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/feature/auth/presentation/widgets/auth_view.dart';
import 'package:deehelp/feature/auth/viemodel/auth_state.dart';
import 'package:deehelp/module/auth/external/di/auth_view_model_provider.dart';
import 'package:deehelp/old_core/ui/extensions/dialog_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'widgets/auth_logo.dart';
import 'widgets/bubble_background.dart';
import 'package:flutter/material.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(authViewViewModelProvider.notifier);

    listeners(context, ref);

    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            const BubbleBackground(),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LogoBlock(),
                      const SizedBox(height: SpacingSize.lg),
                      ref.watch(authViewViewModelProvider).maybeWhen(
                            loading: () => AuthView(
                              onLoginWithGoogle: () {},
                              onContinueWithLogin: () => context.pop(),
                              isLoading: true,
                            ),
                            orElse: () => AuthView(
                              onLoginWithGoogle: () =>
                                  authViewModel.signInWithGoogle(),
                              onContinueWithLogin: () => context.pop(),
                              isLoading: false,
                            ),
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void listeners(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(
      authViewViewModelProvider,
      (previousState, currentState) {
        switch (currentState) {
          // case AuthStateAuthenticated(:final user):
          case AuthStateAuthenticated():
            // ref.read(appStartupProvider.notifier).refresh();
            context.pop();
            return;
          case AuthStateError(:final error):
            {
              context.showSnackBar(
                type: DialogType.error,
                error,
              );
            }
            break;
        }
      },
    );
  }
}
