import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/styles/app_text_style.dart';
import 'package:deehelp/feature/auth/presentation/widgets/auth_view.dart';
import 'package:deehelp/ui/auth/auth_state.dart';
import 'package:deehelp/ui/auth/auth_notifier_provider.dart';
import 'package:deehelp/old_core/extension/dialog_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'widgets/auth_logo.dart';
import 'package:flutter/material.dart';

class AuthPageV2 extends ConsumerWidget {
  const AuthPageV2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(authNotifierProvider.notifier);

    listeners(context, ref);

    return Scaffold(
      // backgroundColor: context.primaryColor,
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // const BubbleBackground(),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LogoBlock(),
                      const SizedBox(height: SpacingSize.lg),
                      ref.watch(authNotifierProvider).maybeWhen(
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
      authNotifierProvider,
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
    final authViewModel = ref.watch(authNotifierProvider.notifier);
    final authState = ref.watch(authNotifierProvider);

    listeners(context, ref);

    // const background = Color(0xFF070B16);
    final borderColor = Colors.white.withValues(alpha: 0.08);
    // final cardColor = Colors.white.withValues(alpha: 0.06);
    // final softColor = Colors.white.withValues(alpha: 0.04);
    // final secondaryText = Colors.white.withValues(alpha: 0.72);

    return Scaffold(
      // backgroundColor: background,
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 12),
                    const LogoBlock(),
                    const SizedBox(height: 18),
                    Text(
                      'Entre para continuar',
                      textAlign: TextAlign.center,
                      style: context.appTextOld.headerlg.copyWith(
                        color: context.primaryTextColor,
                        fontWeight: FontWeight.w800,
                        height: 1.05,
                        letterSpacing: -0.4,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Acesse sua conta para acompanhar seus itens, ocorrências e alertas da sua região.',
                      textAlign: TextAlign.center,
                      style: context.appTextOld.bodySmall.copyWith(
                        color: context.secondaryTextColor,
                        height: 1.45,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: context.percentWidth(0.9),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        // color: cardColor,
                        color: context.primaryBgCard,
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
                              // color: softColor,
                              // color: context.outline,
                              color: AppColors.grey.withValues(alpha: 0.09),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                // color: Colors.white.withValues(alpha: 0.05),
                                color: context.outlineVariantColor
                                    .withValues(alpha: 0.2),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 36.w,
                                  height: 36.h,
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
                                        style: context.appTextOld.body.copyWith(
                                          color: context.primaryTextColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Faça login para gerenciar seus itens e receber uma experiência mais completa no app.',
                                        style: context.appTextOld.bodySmall
                                            .copyWith(
                                          color: context.secondaryTextColor,
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
                      style: context.appTextOld.caption.copyWith(
                        color: context.secondaryTextColor,
                        height: 1.45,
                      ),
                    ),
                  ],
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
      authNotifierProvider,
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
