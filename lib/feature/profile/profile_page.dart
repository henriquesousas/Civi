import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/feature/about/about_exports.dart';
import 'package:deehelp/feature/faq/export_faq.dart';
import 'package:deehelp/feature/items/items_router.dart';
import 'profile_item.dart';
import 'widgets/account_card.dart';
import 'widgets/profile_options.dart';
import 'widgets/title_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
          const AccountCard(),
          const SizedBox(height: SpacingSize.lg),
          ProfileOptions(
            items: [
              ProfileItem(
                icon: Icons.report_outlined,
                title: 'Minhas ocorrências',
                subtitle: 'Histórico de registros feitos por você',
                press: () => debugPrint('Minhas ocorrências'),
              ),
              ProfileItem(
                icon: Icons.inventory_2_outlined,
                title: 'Meus itens',
                subtitle: 'Itens vinculados ao seu perfil',
                press: () => context.push(ItemsRouter.list),
              ),
            ],
            // press: (key) {
            //   debugPrint('Pressed item index: $key');
            // },
          ),
          const SizedBox(height: SpacingSize.lg),
          const TitleSection(title: 'Explorar'),
          ProfileOptions(
            items: [
              const ProfileItem(
                icon: Icons.search_rounded,
                title: 'Consultar incidentes',
                subtitle: 'Pesquise ocorrências registradas',
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
          const ProfileOptions(
            items: [
              ProfileItem(
                icon: Icons.dark_mode_outlined,
                title: 'Modo escuro',
                trailing: Switch(value: false, onChanged: null),
              ),
              ProfileItem(
                icon: Icons.star_border_rounded,
                title: 'Avaliar o app',
                subtitle: 'Ajude-nos a melhorar',
                badge: 'Novo',
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
              const ProfileItem(
                icon: Icons.support_agent_rounded,
                title: 'Fale conosco',
                subtitle: 'Tire dúvidas ou envie sugestões',
              ),
              ProfileItem(
                icon: Icons.logout_rounded,
                title: 'Sair',
                isDestructive: true,
                press: () {
                  // showDialog(
                  //   context: context,
                  //   builder: (_) => AlertDialog(
                  //     title: const Text('Sair da conta'),
                  //     content: const Text(
                  //       'Tem certeza de que deseja sair da sua conta?\n'
                  //       'Você poderá entrar novamente quando quiser.',
                  //     ),
                  //     actions: [
                  //       TextButton(
                  //         onPressed: () => Navigator.pop(context),
                  //         child: const Text('Cancelar'),
                  //       ),
                  //       TextButton(
                  //         onPressed: () {},
                  //         child: const Text('Sair'),
                  //       ),
                  //     ],
                  //   ),
                  // );
                  showLogoutDialog(context);
                },
              ),
            ],
          ),
          const SizedBox(height: SpacingSize.lg),
        ],
      ),
    );
  }

  Future<bool?> showLogoutDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const _LogoutDialog(),
    );
  }
}

class _LogoutDialog extends StatelessWidget {
  const _LogoutDialog();

  static const _primary = Color(0xFF2157F8);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _danger = Color(0xFFE53935);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Ícone
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: _danger.withOpacity(0.12),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Icon(
                Icons.logout_rounded,
                color: _danger,
                size: 28,
              ),
            ),

            const SizedBox(height: 16),

            // Título
            const Text(
              'Sair da conta',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: _ink,
              ),
            ),

            const SizedBox(height: 10),

            // Mensagem
            const Text(
              'Tem certeza que deseja sair do Kotto?\n'
              'Você poderá entrar novamente quando quiser.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                height: 1.4,
                fontWeight: FontWeight.w600,
                color: _muted,
              ),
            ),

            const SizedBox(height: 24),

            // Ações
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context, false),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _ink,
                      side: const BorderSide(color: Color(0xFFE6EAF6)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _danger,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Sair',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
