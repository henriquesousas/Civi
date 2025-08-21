import 'package:flutter/material.dart';
import 'package:yousafe/app/router/router_config.dart';
import 'package:yousafe/features/profile/components/profile_app_bar.dart';
import 'package:yousafe/features/profile/components/profile_logout_section.dart';
import 'package:yousafe/features/profile/components/profile_menu.dart';
import 'package:yousafe/features/profile/components/profile_menu_section.dart';

import '../../app/theme/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  List<ProfileMenu> _menuItems = [];
  late AnimationController _animationController;
  late AnimationController _statsController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _statsAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _statsController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),
    );

    _statsAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _statsController, curve: Curves.easeOutBack),
    );
  }

  void _startAnimations() {
    _animationController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _statsController.forward();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _menuItems = [
      const ProfileMenu(
        icon: Icons.edit_outlined,
        title: 'Conta',
        subtitle: 'Altere suas informações pessoais',
        route: Routes.profileEdit,
        color: AppColors.primary,
      ),
      const ProfileMenu(
        icon: Icons.password,
        title: 'Mudar senha',
        subtitle: 'Altere sua senha nesta opção',
        route: Routes.profileEdit,
        color: AppColors.primary,
      ),
      const ProfileMenu(
        icon: Icons.inventory_2_outlined,
        title: 'Meus itens',
        subtitle: 'Seus items cadastrados',
        route: Routes.profileEdit,
        color: AppColors.primary,
      ),
      const ProfileMenu(
        icon: Icons.timeline,
        title: 'Últimas ocorrências',
        subtitle: 'Veja as últimas ocorrências registradas',
        route: Routes.profileEdit,
        color: AppColors.primary,
      ),
      const ProfileMenu(
        icon: Icons.settings_outlined,
        title: 'Settings',
        subtitle: 'Preferences e politicas de privacidade',
        route: Routes.settings,
        color: AppColors.primary,
      ),
      const ProfileMenu(
        icon: Icons.help_outline_rounded,
        title: 'Ajuda',
        subtitle: 'Obtenha ajuda ou fale com a gente',
        route: Routes.help,
        color: AppColors.primary,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: CustomScrollView(
                slivers: [
                  const ProfileAppBar(),
                  SliverToBoxAdapter(
                    child: ProfileMenuSection(
                      items: _menuItems,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: ProfileLogoutSection(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
