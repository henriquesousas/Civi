import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

class NavMenu {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final Color color;

  NavMenu({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.color,
  });

  static final List<NavMenu> getNavigationItems = [
    NavMenu(
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
      label: 'Home',
      color: AppColors.primary,
    ),
    NavMenu(
      icon: Icons.history_outlined,
      activeIcon: Icons.history_rounded,
      label: 'Produtos',
      color: AppColors.primary,
      // color: AppColors.secondary,
    ),
    NavMenu(
      icon: Icons.person_outline_rounded,
      activeIcon: Icons.person_rounded,
      label: 'Perfil',
      color: AppColors.primary,
      // color: AppColors.accent,
    ),
    NavMenu(
      icon: Icons.settings_outlined,
      activeIcon: Icons.settings_rounded,
      label: 'Mais',
      color: AppColors.primary,
      // color: AppColors.info,
    ),
  ];
}
