import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/utils/navigation_utils.dart';
import 'package:deehelp/feature/about/about_exports.dart';
import 'package:deehelp/feature/faq/export_faq.dart';
import 'package:deehelp/feature/incidents/incident_router.dart';
import 'package:deehelp/feature/profile/widgets/logout_dialog.dart';
import 'package:deehelp/feature/profile/widgets/title_section.dart';
import 'package:deehelp/feature/search/search_args.dart';
import 'package:deehelp/feature/search/search_router.dart';
import 'package:deehelp/feature/sos/sos_router.dart';
import 'package:deehelp/core/utils/url_launcher_utils.dart';
import 'package:deehelp/module/auth/external/di/authenticated_user_provider.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/extensions/text_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/feature/product/product_router.dart';
import 'package:deehelp/v2/feature/profile/profile/text_ripple.dart';
import 'package:deehelp/v2/feature/profile/profile/widgets/profile_header.dart';
import 'package:deehelp/v2/feature/profile/profile/widgets/profile_premium_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'profile_item.dart';
import 'widgets/profile_options.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(authenticatedUserProvider);
    // final authViewModel = ref.watch(authViewViewModelProvider.notifier);
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
          // if (session != null) ...[
          //   Column(
          //     children: [
          //       ProfileImageWithUploadButtonWidget(
          //         width: ImageSize.md,
          //         height: ImageSize.md,
          //         radius: 999,
          //         showBoxShadow: false,
          //         border: BoxBorder.all(
          //           // color: const Color(0xFFFF8A00),
          //           color: AppColors.primaryColor,
          //           width: 2,
          //         ),
          //         imageUrl: session.photoUrl ?? '',
          //         imageAlt: session.name,
          //         showUploadIcon: false,
          //       ),
          //       Text(
          //         session.name,
          //         style: context.appTextOld.headerlg,
          //       ),
          //       const SizedBox(height: SpacingSize.xxs),
          //       Text(
          //         session.email,
          //         style: context.appTextOld.bodySmall.copyWith(
          //           fontWeight: FontWeight.w400,
          //           color: context.secondaryTextColor,
          //         ),
          //       ),
          //     ],
          //   ),
          // ] else ...[
          //   // const NotAuthenticatedCard()
          //   Column(
          //     spacing: 10,
          //     children: [
          //       ButtonProfile(onTap: () {}),
          //       const SizedBox(height: 10),
          //       ButtonOutline(
          //         width: context.percentWidth(0.5),
          //         press: () => context.push(AuthRouter.path),
          //         textColor:
          //             context.isDark() ? Colors.white : AppColors.primaryColor,
          //         borderColor:
          //             context.isDark() ? Colors.white : AppColors.primaryColor,
          //         text: "Fazer login",
          //       )
          //     ],
          //   ),
          // ],
          const ProfileHeader(),
          const SizedBox(height: SizeSpacing.l),
          const ProfilePremiumCard(),
          const SizedBox(height: SizeSpacing.l),
          ProfileOptions(
            items: [
              ProfileItem(
                icon: CupertinoIcons.cube_box,
                title: 'Meus itens',
                subtitle: 'Itens vinculados ao seu perfil',
                press: () => context.push(ProductRouter.listProduct),
                // press: () => context.push(
                //   NavigationUtils.path(
                //     ItemsRouter.list,
                //     session,
                //   ),
                //   extra: const ItemListRouteArgs(
                //     showBackButton: true,
                //   ),
                // ),
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
          const SizedBox(height: SizeSpacing.l),
          const TitleSection(title: 'Explorar'),
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
          // ProfileItem(
          //     //   icon: Icons.dark_mode_outlined,
          //     //   title: 'Modo escuro',
          //     //   trailing: Switch(
          //     //     value: ref.watch(themeProvider).isDarkMode,
          //     //     onChanged: (value) async {
          //     //       ref.watch(themeProvider.notifier).toggleTheme();
          //     //       // await MonitorSettingsController().setMonitoring(true);
          //     //     },
          //     //   ),
          //     // ),
          const SizedBox(height: SizeSpacing.l),
          const TitleSection(title: 'Sistema'),
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
          const SizedBox(height: SizeSpacing.l),
          Column(
            spacing: 15,
            children: [
              TextRipple(text: "Termos de uso".toUpperCase()),
              TextRipple(text: "Política de privacidade".toUpperCase()),
              TextRipple(text: "Sair".toUpperCase()),
              const SizedBox(height: SizeSpacing.l),
            ],
          )
        ],
      ),
    );
  }
}

class UIButtonLogout extends StatelessWidget {
  const UIButtonLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: SizeLayoutSpacing.m),
      width: double.infinity,
      height: 35.h,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4D0912),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: const BorderSide(
              color: Colors.red,
              width: 1.6,
            ),
          ),
        ),
        onPressed: () {
          showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (_) => LogoutDialog(
              press: () {
                // authViewModel.signOut();
                // context.pop();
              },
            ),
          );
        },
        icon: const Icon(
          CupertinoIcons.square_arrow_right,
          color: Colors.red,
          size: SizeIcon.m,
        ),
        label: Text(
          'Sair',
          style: context.appText.subtitle.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
