import 'package:flutter/material.dart';

/// ===============================
/// UI TOKENS (Design System)
/// ===============================
class UIK {
  // Colors
  static const primary = Color(0xFF2B5BEE);
  static const bg = Color(0xFFF7F9FC);
  static const surface = Colors.white;
  static const ink = Color(0xFF1F2A44);
  static const muted = Color(0xFF6B7280); // cinza elegante
  static const border = Color(0xFFE9EEF8);

  // Radius
  static const rCard = 18.0;
  static const rChip = 14.0;
  static const rButton = 18.0;

  // Spacing
  static const s12 = 12.0;
  static const s16 = 16.0;
  static const s20 = 20.0;
  static const s24 = 24.0;

  // Shadow
  static const shadow = BoxShadow(
    color: Color(0x12000000),
    blurRadius: 18,
    offset: Offset(0, 10),
  );

  static const shadowSoft = BoxShadow(
    color: Color(0x0D000000),
    blurRadius: 16,
    offset: Offset(0, 8),
  );
}

/// ===============================
/// Soft Gradient Card - Light Mode
/// ===============================
class UISoftGradientCardLight extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Color baseColor;
  final double? width;
  final double? height;

  const UISoftGradientCardLight({
    super.key,
    required this.child,
    this.borderRadius = UIK.rCard,
    this.padding = const EdgeInsets.all(18),
    this.baseColor = UIK.primary,
    this.width,
    this.height,
  });

  Color _lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  @override
  Widget build(BuildContext context) {
    final ultraLightBlue = _lighten(baseColor, 0.50);
    final softLightBlue = _lighten(baseColor, 0.36);

    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [ultraLightBlue, softLightBlue],
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: baseColor.withOpacity(0.06), width: 1),
        boxShadow: const [UIK.shadowSoft],
      ),
      child: child,
    );
  }
}

/// ===============================
/// HOME (REFATORADA)
/// ===============================
class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIK.bg,
      appBar: const _HomeAppBar(
        userName: 'João Silva',
        profileImageUrl: 'https://i.pravatar.cc/150?img=3',
      ),
      bottomNavigationBar: _BottomRegisterIncidentButton(
        onTap: () {},
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 18),
          children: [
            // Location (mais clean e compacto)
            // _LocationCardCompact(
            //   title: 'Localização atual',
            //   primaryText: 'Osasco, São Paulo',
            //   secondaryText: 'Travessa Francisco Alves da Silva',
            //   onTap: () {},
            // ),
            _LocationBanner(
              title: 'Localização atual',
              primaryText: 'Osasco, São Paulo',
              secondaryText: 'Travessa Francisco Alves da Silva',
              onTap: () {},
            ),
            const SizedBox(height: UIK.s16),

            // Search (mais input-like)
            _SearchFieldFake(
              hint: 'Buscar ocorrências, locais ou serviços',
              onTap: () {},
            ),
            const SizedBox(height: UIK.s24),

            // Quick Actions
            _SectionHeader(
              title: 'Ações rápidas',
              actionText: null,
              onAction: null,
            ),
            const SizedBox(height: UIK.s12),
            // _QuickActionsGrid(
            //   onMapTap: () {},
            //   onMyRecordsTap: () {},
            //   onFavoritesTap: () {},
            // ),
            const ImprovedHomeFeatureGrid(),
            const SizedBox(height: UIK.s24),

            // Recent incidents QA
            _SectionHeader(
              title: 'Incidentes recentes',
              actionText: 'Ver todos',
              onAction: () {},
            ),
            const SizedBox(height: UIK.s12),
            _RecentIncidentsList(
              items: [
                RecentIncidentItem(
                  title: 'Roubo de celular reportado',
                  location: 'Centro • Osasco',
                  imageUrl: 'https://i.pravatar.cc/150?img=5',
                  onTap: () {},
                ),
                RecentIncidentItem(
                  title: 'Furto de moto na região',
                  location: 'Bela Vista • Osasco',
                  imageUrl: 'https://i.pravatar.cc/150?img=12',
                  onTap: () {},
                ),
                RecentIncidentItem(
                  title: 'Roubo de veículo registrado',
                  location: 'Vila Yara • Osasco',
                  imageUrl: 'https://i.pravatar.cc/150?img=7',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// ===============================
/// APP BAR (mais elegante)
/// ===============================
class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String profileImageUrl;

  const _HomeAppBar({
    required this.userName,
    required this.profileImageUrl,
  });

  @override
  Size get preferredSize => const Size.fromHeight(74);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0.6,
      backgroundColor: UIK.surface,
      surfaceTintColor: UIK.surface,
      automaticallyImplyLeading: false,
      titleSpacing: 20,
      title: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: UIK.border, width: 1),
              image: DecorationImage(
                image: NetworkImage(profileImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bom dia,',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: UIK.muted,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  userName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: UIK.ink,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
          ),
          _IconAction(
            icon: Icons.notifications_none_rounded,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _IconAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _IconAction({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(UIK.rChip),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: UIK.primary.withOpacity(0.06),
          borderRadius: BorderRadius.circular(UIK.rChip),
          border: Border.all(color: UIK.primary.withOpacity(0.10)),
        ),
        child: Icon(icon, color: UIK.primary, size: 22),
      ),
    );
  }
}

/// ===============================
/// SECTION HEADER
/// ===============================
class _SectionHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onAction;

  const _SectionHeader({
    required this.title,
    required this.actionText,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: UIK.ink,
                ),
          ),
        ),
        if (actionText != null && onAction != null)
          TextButton(
            onPressed: onAction,
            style: TextButton.styleFrom(
              foregroundColor: UIK.primary,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            ),
            child: Text(
              actionText!,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
      ],
    );
  }
}

