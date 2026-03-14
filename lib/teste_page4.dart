import 'package:flutter/material.dart';

class TesteProfile extends StatelessWidget {
  const TesteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FD),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          'Perfil',
          style: TextStyle(
            color: Color(0xFF1F2A44),
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF1F2A44)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: const [
          _Section(title: 'Conta'),
          _AccountCard(),
          SizedBox(height: 16),
          _ProfileOptions(
            items: [
              ProfileItem(
                icon: Icons.report_outlined,
                title: 'Minhas ocorrências',
                subtitle: 'Histórico de registros feitos por você',
              ),
              ProfileItem(
                icon: Icons.inventory_2_outlined,
                title: 'Meus itens',
                subtitle: 'Itens vinculados ao seu perfil',
              ),
            ],
          ),
          SizedBox(height: 24),
          _Section(title: 'Explorar'),
          _ProfileOptions(
            items: [
              ProfileItem(
                icon: Icons.search_rounded,
                title: 'Consultar incidentes',
                subtitle: 'Pesquise ocorrências registradas',
              ),
              ProfileItem(
                icon: Icons.help_outline,
                title: 'Perguntas frequentes',
              ),
            ],
          ),
          SizedBox(height: 24),
          _Section(title: 'Preferências'),
          _ProfileOptions(
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
          SizedBox(height: 24),
          _Section(title: 'Sistema'),
          _ProfileOptions(
            items: [
              ProfileItem(
                icon: Icons.info_outline,
                title: 'Versão do app',
                subtitle: '1.0.0',
                hideChevron: true,
              ),
              ProfileItem(
                icon: Icons.logout_rounded,
                title: 'Sair',
                isDestructive: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AccountCard extends StatelessWidget {
  const _AccountCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFF2B5BEE), Color(0xFF5F85FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                child: Text(
                  'JD',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'João da Silva',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2A44),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'joao@email.com',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6B7AAE),
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFF8A96C8)),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;

  const _Section({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color(0xFF8A96C8),
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class ProfileItem {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final String? badge;
  final bool isDestructive;
  final bool hideChevron;

  const ProfileItem({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.badge,
    this.isDestructive = false,
    this.hideChevron = false,
  });
}

class _ProfileOptions extends StatelessWidget {
  final List<ProfileItem> items;

  const _ProfileOptions({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: items
            .asMap()
            .entries
            .map(
              (entry) => Column(
                children: [
                  _ProfileTile(item: entry.value),
                  if (entry.key != items.length - 1)
                    const Divider(
                      height: 1,
                      indent: 72,
                      color: Color(0xFFE6EAF6),
                    ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final ProfileItem item;

  const _ProfileTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final baseColor =
        item.isDestructive ? Colors.redAccent : const Color(0xFF1F2A44);

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: const Color(0xFF2B5BEE).withOpacity(0.06),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: baseColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(item.icon, color: baseColor, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: baseColor,
                        ),
                      ),
                      if (item.badge != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2B5BEE),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            item.badge!,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (item.subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      item.subtitle!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF8A96C8),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            item.trailing ??
                (item.hideChevron
                    ? const SizedBox.shrink()
                    : const Icon(Icons.chevron_right,
                        color: Color(0xFF8A96C8))),
          ],
        ),
      ),
    );
  }
}
