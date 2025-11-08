import 'package:deehelp/core/components/ui_app_bar.dart';
import 'package:deehelp/features/settings/components/action_tile.dart';
import 'package:deehelp/features/settings/components/settings_content_section.dart';
import 'package:deehelp/shared/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/router_constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIAppBar(title: context.strings.settings),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(24),
        child: Column(
          spacing: 20,
          children: [
            SettingsContentSection(
              title: context.strings.policyAndTerms,
              icon: Icons.security_outlined,
              children: [
                ActionTile(
                  title: context.strings.privatePolicy,
                  subtitle: context.strings.readOurPolicy,
                  icon: Icons.policy_outlined,
                  onTap: () => context.push(RouterConstant.privacyPolicy),
                ),
                ActionTile(
                  title: context.strings.useTerm,
                  subtitle: context.strings.readOurTerms,
                  icon: Icons.description_outlined,
                  onTap: () => context.push(RouterConstant.terms),
                ),
              ],
            ),
            // SettingsContentSection(
            //   title: context.strings.preferences,
            //   icon: Icons.tune_outlined,
            //   children: [
            //     SwitchTile(
            //       title: context.strings.darkMode,
            //       subtitle: context.strings.darkModeRead,
            //       value: true,
            //       onChanged: (p0) {},
            //     ),
            //   ],
            // ),
            SettingsContentSection(
              title: context.strings.about,
              icon: Icons.help_outline,
              children: [
                ActionTile(
                  title: context.strings.helpCenter,
                  subtitle: context.strings.helpCenterRead,
                  icon: Icons.help_center_outlined,
                  onTap: () {},
                ),
                ActionTile(
                  title: context.strings.contactUs,
                  subtitle: context.strings.contactUsRead,
                  icon: Icons.contact_support_outlined,
                  onTap: () {},
                ),
                ActionTile(
                  title: context.strings.rateApp,
                  subtitle: context.strings.rateAppRead,
                  icon: Icons.star_outline,
                  onTap: () {},
                ),
                ActionTile(
                  title: context.strings.frequentlyAsk,
                  subtitle: context.strings.frequentlyAskRead,
                  icon: Icons.quiz_outlined,
                  onTap: () => context.push(RouterConstant.faq),
                ),
                ActionTile(
                  title: context.strings.about,
                  subtitle: context.strings.aboutRead,
                  icon: Icons.info_outline,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