/// ===============================
/// LOCATION (compact + pro)
/// ===============================
class _LocationCardCompact extends StatelessWidget {
  final String title;
  final String primaryText;
  final String? secondaryText;
  final VoidCallback? onTap;

  const _LocationCardCompact({
    required this.title,
    required this.primaryText,
    this.secondaryText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _SurfaceCard(
      onTap: onTap,
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          _BadgeIcon(icon: Icons.my_location_outlined),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: UIK.muted,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  primaryText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: UIK.ink,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                if (secondaryText != null) ...[
                  const SizedBox(height: 3),
                  Text(
                    secondaryText!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: UIK.muted,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ],
            ),
          ),
          if (onTap != null)
            const Icon(Icons.chevron_right_rounded, color: UIK.muted),
        ],
      ),
    );
  }
}

class _BadgeIcon extends StatelessWidget {
  final IconData icon;
  const _BadgeIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: UIK.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: UIK.primary.withOpacity(0.10)),
      ),
      child: Icon(icon, color: UIK.primary, size: 20),
    );
  }
}

/// ===============================
/// SEARCH (fake, mas com cara de input real)
/// ===============================
class _SearchFieldFake extends StatelessWidget {
  final VoidCallback onTap;
  final String hint;

  const _SearchFieldFake({
    required this.onTap,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return _SurfaceCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: UIK.ink.withOpacity(0.05),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.search_rounded, color: UIK.ink, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              hint,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: UIK.muted,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: UIK.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: UIK.primary.withOpacity(0.10)),
            ),
            child: const Icon(Icons.tune_rounded, color: UIK.primary, size: 18),
          ),
        ],
      ),
    );
  }
}

/// ===============================
/// QUICK ACTIONS GRID (bem consistente)
/// ===============================
// class _QuickActionsGrid extends StatelessWidget {
//   final VoidCallback? onMapTap;
//   final VoidCallback? onMyRecordsTap;
//   final VoidCallback? onFavoritesTap;

//   const _QuickActionsGrid({
//     this.onMapTap,
//     this.onMyRecordsTap,
//     this.onFavoritesTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         // Left (highlight)
//         Expanded(
//           child: GestureDetector(
//             onTap: onMapTap,
//             child: UISoftGradientCardLight(
//               height: 190,
//               padding: const EdgeInsets.all(18),
//               baseColor: UIK.primary,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _Pill(
//                     icon: Icons.map_outlined,
//                     text: 'Mapa',
//                     bg: UIK.primary.withOpacity(0.12),
//                     fg: UIK.primary,
//                   ),
//                   const Spacer(),
//                   Text(
//                     'Mapa de ocorrências',
//                     style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                           color: UIK.ink,
//                           fontWeight: FontWeight.w800,
//                         ),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     'Veja incidentes próximos a você',
//                     style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                           color: UIK.muted,
//                           fontWeight: FontWeight.w600,
//                         ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(width: 16),

