import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/ui/auth/auth_notifier_provider.dart';
import 'package:deehelp/ui/auth/auth_state.dart';
import 'package:deehelp/ui/auth/_shared/error_dialog.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/widgets/buttons/export_buttons.dart';
import 'package:deehelp/ui/auth/widgets/floating_tag.dart';
import 'package:deehelp/ui/auth/widgets/login_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  @override
  ConsumerState<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.watch(authNotifierProvider.notifier);
    final authState = ref.watch(authNotifierProvider);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              child: Image.network(
                'https://images.unsplash.com/photo-1519501025264-65ba15a82390?auto=format&fit=crop&w=1400&q=80',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 150.h,
              left: 28,
              child: const FloatingTag(
                text: '200M de você',
                lineHeight: 70,
              ),
            ),
            Positioned(
              top: 220.h,
              left: context.percentWidth(0.35),
              child: const FloatingTag(
                text: 'Atividade suspeita',
                lineHeight: 92,
              ),
            ),
            Positioned(
              top: 100.h,
              right: 28,
              child: const FloatingTag(
                text: 'Roubo registrado',
                lineHeight: 58,
                lineToRight: true,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x22000000),
                      Color(0x44000000),
                      Color(0xEE0D0D11),
                      Color(0xFF0D0D11),
                    ],
                    stops: [0.0, 0.35, 0.68, 1.0],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SizeLayoutSpacing.l,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: SizeSpacing.l),
                    Text(
                      'Civi',
                      style: context.appText.header.copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1,
                      ),
                    ),
                    const Spacer(),
                    const Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        LoginChip(text: 'Alertas'),
                        LoginChip(text: 'Mapa'),
                        LoginChip(text: 'Ao vivo'),
                      ],
                    ),
                    const SizedBox(height: SizeSpacing.xl),
                    Text(
                      'Saiba o que está\nacontecendo agora\nperto de você',
                      style: context.appText.header.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: SizeSpacing.l),
                    Text(
                      'Acompanhe roubos, assaltos e movimentações suspeitas em tempo real na sua cidade.',
                      style: context.appText.subtitle.copyWith(
                        color: context.themeColor.secundaryTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: SizeSpacing.xl),
                    UIButtonPrimary(
                      press: () => authNotifier.signInWithGoogle(),
                      loading: authState.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      ),
                      text: "Login com o Google",
                      textColor: Colors.white,
                      backgroundColor: AppColor.primaryColor,
                    ),
                    const SizedBox(height: SizeSpacing.xs),
                    Center(
                      child: TextButton(
                        onPressed: () => AppDialog.show(
                          context,
                          type: DialogType.success,
                          message: "Falha ao realizar o login",
                        ),
                        child: const Text(
                          "Continuar sem login",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.04),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
