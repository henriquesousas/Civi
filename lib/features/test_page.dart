import 'package:flutter/material.dart';

// ===============================
// Soft Gradient Card - Light Mode
// ===============================
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
    this.borderRadius = 16,
    this.padding = const EdgeInsets.all(20),
    this.baseColor = const Color(0xFF2B5BEE),
    this.width,
    this.height,
  });

  Color _lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness(
          (hsl.lightness + amount).clamp(0.0, 1.0),
        )
        .toColor();
  }

  @override
  Widget build(BuildContext context) {
    final Color ultraLightBlue = _lighten(baseColor, 0.50);
    final Color softLightBlue = _lighten(baseColor, 0.36);

    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ultraLightBlue,
            softLightBlue,
          ],
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: baseColor.withOpacity(0.06),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}

// ===============================
// Home Screen - Light Mode
// ===============================
class TestePage extends StatelessWidget {
  const TestePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color baseBlue = const Color(0xFF2B5BEE);

    return Scaffold(
      appBar: HomeAppToolbar(
        userName: 'João Silva',
        profileImageUrl: 'https://i.pravatar.cc/150?img=3',
      ),
      backgroundColor: const Color(0xFFF7F9FC),
      bottomNavigationBar: BottomRegisterIncidentButton(
        onTap: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===============================
              // Header - Profile
              // ===============================
              // Row(
              //   children: [
              //     const CircleAvatar(
              //       radius: 22,
              //       backgroundImage: NetworkImage(
              //         'https://i.pravatar.cc/150?img=3',
              //       ),
              //     ),
              //     const SizedBox(width: 12),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           'Bom dia,',
              //           style: Theme.of(context)
              //               .textTheme
              //               .bodySmall
              //               ?.copyWith(color: Colors.grey[600]),
              //         ),
              //         Text(
              //           'João Silva',
              //           style: Theme.of(context).textTheme.titleMedium,
              //         ),
              //       ],
              //     ),
              //   ],
              // ),

              // const SizedBox(height: 24),

              // ===============================
              // Location Card
              // ===============================
              // CollapsibleLocationBanner(
              //   location: 'Você está em Osasco, São Paulo',
              // ),
              LocationIndicatorCard(
                location: 'Osasco, São Paulo',
                onTap: () {}, // opcional
              ),

              // UISoftGradientCardLight(
              //   padding: const EdgeInsets.all(16),
              //   child: Row(
              //     children: [
              //       Icon(Icons.location_on_outlined, color: baseBlue),
              //       const SizedBox(width: 8),
              //       const Expanded(
              //         child: Text('Você está em São Paulo, SP'),
              //       ),
              //     ],
              //   ),
              // ),

              const SizedBox(height: 20),

              // ===============================
              // Search Field (CTA)
              // ===============================
              // GestureDetector(
              //   onTap: () {
              //     // Navigator.push(...);
              //   },
              //   child: Container(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(14),
              //       border: Border.all(color: Colors.grey.withOpacity(0.2)),
              //     ),
              //     child: Row(
              //       children: [
              //         Icon(Icons.search, color: Colors.grey[500]),
              //         const SizedBox(width: 8),
              //         Text(
              //           'Buscar serviços, locais...',
              //           style: TextStyle(color: Colors.grey[500]),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SearchFakeField(
              //   onTap: () {},
              // ),
              SearchFakeFieldV2(
                onTap: () {},
              ),
              const SizedBox(height: 28),

              // ===============================
              // Grid Section
              // ===============================
              // HomeFeatureGrid(),
              ImprovedHomeFeatureGrid(),
              // const SizedBox(height: 24),
              // ===============================
              // Recents incidents
              // ===============================
              const SizedBox(height: 28),
              // RecentIncidentsListV1(),
              RecentIncidentsList(
                items: [
                  RecentIncidentItem(
                    title: 'Roubo aconteceu em Osasco',
                    location: 'Osasco, São Paulo',
                    imageUrl: 'https://i.pravatar.cc/150?img=5',
                    onTap: () {},
                  ),
                  RecentIncidentItem(
                    title: 'Roubo aconteceu em Osasco',
                    location: 'Osasco, São Paulo',
                    imageUrl: 'https://i.pravatar.cc/150?img=5',
                    onTap: () {},
                  ),
                  RecentIncidentItem(
                    title: 'Roubo aconteceu em Osasco',
                    location: 'Osasco, São Paulo',
                    imageUrl: 'https://i.pravatar.cc/150?img=5',
                    onTap: () {},
                  ),
                  RecentIncidentItem(
                    title: 'Roubo aconteceu em Osasco',
                    location: 'Osasco, São Paulo',
                    imageUrl: 'https://i.pravatar.cc/150?img=5',
                    onTap: () {},
                  ),
                  RecentIncidentItem(
                    title: 'Roubo aconteceu em Osasco',
                    location: 'Osasco, São Paulo',
                    imageUrl: 'https://i.pravatar.cc/150?img=5',
                    onTap: () {},
                  ),
                  // até 5 itens
                ],
                onSeeAll: () {},
              ),
              // ImprovedHomeFeatureGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class RecentIncidentsListV1 extends StatelessWidget {
  final int itemCount;
  final VoidCallback? onItemTap;

  const RecentIncidentsListV1({
    super.key,
    this.itemCount = 5,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ocorrências recentes',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: onItemTap,
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.15),
                  ),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/100?img=12',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Roubo aconteceu em Osasco, São Paulo',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class BottomRegisterIncidentButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color baseColor;

  const BottomRegisterIncidentButton({
    super.key,
    required this.onTap,
    this.baseColor = const Color(0xFF2B5BEE),
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
              borderRadius: BorderRadius.circular(18),
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
                  color: Color(0x26000000),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    'Registrar novo incidente',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                // Arrow container
                Container(
                  margin: const EdgeInsets.all(8),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(14),
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

class HomeAppToolbar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String profileImageUrl;

  const HomeAppToolbar({
    super.key,
    required this.userName,
    required this.profileImageUrl,
  });

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: false,
      titleSpacing: 20,
      title: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(profileImageUrl),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bom dia,',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey[600]),
              ),
              Text(
                userName,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LocationContextBanner extends StatelessWidget {
  final String location;
  final Color baseColor;

  const LocationContextBanner({
    super.key,
    required this.location,
    this.baseColor = const Color(0xFF2B5BEE),
  });

  Color _lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness(
          (hsl.lightness + amount).clamp(0.0, 1.0),
        )
        .toColor();
  }

  @override
  Widget build(BuildContext context) {
    final Color background = _lighten(baseColor, 0.55);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            size: 18,
            color: baseColor,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              location,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[800],
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class CollapsibleLocationBanner extends StatefulWidget {
  final String location;
  final Color baseColor;
  final bool initiallyExpanded;

  const CollapsibleLocationBanner({
    super.key,
    required this.location,
    this.baseColor = const Color(0xFF2B5BEE),
    this.initiallyExpanded = true,
  });

  @override
  State<CollapsibleLocationBanner> createState() =>
      _CollapsibleLocationBannerState();
}

class _CollapsibleLocationBannerState extends State<CollapsibleLocationBanner>
    with SingleTickerProviderStateMixin {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
  }

  Color _lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness(
          (hsl.lightness + amount).clamp(0.0, 1.0),
        )
        .toColor();
  }

  @override
  Widget build(BuildContext context) {
    final Color background = _lighten(widget.baseColor, 0.55);

    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: () {
          setState(() => _expanded = !_expanded);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 18,
                color: widget.baseColor,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _expanded ? 1.0 : 0.0,
                  child: _expanded
                      ? Text(
                          widget.location,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.grey[800],
                                  ),
                        )
                      : const SizedBox.shrink(),
                ),
              ),
              const SizedBox(width: 6),
              Icon(
                _expanded
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
                size: 20,
                color: Colors.grey[600],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeFeatureGrid extends StatelessWidget {
  final Color baseColor;

  const HomeFeatureGrid({
    super.key,
    this.baseColor = const Color(0xFF2B5BEE),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left big card
        Expanded(
          child: UISoftGradientCardLight(
            height: 180,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.map_outlined, size: 32, color: baseColor),
                const Spacer(),
                Text(
                  'Mapa',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 16),

        // Right stacked cards
        Expanded(
          child: Column(
            children: [
              UISoftGradientCardLight(
                height: 82,
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    Icon(Icons.store_outlined, size: 26, color: baseColor),
                    const SizedBox(width: 10),
                    Text(
                      'Lojas',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              UISoftGradientCardLight(
                height: 82,
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    Icon(Icons.star_outline, size: 26, color: baseColor),
                    const SizedBox(width: 10),
                    Text(
                      'Favoritos',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SearchFakeField extends StatelessWidget {
  final VoidCallback onTap;

  const SearchFakeField({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey[500]),
            const SizedBox(width: 8),
            Text(
              'Buscar serviços, locais...',
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }
}

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

class RecentIncidentsList extends StatelessWidget {
  final List<RecentIncidentItem> items;
  final VoidCallback? onSeeAll;

  const RecentIncidentsList({
    super.key,
    required this.items,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ===============================
        // Header
        // ===============================
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Incidentes recentes',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            if (onSeeAll != null)
              TextButton(
                onPressed: onSeeAll,
                child: const Text('Ver todos'),
              ),
          ],
        ),

        const SizedBox(height: 12),

        // ===============================
        // List
        // ===============================
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length.clamp(0, 5),
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final item = items[index];

            return GestureDetector(
              onTap: item.onTap,
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey.withOpacity(0.15)),
                ),
                child: Row(
                  children: [
                    // ===============================
                    // Avatar / Image
                    // ===============================
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(item.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // ===============================
                    // Texts
                    // ===============================
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined,
                                  size: 14, color: Colors.grey[500]),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  item.location,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.grey[600]),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 8),

                    // ===============================
                    // Chevron
                    // ===============================
                    const Icon(Icons.chevron_right_rounded, color: Colors.grey),
                  ],
                ),
              ),
            );
          },
        ),
      ],
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

class SearchFakeFieldV2 extends StatelessWidget {
  final VoidCallback onTap;
  final String hint;

  const SearchFakeFieldV2({
    super.key,
    required this.onTap,
    this.hint = 'Buscar incidentes, locais ou serviços',
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.withOpacity(0.18)),
        ),
        child: Row(
          children: [
            // Icon badge
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.search,
                size: 20,
                color: theme.primaryColor,
              ),
            ),

            const SizedBox(width: 12),

            // Hint text
            Expanded(
              child: Text(
                hint,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ),

            // CTA hint
            Text(
              'Buscar',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LocationIndicatorCard extends StatelessWidget {
  final String location;
  final VoidCallback? onTap;
  final Color baseColor;

  const LocationIndicatorCard({
    super.key,
    required this.location,
    this.onTap,
    this.baseColor = const Color(0xFF2B5BEE),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: baseColor.withOpacity(0.06),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: baseColor.withOpacity(0.15),
          ),
        ),
        child: Row(
          children: [
            // Icon badge
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: baseColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.my_location_outlined,
                size: 18,
                color: baseColor,
              ),
            ),

            const SizedBox(width: 12),

            // Texts
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Localização atual',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Travessa Francisco Alves da Silva',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    location,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),

            // Optional action indicator
            if (onTap != null)
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.grey,
              ),
          ],
        ),
      ),
    );
  }
}
