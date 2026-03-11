import 'package:flutter/material.dart';

class TestePage3 extends StatelessWidget {
  const TestePage3({super.key});

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF3F6FB);
    const textPrimary = Color(0xFF111827);
    const textSecondary = Color(0xFF6B7280);
    const blue = Color(0xFF2563EB);
    const border = Color(0xFFE5EAF3);

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _TopBar(),
                    SizedBox(height: 24),
                    _PremiumAccountHeader(),
                    SizedBox(height: 16),
                    _TrustCard(),
                    SizedBox(height: 28),
                    _SectionLabel('Conta'),
                    SizedBox(height: 12),
                    _SettingsCard(
                      items: [
                        ProfileItem(
                          icon: Icons.person_outline_rounded,
                          title: 'Dados pessoais',
                          subtitle: 'Nome, e-mail e informações da conta',
                        ),
                        ProfileItem(
                          icon: Icons.report_outlined,
                          title: 'Minhas ocorrências',
                          subtitle: 'Acompanhe seus registros e atualizações',
                        ),
                        ProfileItem(
                          icon: Icons.inventory_2_outlined,
                          title: 'Meus itens',
                          subtitle: 'Itens vinculados ao seu perfil',
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    _SectionLabel('Recursos'),
                    SizedBox(height: 12),
                    _SettingsCard(
                      items: [
                        ProfileItem(
                          icon: Icons.search_rounded,
                          title: 'Consultar incidentes',
                          subtitle: 'Pesquise ocorrências registradas',
                        ),
                        ProfileItem(
                          icon: Icons.notifications_none_rounded,
                          title: 'Notificações',
                          subtitle: 'Gerencie alertas e avisos do app',
                        ),
                        ProfileItem(
                          icon: Icons.help_outline_rounded,
                          title: 'Central de ajuda',
                          subtitle: 'Dúvidas frequentes e suporte',
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    _SectionLabel('Preferências'),
                    SizedBox(height: 12),
                    _SettingsCard(
                      items: [
                        ProfileItem(
                          icon: Icons.dark_mode_outlined,
                          title: 'Modo escuro',
                          subtitle: 'Ajuste a aparência do aplicativo',
                          trailing: _PremiumSwitch(value: false),
                        ),
                        ProfileItem(
                          icon: Icons.star_outline_rounded,
                          title: 'Avaliar aplicativo',
                          subtitle: 'Sua opinião ajuda a evoluir o produto',
                          badge: 'Novo',
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    _SectionLabel('Sistema'),
                    SizedBox(height: 12),
                    _SettingsCard(
                      items: [
                        ProfileItem(
                          icon: Icons.info_outline_rounded,
                          title: 'Versão do app',
                          subtitle: '1.0.0',
                          hideChevron: true,
                        ),
                        ProfileItem(
                          icon: Icons.logout_rounded,
                          title: 'Sair da conta',
                          subtitle: 'Encerrar sessão neste dispositivo',
                          isDestructive: true,
                        ),
                      ],
                    ),
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

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _CircleAction(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () {},
        ),
        const Spacer(),
        const Text(
          'Perfil',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color(0xFF111827),
          ),
        ),
        const Spacer(),
        _CircleAction(
          icon: Icons.settings_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}

class _CircleAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleAction({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFE8EDF5),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0A0F172A),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Icon(
            icon,
            size: 18,
            color: const Color(0xFF111827),
          ),
        ),
      ),
    );
  }
}

class _PremiumAccountHeader extends StatelessWidget {
  const _PremiumAccountHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(32),
        boxShadow: const [
          BoxShadow(
            color: Color(0x220F172A),
            blurRadius: 30,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 74,
                height: 74,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF3B82F6),
                      Color(0xFF60A5FA),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.18),
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'JD',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'João da Silva',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'joao@email.com',
                      style: TextStyle(
                        color: Color(0xFFB6C2D9),
                        fontSize: 13.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    _StatusPill(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _ActionButton(
                  icon: Icons.edit_outlined,
                  label: 'Editar perfil',
                  isPrimary: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ActionButton(
                  icon: Icons.shield_outlined,
                  label: 'Privacidade',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF152341),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.verified_rounded,
            size: 14,
            color: Color(0xFF60A5FA),
          ),
          SizedBox(width: 6),
          Text(
            'Conta verificada',
            style: TextStyle(
              color: Color(0xFFD9E4F8),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isPrimary;

  const _ActionButton({
    required this.icon,
    required this.label,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isPrimary ? Colors.white : Colors.white.withOpacity(0.06);
    final borderColor =
        isPrimary ? Colors.white : Colors.white.withOpacity(0.08);
    final textColor = isPrimary ? const Color(0xFF0F172A) : Colors.white;

    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: textColor),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _TrustCard extends StatelessWidget {
  const _TrustCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: const Color(0xFFE7ECF5),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0F172A),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: const Row(
        children: [
          _MiniMetric(
            value: '12',
            label: 'Ocorrências',
            icon: Icons.report_outlined,
          ),
          _DividerVertical(),
          _MiniMetric(
            value: '04',
            label: 'Itens',
            icon: Icons.inventory_2_outlined,
          ),
          _DividerVertical(),
          _MiniMetric(
            value: '98%',
            label: 'Confiabilidade',
            icon: Icons.shield_outlined,
          ),
        ],
      ),
    );
  }
}

class _MiniMetric extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;

  const _MiniMetric({
    required this.value,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF4FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 19,
              color: const Color(0xFF2563EB),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF6B7280),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _DividerVertical extends StatelessWidget {
  const _DividerVertical();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 62,
      color: const Color(0xFFE8EDF5),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;

  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: Color(0xFF94A3B8),
        letterSpacing: 0.4,
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

class _SettingsCard extends StatelessWidget {
  final List<ProfileItem> items;

  const _SettingsCard({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFE7ECF5)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0F172A),
            blurRadius: 22,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: items.asMap().entries.map((entry) {
          final item = entry.value;
          final isLast = entry.key == items.length - 1;

          return Column(
            children: [
              _PremiumTile(item: item),
              if (!isLast)
                const Padding(
                  padding: EdgeInsets.only(left: 72),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF0F3F8),
                  ),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _PremiumTile extends StatelessWidget {
  final ProfileItem item;

  const _PremiumTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final titleColor =
        item.isDestructive ? const Color(0xFFDC2626) : const Color(0xFF111827);

    final iconColor =
        item.isDestructive ? const Color(0xFFDC2626) : const Color(0xFF2563EB);

    final iconBg =
        item.isDestructive ? const Color(0xFFFEECEC) : const Color(0xFFEEF4FF);

    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                item.icon,
                size: 21,
                color: iconColor,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 15.5,
                            fontWeight: FontWeight.w700,
                            color: titleColor,
                          ),
                        ),
                      ),
                      if (item.badge != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2563EB),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            item.badge!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
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
                        height: 1.35,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),
            item.trailing ??
                (item.hideChevron
                    ? const SizedBox.shrink()
                    : Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.chevron_right_rounded,
                          color: Color(0xFF94A3B8),
                          size: 20,
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}

class _PremiumSwitch extends StatelessWidget {
  final bool value;

  const _PremiumSwitch({required this.value});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: 52,
        height: 30,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: value ? const Color(0xFF2563EB) : const Color(0xFFE5EAF3),
          borderRadius: BorderRadius.circular(999),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 220),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 22,
            height: 22,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
