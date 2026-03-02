import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/utils/navigation_utils.dart';
import 'package:deehelp/feature/about/about_exports.dart';
import 'package:deehelp/feature/faq/export_faq.dart';
import 'package:deehelp/feature/incidents/incident_router.dart';
import 'package:deehelp/feature/items/items_router.dart';
import 'package:deehelp/feature/profile/item_list_router_args.dart';
import 'package:deehelp/feature/profile/widgets/logout_dialog.dart';
import 'package:deehelp/feature/profile/widgets/not_authenticated_card.dart';
import 'package:deehelp/feature/search/search_args.dart';
import 'package:deehelp/feature/search/search_router.dart';
import 'package:deehelp/feature/sos/sos_router.dart';
import 'package:deehelp/module/auth/external/di/auth_view_model_provider.dart';
import 'package:deehelp/module/auth/external/di/authenticated_user_provider.dart';
import 'package:deehelp/old_core/utils/url_launcher_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'profile_item.dart';
import 'widgets/account_card.dart';
import 'widgets/profile_options.dart';
import 'widgets/title_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(authenticatedUserProvider);
    final authViewModel = ref.watch(authViewViewModelProvider.notifier);
    // final session = null;
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Perfil',
        press: () => context.pop(),
      ),
      body: ListView(
        padding:
            const EdgeInsets.symmetric(vertical: LayoutSpacingSize.listItem),
        children: [
          const TitleSection(title: 'Conta'),
          if (session != null) ...[
            AccountCard(
              name: session.name,
              email: session.email,
              imageUrl: session.photoUrl,
            ),
          ] else ...[
            const NotAuthenticatedCard()
          ],
          ProfileOptions(
            items: [
              ProfileItem(
                icon: Icons.inventory_2_outlined,
                title: 'Meus itens',
                subtitle: 'Itens vinculados ao seu perfil',
                press: () => context.push(
                  NavigationUtils.path(
                    ItemsRouter.list,
                    session,
                  ),
                  extra: const ItemListRouteArgs(
                    showBackButton: true,
                  ),
                ),
              ),
              ProfileItem(
                icon: Icons.report_outlined,
                title: 'Minhas ocorrências',
                subtitle: 'Histórico de registros feitos por você',
                press: () => context.push(
                  NavigationUtils.path(IncidentRouter.list, session),
                ),
              ),
            ],
          ),
          const SizedBox(height: SpacingSize.lg),
          const TitleSection(title: 'Explorar'),
          ProfileOptions(
            items: [
              ProfileItem(
                icon: Icons.search_rounded,
                title: 'Consultar',
                subtitle: 'Pesquise ocorrências registradas',
                press: () => context.push(
                  SearchRouter.search,
                  extra: SearchArgs(showBackButton: true),
                ),
              ),
              ProfileItem(
                icon: Icons.sos,
                title: 'Emergência',
                subtitle: 'Telefones de emergência',
                press: () => context.push(SOSRouter.path),
              ),
              ProfileItem(
                icon: Icons.help_outline,
                title: 'Perguntas frequentes',
                press: () => context.push(FaqPageRouter.path),
              ),
              ProfileItem(
                icon: Icons.info_outline_rounded,
                title: 'Quem somos',
                subtitle: 'Conheça mais sobre o app',
                press: () => context.push(AboutRouter.path),
              ),
            ],
          ),
          const SizedBox(height: SpacingSize.lg),
          const TitleSection(title: 'Preferências'),
          ProfileOptions(
            items: [
              // ProfileItem(
              //   icon: Icons.dark_mode_outlined,
              //   title: 'Modo escuro',
              //   trailing: Switch(value: false, onChanged: null),
              // ),
              ProfileItem(
                icon: Icons.star_border_rounded,
                title: 'Avaliar o app',
                subtitle: 'Ajude-nos a melhorar',
                badge: 'Novo',
                press: () => UrlLauncherUtils.launchAppStorePage(
                    context, "com.radardoroubo.br.radar_do_roubo", "br.com"),
              ),
            ],
          ),
          const SizedBox(height: SpacingSize.lg),
          const TitleSection(title: 'Mídias socias'),
          const ProfileOptions(
            items: [
              ProfileItem(
                icon: Icons.facebook_outlined,
                title: 'Facebook',
                subtitle: 'Acompanhe as ocorrências da sua região',
              ),
              ProfileItem(
                icon: Icons.mic_external_off,
                title: 'Instagram',
                subtitle: 'Fique por dentro dos alertas e atualizações',
                isInstragram: true,
              ),
            ],
          ),
          const SizedBox(height: SpacingSize.lg),
          const TitleSection(title: 'Sistema'),
          ProfileOptions(
            items: [
              const ProfileItem(
                icon: Icons.info_outline,
                title: 'Versão do app',
                subtitle: '1.0.0',
                hideChevron: true,
              ),
              ProfileItem(
                icon: Icons.support_agent_rounded,
                title: 'Fale conosco',
                subtitle: 'Tire dúvidas ou envie sugestões',
                press: () =>
                    UrlLauncherUtils.launchWhatsAppSupport(context: context),
              ),
              if (session != null) ...[
                ProfileItem(
                  icon: Icons.logout_rounded,
                  title: 'Sair',
                  isDestructive: true,
                  press: () {
                    showDialog<bool>(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => LogoutDialog(
                        press: () {
                          authViewModel.signOut();
                          context.pop();
                        },
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
          const SizedBox(height: SpacingSize.lg),
        ],
      ),
    );
  }
}
