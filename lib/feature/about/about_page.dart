import 'package:deehelp/app_name.dart';
import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/styles/export_style.dart';
import 'package:deehelp/old_core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/old_core/utils/url_launcher_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'widgets/engagament_card.dart';
import 'widgets/how_its_work_card.dart';
import 'widgets/info_card.dart';
import 'widgets/welcome_card.dart';
import 'package:flutter/material.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // backgroundColor: Color(0XFFf8fafc),
      appBar: DefaultAppBar(
        title: 'Sobre o ${AppName.appName} ',
        press: () => context.pop(),
        showBackButton: true,
      ),
      body: Stack(
        children: [
          // const BlueHeaderBubbles(),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: SpacingSize.lg),
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: SpacingSize.lg),
                //   child: Header(
                //     onSkip: () => context.pop(),
                //   ),
                // ),
                // const SizedBox(height: SpacingSize.md),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
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
                          style: context.appTextOld.bodySmall.copyWith(
                            height: 1.35,
                            color: context.secondaryTextColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: SpacingSize.md),
                      const HowItWorksCard(),
                      const SizedBox(height: SpacingSize.md),
                      EngagementCard(
                        onShare: () => UrlLauncherUtils.shareApp(context),
                      ),
                      const SizedBox(height: SpacingSize.md)
                    ],
                  ),
                ),
                // Visibility(
                //   visible: ref.watch(authenticatedUserProvider) == null
                //       ? true
                //       : false,
                //   child: Padding(
                //     padding: const EdgeInsets.all(SpacingSize.md),
                //     child: ButtonPrimary(
                //       press: () => context.push(AuthRouter.path),
                //       text: 'Entrar com minha conta',
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
