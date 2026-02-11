import 'package:app_core/app_core.dart';
import 'package:deehelp/core/services/permissions/location/providers/location_providers.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/feature/profile/export_profile.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_register_incident_button.dart';
import 'widgets/recent_incident_card.dart';
import 'widgets/section_quick_actions.dart';
import 'widgets/home_search_field.dart';
import 'widgets/location_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final recentIncidents = const [
  RecentIncidentItem(
    imageUrl:
        'https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=300&q=80',
    title: 'CG Titan roubado',
    location: 'Centro • Fortaleza, CE',
  ),
  RecentIncidentItem(
    imageUrl:
        'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?auto=format&fit=crop&w=300&q=80',
    title: 'Onix furtado',
    location: 'Aldeota • Fortaleza, CE',
  ),
  RecentIncidentItem(
    imageUrl:
        'https://images.unsplash.com/photo-1525609004556-c46c7d6cf023?auto=format&fit=crop&w=300&q=80',
    title: 'iPhone 13 roubado',
    location: 'Meireles • Fortaleza, CE',
  ),
  RecentIncidentItem(
    imageUrl:
        'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?auto=format&fit=crop&w=300&q=80',
    title: 'Onix furtado',
    location: 'Aldeota • Fortaleza, CE',
  ),
  RecentIncidentItem(
    imageUrl:
        'https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=300&q=80',
    title: 'CG Titan roubado',
    location: 'Centro • Fortaleza, CE',
  ),
  RecentIncidentItem(
    imageUrl:
        'https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=300&q=80',
    title: 'CG Titan roubado',
    location: 'Centro • Fortaleza, CE',
  ),
];

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocationState = ref.watch(currentLocationProvider);
    //  final session = ref.watch(authenticatedUserProvider);

    return Scaffold(
      appBar: HomeAppBar(
        userName: "Paulo Silva",
        profileImageUrl:
            "https://static.vecteezy.com/system/resources/thumbnails/049/949/978/small/man-in-casual-clothes-pointing-at-camera-cut-out-transparent-png.png",
        press: () => context.push(ProfileRouter.path),
      ),
      bottomNavigationBar: HomeRegisterIncidentButton(
        onTap: () {},
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(LayoutSpacingSize.page),
          children: [
            LocationBanner(
              title: "Localização atual",
              primaryText: currentLocationState?.city ?? '',
              secondaryText: currentLocationState?.address ?? '',
            ),
            // _LocationCard(
            //   title: 'Sua região',
            //   subtitle: 'Centro • Fortaleza, CE',
            //   statusLabel: 'Localização ativa',
            //   statusColor: Color(0xFF16A34A),
            //   onTap: () {
            //     // TODO: abrir tela/bottomsheet de localização
            //   },
            //   onRefresh: () {
            //     // TODO: atualizar GPS/endereço
            //   },
            // ),
            const SizedBox(height: SpacingSize.xl),
            HomeSearchField(
              onTap: () {},
              hint: 'Buscar ocorrências, locais ou serviços',
            ),
            const SizedBox(height: SpacingSize.xl),
            const Text(
              'Ações rápidas',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Color(0xFF111827),
              ),
            ),
            const SizedBox(height: SpacingSize.md),
            _QuickStatsGrid(
              items: [
                _QuickStat(
                  icon: Icons.map_rounded,
                  // iconBg: Color(0xFFFFF7ED),
                  // iconColor: Color(0xFFF59E0B),
                  iconBg: AppColors.primaryColor.withValues(alpha: 0.1),
                  iconColor: AppColors.primaryColor,
                  title: 'Map',
                  subtitle: 'Ocorrência próximas',
                ),
                _QuickStat(
                  icon: Icons.inventory_2_outlined,
                  iconBg: AppColors.primaryColor.withValues(alpha: 0.1),
                  iconColor: AppColors.primaryColor,
                  // iconBg: Color(0xFFF0F9FF),
                  // iconColor: Color(0xFF0284C7),
                  title: 'Meus itens',
                  subtitle: 'Gerenciar cadastro',
                ),
                _QuickStat(
                  icon: Icons.campaign,
                  iconBg: AppColors.primaryColor.withValues(alpha: 0.1),
                  iconColor: AppColors.primaryColor,
                  // iconBg: Color(0xFFF5F3FF),
                  // iconColor: Color(0xFF7C3AED),
                  title: 'Ocorrências',
                  subtitle: 'Seu histórico',
                ),
                _QuickStat(
                  icon: Icons.sos,
                  iconBg: Colors.redAccent.withValues(alpha: 0.1),
                  iconColor: Colors.redAccent,
                  title: 'Emergência',
                  subtitle: 'Chamadas de emergência',
                ),
              ],
            ),
            const SizedBox(height: SpacingSize.md),
            Row(
              children: [
                const Text(
                  'Recentes incidentes',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF111827),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primaryColor,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  child: const Text(
                    'Ver todos',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                  ),
                ),
              ],
            ),
            RecentIncidentsCard(items: recentIncidents),
          ],
        ),
      ),
    );
  }
}

/// ===============================
/// QUICK STATS
/// ===============================
class _QuickStatsGrid extends StatelessWidget {
  final List<_QuickStat> items;

  const _QuickStatsGrid({required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        childAspectRatio: 2.35,
      ),
      itemBuilder: (context, index) => _QuickStatCard(item: items[index]),
    );
  }
}

class _QuickStat {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String subtitle;

  const _QuickStat({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });
}

class _QuickStatCard extends StatelessWidget {
  final _QuickStat item;

  const _QuickStatCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFFE8EEFF)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 18,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: item.iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(item.icon, color: item.iconColor, size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6B7280),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String statusLabel;
  final Color statusColor;
  final VoidCallback onTap;
  final VoidCallback onRefresh;

  const _LocationCard({
    required this.title,
    required this.subtitle,
    required this.statusLabel,
    required this.statusColor,
    required this.onTap,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final bgBlue = AppColors.primaryColor;
    final fgMain = Colors.white;
    final fgMuted = Colors.white.withOpacity(0.75);

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgBlue,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.08),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                _LocationLeadingBlue(),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: fgMain,
                      height: 1.1,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                _StatusPillBlue(
                  label: statusLabel,
                  color: statusColor,
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Endereço
            Row(
              children: [
                Icon(
                  Icons.place_rounded,
                  size: 16,
                  color: fgMuted,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: fgMuted,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            // const SizedBox(height: 14),
            // Divider(
            //   height: 1,
            //   thickness: 1,
            //   color: Colors.white.withOpacity(0.12),
            // ),
            // const SizedBox(height: 10),

            // Actions
            // Row(
            //   children: [
            //     _GhostButtonBlue(
            //       icon: Icons.refresh_rounded,
            //       label: 'Atualizar',
            //       onTap: onRefresh,
            //     ),
            //     const SizedBox(width: 10),
            //     _GhostButtonBlue(
            //       icon: Icons.tune_rounded,
            //       label: 'Alterar',
            //       onTap: onTap,
            //     ),
            //     const Spacer(),
            //     Icon(
            //       Icons.chevron_right_rounded,
            //       color: fgMuted,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

/// ===============================
/// LEADING AZUL
/// ===============================
class _LocationLeadingBlue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(
        Icons.my_location_rounded,
        color: Colors.white,
        size: 22,
      ),
    );
  }
}

/// ===============================
/// STATUS PILL AZUL
/// ===============================
class _StatusPillBlue extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusPillBlue({
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

/// ===============================
/// BOTÃO GHOST AZUL
/// ===============================
class _GhostButtonBlue extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _GhostButtonBlue({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.14),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
