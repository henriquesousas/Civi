import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/feature/auth/presentation/widgets/auth_view.dart';
import 'package:deehelp/feature/auth/viemodel/auth_state.dart';
import 'package:deehelp/module/auth/external/di/auth_view_model_provider.dart';
import 'package:deehelp/core/extension/dialog_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'widgets/auth_logo.dart';
import 'widgets/bubble_background.dart';
import 'package:flutter/material.dart';

class AuthPageV2 extends ConsumerWidget {
  const AuthPageV2({super.key});

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

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(authViewViewModelProvider.notifier);
    final authState = ref.watch(authViewViewModelProvider);

    listeners(context, ref);

    const background = Color(0xFF070B16);
    final borderColor = Colors.white.withValues(alpha: 0.08);
    final cardColor = Colors.white.withValues(alpha: 0.06);
    final softColor = Colors.white.withValues(alpha: 0.04);
    final secondaryText = Colors.white.withValues(alpha: 0.72);

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Stack(
          children: [
            // const BubbleBackground(),
            // Positioned(
            //   top: -120,
            //   left: -80,
            //   child: Container(
            //     width: 240,
            //     height: 240,
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: context.primaryColor.withValues(alpha: 0.12),
            //     ),
            //   ),
            // ),
            // Positioned(
            //   bottom: -140,
            //   right: -100,
            //   child: Container(
            //     width: 260,
            //     height: 260,
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: Colors.white.withValues(alpha: 0.03),
            //     ),
            //   ),
            // ),
            Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 460),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 12),
                      const LogoBlock(),
                      const SizedBox(height: 18),
                      Text(
                        'Entre para continuar',
                        textAlign: TextAlign.center,
                        style: context.appText.headerlg.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          height: 1.05,
                          letterSpacing: -0.4,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Acesse sua conta para acompanhar seus itens, ocorrências e alertas da sua região.',
                        textAlign: TextAlign.center,
                        style: context.appText.bodySmall.copyWith(
                          color: secondaryText,
                          height: 1.45,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(color: borderColor),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.22),
                              blurRadius: 32,
                              offset: const Offset(0, 18),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: softColor,
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.05),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 38,
                                    height: 38,
                                    decoration: BoxDecoration(
                                      color: context.primaryColor
                                          .withValues(alpha: 0.14),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: context.primaryColor
                                            .withValues(alpha: 0.22),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.shield_outlined,
                                      color: context.primaryColor,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Mais segurança para você',
                                          style: context.appText.body.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'Faça login para gerenciar seus itens e receber uma experiência mais completa no app.',
                                          style: context.appText.bodySmall
                                              .copyWith(
                                            color: secondaryText,
                                            height: 1.4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 18),
                            authState.maybeWhen(
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
                      const SizedBox(height: 18),
                      Text(
                        'Você pode continuar sem login e acessar o aplicativo depois.',
                        textAlign: TextAlign.center,
                        style: context.appText.caption.copyWith(
                          color: Colors.white.withValues(alpha: 0.58),
                          height: 1.45,
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
          case AuthStateAuthenticated():
            context.pop();
            return;
          case AuthStateError(:final error):
            context.showSnackBar(
              type: DialogType.error,
              error,
            );
            break;
        }
      },
    );
  }
}
