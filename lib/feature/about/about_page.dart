import 'package:deehelp/app_name.dart';
import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/feature/auth/presentation/auth_router.dart';
import 'widgets/blue_header_bubles.dart';
import 'widgets/engagament_card.dart';
import 'widgets/header.dart';
import 'widgets/how_its_work_card.dart';
import 'widgets/info_card.dart';
import 'widgets/welcome_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BlueHeaderBubbles(),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: SpacingSize.lg),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: SpacingSize.lg),
                  child: Header(
                    onSkip: () => context.pop(),
                  ),
                ),
                const SizedBox(height: SpacingSize.md),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
                    children: [
                      const WelcomeCard(),
                      const SizedBox(height: SpacingSize.md),
                      InfoCard(
                        title: 'Por que criamos o ${AppName.appName}?',
                        icon: Icons.shield_outlined,
                        child: Text(
                          'Criamos o ${AppName.appName} para ajudar pessoas a entenderem melhor o nível de risco '
                          'na região onde vivem e a reagirem mais rápido quando algo acontece.\n\n'
                          'A informação vem da comunidade: quanto mais gente usando, mais útil e preciso fica.',
                          style: context.appText.bodySmall.copyWith(
                            height: 1.35,
                            color: context.onSurface,
                          ),
                        ),
                      ),
                      const SizedBox(height: SpacingSize.md),
                      const HowItWorksCard(),
                      const SizedBox(height: SpacingSize.md),
                      EngagementCard(
                        onShare: () {},
                      ),
                      const SizedBox(height: SpacingSize.md)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(SpacingSize.md),
                  child: ButtonPrimary(
                    press: () => context.push(AuthRouter.path),
                    text: 'Entrar com minha conta',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
