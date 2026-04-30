import 'dart:ui';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/test_premium_card.dart';
import 'package:flutter/material.dart';

class TestProfileV2 extends StatelessWidget {
  const TestProfileV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF10120F),
      body: Stack(
        children: [
          const _BackgroundGlow(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _TopBar(),
                  SizedBox(height: 22),
                  _ProfileHeader(),
                  SizedBox(height: 22),
                  _PremiumCard(),
                  // PremiumAlertCard(),
                  SizedBox(height: 26),
                  _SectionTitle('Informações do usuário'),
                  SizedBox(height: 10),
                  _MenuGroup(
                    items: [
                      _MenuItemData(Icons.person_outline, 'Editar perfil'),
                      _MenuItemData(Icons.badge_outlined, 'Documentos'),
                      _MenuItemData(Icons.mail_outline, 'E-mail'),
                      _MenuItemData(Icons.settings_outlined, 'Configurações'),
                    ],
                  ),
                  SizedBox(height: 26),
                  _SectionTitle('Minha conta'),
                  SizedBox(height: 10),
                  _MenuGroup(
                    items: [
                      _MenuItemData(Icons.notifications_none, 'Notificações'),
                      _MenuItemData(Icons.location_on_outlined, 'Localização'),
                      _MenuItemData(Icons.shield_outlined, 'Segurança'),
                      _MenuItemData(Icons.logout_rounded, 'Sair da conta'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const _BottomNavigation(),
        ],
      ),
    );
  }
}

class _BackgroundGlow extends StatelessWidget {
  const _BackgroundGlow();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: const Color(0xFF10120F)),
        Positioned(
          top: -100,
          right: -80,
          child: Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFB7FF1A).withOpacity(.08),
            ),
          ),
        ),
        Positioned(
          bottom: 120,
          left: -100,
          child: Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF2B5BEE).withOpacity(.10),
            ),
          ),
        ),
      ],
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _CircleIconButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => Navigator.maybePop(context),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Meu perfil',
              style: TextStyle(
                color: Color(0xFFF4F6F0),
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        _CircleIconButton(
          icon: Icons.settings_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundColor: Color(0xFFDDE6D1),
          child: Icon(
            Icons.person,
            color: Color(0xFF252A20),
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
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
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.edit_outlined,
            color: Color(0xFFE7EDE1),
            size: 20,
          ),
        ),
      ],
    );
  }
}

class _PremiumCard extends StatelessWidget {
  const _PremiumCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1A2F6B),
            Color(0xFF14224A),
            Color(0xFF0E162D),
          ],
        ),
        border: Border.all(
          // color: Color(0x33D8FF3D),
          color: AppColors.primaryColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '🛡️ Civi Premium',
                  style: TextStyle(
                    color: Color(0xFFF6F9EF),
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Alertas avançados, emergência rápida e mais proteção.',
                  style: TextStyle(
                    color: Color(0xFFB8C0B1),
                    fontSize: 12,
                    height: 1.25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    // color: const Color(0xFFE6FF2E),
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: const Text(
                    'Ativar acesso',
                    style: TextStyle(
                      // color: Color(0xFF11140C),
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.10),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.lock_rounded,
              color: Color(0xFFDDE5D2),
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuGroup extends StatelessWidget {
  final List<_MenuItemData> items;

  const _MenuGroup({
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.045),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withOpacity(.08),
            ),
          ),
          child: Column(
            children: List.generate(items.length, (index) {
              final item = items[index];

              return Column(
                children: [
                  _MenuTile(item: item),
                  if (index != items.length - 1)
                    Divider(
                      height: 1,
                      indent: 54,
                      color: Colors.white.withOpacity(.06),
                    ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final _MenuItemData item;

  const _MenuTile({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final isLogout = item.title == 'Sair da conta';

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 31,
              height: 31,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.065),
                shape: BoxShape.circle,
              ),
              child: Icon(
                item.icon,
                color: isLogout
                    ? const Color(0xFFFF8A8A)
                    : const Color(0xFFCBD3C5),
                size: 18,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                item.title,
                style: TextStyle(
                  color: isLogout
                      ? const Color(0xFFFFA0A0)
                      : const Color(0xFFE7EDE1),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: Colors.white.withOpacity(.65),
              size: 23,
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFFF4F6F0),
        fontSize: 15,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleIconButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      radius: 26,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.09),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withOpacity(.08),
          ),
        ),
        child: Icon(
          icon,
          color: const Color(0xFFE8EEE2),
          size: 19,
        ),
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 28,
      right: 28,
      bottom: 22,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
          child: Container(
            height: 66,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xDD171916),
              borderRadius: BorderRadius.circular(26),
              border: Border.all(
                color: Colors.white.withOpacity(.08),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.35),
                  blurRadius: 24,
                  offset: const Offset(0, 14),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _NavItem(icon: Icons.home_outlined),
                _NavItem(icon: Icons.search_rounded),
                _NavItem(icon: Icons.map_outlined),
                _NavItem(icon: Icons.favorite_border_rounded),
                _NavItem(
                  icon: Icons.person_rounded,
                  selected: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool selected;

  const _NavItem({
    required this.icon,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 43,
      height: 43,
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFE6FF2E) : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: selected ? const Color(0xFF11140C) : const Color(0xFFADB5A8),
        size: 22,
      ),
    );
  }
}

class _MenuItemData {
  final IconData icon;
  final String title;

  const _MenuItemData(this.icon, this.title);
}
