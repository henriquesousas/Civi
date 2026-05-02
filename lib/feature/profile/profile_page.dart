import 'package:deehelp/core/extension/exports_extension.dart';
// import 'package:deehelp/core/theme/export_theme.dart';
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
import 'package:deehelp/module/auth/external/di/auth_view_model_provider.dart';
import 'package:deehelp/core/utils/url_launcher_utils.dart';
import 'package:deehelp/module/auth/external/di/authenticated_user_provider.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/extensions/text_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/theme/size_icon.dart';
import 'package:deehelp/v2/core/theme/size_layout_spacing.dart';
import 'package:deehelp/v2/feature/login/login_router.dart';
import 'package:deehelp/v2/feature/product/product_router.dart';
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
          const _ProfileHeader(),
          const SizedBox(height: SizeSpacing.l),
          //TOOD: Refatorar esse widget
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: SizeLayoutSpacing.m),
          //   padding: const EdgeInsets.all(14),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(22),
          //     border: Border.all(
          //       color: Colors.white.withOpacity(.06),
          //     ),
          //     gradient: const LinearGradient(
          //       begin: Alignment.topLeft,
          //       end: Alignment.bottomRight,
          //       colors: [
          //         Color(0xFF111827),
          //         Color(0xFF0B1220),
          //         Colors.black,
          //       ],
          //     ),
          //   ),
          //   child: Row(
          //     children: [
          //       Container(
          //         width: 52,
          //         height: 52,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(16),
          //           border: Border.all(
          //             color: Color(0xFF6B8DFF),
          //           ),
          //         ),
          //         child: const Icon(
          //           CupertinoIcons.sparkles,
          //           color: Color(0xFF7DA2FF),
          //           size: 24,
          //         ),
          //       ),
          //       const SizedBox(width: 14),
          //       const Expanded(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               'Upgrade to Premium',
          //               style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 20,
          //                 fontWeight: FontWeight.w700,
          //               ),
          //             ),
          //             SizedBox(height: 2),
          //             Text(
          //               'Gain access to all of Citizen.',
          //               style: TextStyle(
          //                 color: Colors.white70,
          //                 fontSize: 14,
          //               ),
          //             ),
          //             SizedBox(height: 6),
          //             Text(
          //               'Learn More',
          //               style: TextStyle(
          //                 color: Color(0xFF6C8FFF),
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.w600,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
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
          //Refatorar esse widget
          Column(
            spacing: 15,
            children: [
              InkWell(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Termos de uso".toUpperCase(),
                    style: context.appText.caption.copyWith(
                      fontWeight: FontWeight.w500,
                      color: context.themeColor.secundaryTextColor,
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    // ação
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 6,
                    ),
                    child: Text(
                      "Política de privacidade".toUpperCase(),
                      style: context.appText.caption.copyWith(
                        fontWeight: FontWeight.w500,
                        color: context.themeColor.secundaryTextColor,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "Sair".toUpperCase(),
                style: context.appText.caption.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.themeColor.secundaryTextColor,
                ),
              ),
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

//TODO: Refatorar esse widget
class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(LoginRouter.path),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: SizeLayoutSpacing.m),
        child: const Column(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: Color(0xFFDDE6D1),
              child: Icon(
                Icons.person,
                color: Color(0xFF252A20),
                size: 32,
              ),
            ),
            SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Paulo Soares',
                  style: TextStyle(
                    color: Color(0xFFF4F6F0),
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'paulo@email.com',
                  style: TextStyle(
                    color: Color(0xFF9EA69A),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(
            //     Icons.edit_outlined,
            //     color: Color(0xFFE7EDE1),
            //     size: 20,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
