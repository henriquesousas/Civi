import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/avatar/profile_image_with_upload_button_widget.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/core/utils/navigation_utils.dart';
import 'package:deehelp/feature/about/about_exports.dart';
import 'package:deehelp/feature/auth/presentation/auth_router.dart';
import 'package:deehelp/feature/faq/export_faq.dart';
import 'package:deehelp/feature/incidents/incident_router.dart';
import 'package:deehelp/feature/items/items_router.dart';
import 'package:deehelp/feature/profile/item_list_router_args.dart';
import 'package:deehelp/feature/profile/widgets/logout_dialog.dart';
import 'package:deehelp/feature/search/search_args.dart';
import 'package:deehelp/feature/search/search_router.dart';
import 'package:deehelp/feature/sos/sos_router.dart';
import 'package:deehelp/module/auth/external/di/auth_view_model_provider.dart';
import 'package:deehelp/core/utils/url_launcher_utils.dart';
import 'package:deehelp/module/auth/external/di/authenticated_user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'profile_item.dart';
import 'widgets/profile_options.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(authenticatedUserProvider);
    final authViewModel = ref.watch(authViewViewModelProvider.notifier);
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: DefaultAppBar(
        title: 'Perfil',
        press: () => context.pop(),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          if (session != null) ...[
            Column(
              children: [
                ProfileImageWithUploadButtonWidget(
                  width: ImageSize.md,
                  height: ImageSize.md,
                  radius: 999,
                  showBoxShadow: false,
                  border: BoxBorder.all(
                    // color: const Color(0xFFFF8A00),
                    color: AppColors.primaryColor,
                    width: 2,
                  ),
                  imageUrl: session.photoUrl ?? '',
                  imageAlt: session.name,
                  showUploadIcon: false,
                ),
                Text(
                  session.name,
                  style: context.appText.headerlg,
                ),
                const SizedBox(height: SpacingSize.xxs),
                Text(
                  session.email,
                  style: context.appText.bodySmall.copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ] else ...[
            // const NotAuthenticatedCard()
            Column(
              spacing: 10,
              children: [
                ButtonProfile(onTap: () {}),
                ButtonOutline(
                  width: context.percentWidth(0.5),
                  press: () => context.push(AuthRouter.path),
                  text: "Fazer login",
                )
              ],
            ),
          ],
          const SizedBox(height: SpacingSize.lg),
          ProfileOptions(
            items: [
              ProfileItem(
                icon: CupertinoIcons.cube_box,
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
                icon: CupertinoIcons.doc_text,
                title: 'Minhas ocorrências',
                subtitle: 'Histórico de registros feitos por você',
                press: () => context.push(
                  NavigationUtils.path(IncidentRouter.list, session),
                ),
              ),
            ],
          ),
          const SizedBox(height: SpacingSize.lg),
          // const TitleSection(title: 'Explorar'),
          ProfileOptions(
            items: [
              ProfileItem(
                icon: CupertinoIcons.search,
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
                icon: CupertinoIcons.question_circle,
                title: 'Perguntas frequentes',
                press: () => context.push(FaqPageRouter.path),
              ),
              ProfileItem(
                icon: CupertinoIcons.info,
                title: 'Quem somos',
                subtitle: 'Conheça mais sobre o app',
                press: () => context.push(AboutRouter.path),
              ),
            ],
          ),
          const SizedBox(height: SpacingSize.lg),
          // const TitleSection(title: 'Preferências'),
          ProfileOptions(
            items: [
              const ProfileItem(
                icon: Icons.dark_mode_outlined,
                title: 'Modo escuro',
                trailing: Switch(value: false, onChanged: null),
              ),
              ProfileItem(
                icon: CupertinoIcons.star_circle,
                title: 'Avaliar o app',
                subtitle: 'Ajude-nos a melhorar',
                badge: 'Novo',
                press: () => UrlLauncherUtils.launchAppStorePage(
                  context,
                  "br.com.atomos.deehelp",
                  "br.com.atomos.deehelp",
                ),
              ),
            ],
          ),
          const SizedBox(height: SpacingSize.lg),
          // const TitleSection(title: 'Mídias socias'),
          // const ProfileOptions(
          //   items: [
          //     ProfileItem(
          //       icon: Icons.facebook_outlined,
          //       title: 'Facebook',
          //       subtitle: 'Acompanhe as ocorrências da sua região',
          //     ),
          //     ProfileItem(
          //       icon: Icons.mic_external_off,
          //       title: 'Instagram',
          //       subtitle: 'Fique por dentro dos alertas e atualizações',
          //       isInstragram: true,
          //     ),
          //   ],
          // ),
          // const SizedBox(height: SpacingSize.lg),
          // const TitleSection(title: 'Sistema'),
          ProfileOptions(
            items: [
              const ProfileItem(
                icon: CupertinoIcons.info_circle_fill,
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