//         // Right stack
//         Expanded(
//           child: Column(
//             children: [
//               _SurfaceCard(
//                 onTap: onMyRecordsTap,
//                 padding: const EdgeInsets.all(16),
//                 child: _MiniActionRow(
//                   icon: Icons.report_outlined,
//                   title: 'Meus registros',
//                   subtitle: 'Itens e ocorrências',
//                 ),
//               ),
//               const SizedBox(height: 16),
//               _SurfaceCard(
//                 onTap: onFavoritesTap,
//                 padding: const EdgeInsets.all(16),
//                 child: _MiniActionRow(
//                   icon: Icons.star_outline_rounded,
//                   title: 'Favoritos',
//                   subtitle: 'Locais e alertas',
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _QuickActionsGrid extends StatelessWidget {
//   final VoidCallback? onMapTap;
//   final VoidCallback? onMyRecordsTap;
//   final VoidCallback? onFavoritesTap;

//   const _QuickActionsGrid({
//     this.onMapTap,
//     this.onMyRecordsTap,
//     this.onFavoritesTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     const double gap = 16;
//     const double tileH = 88; // altura de cada card da direita
//     const double totalH = (tileH * 2) + gap;

//     return SizedBox(
//       height: totalH, // ✅ define a altura do bloco inteiro (resolve o sumiço)
//       child: Row(
//         children: [
//           // LEFT - MAP
//           Expanded(
//             child: GestureDetector(
//               onTap: onMapTap,
//               child: UISoftGradientCardLight(
//                 height: totalH, // ✅ iguala exatamente com os dois da direita
//                 padding: const EdgeInsets.all(18),
//                 baseColor: UIK.primary,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _Pill(
//                       icon: Icons.map_outlined,
//                       text: 'Mapa',
//                       bg: UIK.primary.withOpacity(0.12),
//                       fg: UIK.primary,
//                     ),
//                     const Spacer(),
//                     Text(
//                       'Mapa de ocorrências',
//                       style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                             fontWeight: FontWeight.w800,
//                             color: UIK.ink,
//                           ),
//                     ),
//                     const SizedBox(height: 6),
//                     Text(
//                       'Veja incidentes próximos a você',
//                       style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                             color: UIK.muted,
//                             fontWeight: FontWeight.w600,
//                           ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           const SizedBox(width: gap),

//           // RIGHT - STACK
//           Expanded(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: tileH,
//                   child: _SurfaceCard(
//                     onTap: onMyRecordsTap,
//                     padding: const EdgeInsets.all(16),
//                     child: _MiniActionRow(
//                       icon: Icons.report_outlined,
//                       title: 'Meus registros',
//                       subtitle: 'Itens e ocorrências',
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: gap),
//                 SizedBox(
//                   height: tileH,
//                   child: _SurfaceCard(
//                     onTap: onFavoritesTap,
//                     padding: const EdgeInsets.all(16),
//                     child: _MiniActionRow(
//                       icon: Icons.star_outline_rounded,
//                       title: 'Favoritos',
//                       subtitle: 'Locais e alertas',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ImprovedHomeFeatureGrid extends StatelessWidget {
  final Color baseColor;
  final VoidCallback? onMainTap;
  final VoidCallback? onSecondTap;
  final VoidCallback? onThirdTap;

  const ImprovedHomeFeatureGrid({
    super.key,
    this.baseColor = const Color(0xFF2B5BEE),
    this.onMainTap,
    this.onSecondTap,
    this.onThirdTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ===============================
        // Main Highlight Card (Left)
        // ===============================
        Expanded(
          child: GestureDetector(
            onTap: onMainTap,
            child: UISoftGradientCardLight(
              height: 190,
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: baseColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.map_outlined, size: 28, color: baseColor),
                  ),
                  const Spacer(),
                  Text(
                    'Mapa de ocorrências',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Veja incidentes próximos a você',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 16),

        // ===============================
        // Secondary Cards (Right)
        // ===============================
        Expanded(
          child: Column(
            children: [
              GestureDetector(
                onTap: onSecondTap,
                child: UISoftGradientCardLight(
                  height: 86,
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      _IconBadge(
                        icon: Icons.report_outlined,
                        color: baseColor,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Meus registros',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded,
                          color: Colors.grey),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: onThirdTap,
                child: UISoftGradientCardLight(
                  height: 86,
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      _IconBadge(
                        icon: Icons.star_outline,
                        color: baseColor,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Favoritos',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded,
                          color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IconBadge extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _IconBadge({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: 22, color: color),
    );
  }
}

class _MiniActionRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _MiniActionRow({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _BadgeIcon(icon: icon),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: UIK.ink,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: UIK.muted,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
        const Icon(Icons.chevron_right_rounded, color: UIK.muted),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color bg;
  final Color fg;

  const _Pill({
    required this.icon,
    required this.text,
    required this.bg,
    required this.fg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: fg.withOpacity(0.10)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: fg),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: fg,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

/// ===============================
/// RECENT LIST (mais leve e elegante)
/// ===============================
class _RecentIncidentsList extends StatelessWidget {
  final List<RecentIncidentItem> items;

  const _RecentIncidentsList({required this.items});

  @override
  Widget build(BuildContext context) {
    final capped = items.length.clamp(0, 5);

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: capped,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = items[index];

        return _SurfaceCard(
          onTap: item.onTap,
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              // Avatar
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: UIK.border, width: 1),
                  image: DecorationImage(
                    image: NetworkImage(item.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Texts
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: UIK.ink,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined,
                            size: 14, color: UIK.muted),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            item.location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: UIK.muted,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),
              const Icon(Icons.chevron_right_rounded, color: UIK.muted),
            ],
          ),
        );
      },
    );
  }
}

class RecentIncidentItem {
  final String title;
  final String location;
  final String imageUrl;
  final VoidCallback? onTap;

  RecentIncidentItem({
    required this.title,
    required this.location,
    required this.imageUrl,
    this.onTap,
  });
}

/// ===============================
/// SURFACE CARD (base para tudo)
/// ===============================
class _SurfaceCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  const _SurfaceCard({
    required this.child,
    required this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: UIK.surface,
        borderRadius: BorderRadius.circular(UIK.rCard),
        // borderRadius: BorderRadius.circular(90),
        border: Border.all(color: UIK.border, width: 1),
        boxShadow: const [UIK.shadowSoft],
      ),
      child: child,
    );

    if (onTap == null) return card;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(UIK.rCard),
      child: card,
    );
  }
}

/// ===============================
/// CTA FIXO (mantive, só deixei mais alinhado)
/// ===============================
class _BottomRegisterIncidentButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color baseColor;

  const _BottomRegisterIncidentButton({
    required this.onTap,
    this.baseColor = UIK.primary,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(UIK.rButton),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  baseColor.withOpacity(0.95),
                  baseColor.withOpacity(0.85),
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x22000000),
                  blurRadius: 18,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(width: 18),
                Expanded(
                  child: Text(
                    'Registrar novo incidente',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.white.withOpacity(0.14)),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LocationBanner extends StatelessWidget {
  final String title;
  final String primaryText;
  final String? secondaryText;
  final VoidCallback? onTap;

  const _LocationBanner({
    required this.title,
    required this.primaryText,
    this.secondaryText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: UIK.primary.withOpacity(0.06), // ✅ não branco
        borderRadius: BorderRadius.circular(UIK.rCard),
        border: Border.all(color: UIK.primary.withOpacity(0.14)),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: UIK.primary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.my_location_outlined,
                color: UIK.primary, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: UIK.muted,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  primaryText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: UIK.ink,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                if (secondaryText != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    secondaryText!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: UIK.muted,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ],
            ),
          ),
          if (onTap != null)
            const Icon(Icons.chevron_right_rounded, color: UIK.muted),
        ],
      ),
    );

    if (onTap == null) return content;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(UIK.rCard),
      child: content,
    );
  }
}
