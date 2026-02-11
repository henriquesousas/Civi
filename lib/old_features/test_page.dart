import 'dart:async';

import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final _bg = const Color(0xFFF6F8FC);
  final _surface = Colors.white;
  final _ink = const Color(0xFF121826);
  final _muted = const Color(0xFF6B7280);
  final _border = const Color(0xFFE7ECF5);

  late final ScrollController _scrollController;
  bool _fabVisible = true;

// opcional: evita “piscadas” se o dedo tremular
  Timer? _fabDebounce;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _fabDebounce?.cancel();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final dir = _scrollController.position.userScrollDirection;

    // 👆 dedo sobe (lista desce) -> FAB some descendo
    if (dir == ScrollDirection.reverse && _fabVisible) {
      setState(() => _fabVisible = false);
      return;
    }

    // 👇 dedo desce (lista sobe) -> FAB aparece subindo
    if (dir == ScrollDirection.forward && !_fabVisible) {
      setState(() => _fabVisible = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            toolbarHeight: kToolbarHeight,
            collapsedHeight: kToolbarHeight,

            backgroundColor: AppColors.primaryColor,
            // pinned: true,
            // floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primaryColor,
                        AppColors.primaryColor.withValues(alpha: 0.92),
                        AppColors.primaryColor.withValues(alpha: 0.82),
                      ],
                    ),
                  ),
                  child: Column(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _Avatar(
                            size: 44,
                            imageUrl: null,
                            fallbackIcon: Icons.person_rounded,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Olá,',
                                  style: TextStyle(
                                    color: Colors.white.withValues(
                                      alpha: 0.90,
                                    ),
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Paulo',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // _HeaderIconButton(
                          //   onPressed: () {},
                          //   icon: Icons.notifications_none_rounded,
                          // ),
                          // const SizedBox(width: 8),
                          // _HeaderIconButton(
                          //   onPressed: () {},
                          //   icon: Icons.help_outline_rounded,
                          // ),
                        ],
                      ),
                      Column(
                        children: [
                          _BlueInfoCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _UserAddressHeader(
                                  cityState: 'São Paulo, SP',
                                  streetLine: 'Av. Paulista, 1000 • Bela Vista',
                                  riskLabel: 'Risco: Médio',
                                ),
                                const SizedBox(height: 20),
                                _LocationSearchField(
                                  hint: 'Buscar bairro, cidade ou CEP',
                                  onUseGps: () {},
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverAppBar(
            backgroundColor: AppColors.white,
            expandedHeight: 120,
            toolbarHeight: 180,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Ações rapida",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildQuickAction(icon: Icons.send, label: 'Meus itens'),
                      _buildQuickAction(
                          icon: Icons.receipt, label: 'Ocorrências'),
                      _buildQuickAction(icon: Icons.add, label: 'SOS'),
                      _buildQuickAction(icon: Icons.add, label: 'SOS'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Corpo
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Ocorrências recentes',
                      style: TextStyle(
                        color: _ink,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ver tudo',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // mock
                  final item = _RecentIncident(
                    title: index.isEven ? 'Furto de celular' : 'Roubo de moto',
                    location: 'A 1.2 km • Vila Mariana',
                    time: index.isEven ? 'há 18 min' : 'há 1h',
                    kind: index.isEven
                        ? _IncidentKind.theft
                        : _IncidentKind.robbery,
                  );

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _RecentIncidentCard(
                      surface: _surface,
                      border: _border,
                      ink: _ink,
                      muted: _muted,
                      item: item,
                      onTap: () {},
                    ),
                  );
                },
                childCount: 8,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 22),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: _surface,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: _border),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 18,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        Icons.tips_and_updates_rounded,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Dica: cadastre seus itens (placa/IMEI). Isso agiliza o registro e aumenta as chances de recuperação.',
                        style: TextStyle(
                          color: _muted,
                          fontSize: 13,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox.shrink(),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   backgroundColor: AppColors.primaryColor, // verde elegante
      //   foregroundColor: Colors.white,
      //   icon: const Icon(Icons.add_rounded),
      //   label: const Text(
      //     'Reportar ocorrência',
      //     style: TextStyle(fontWeight: FontWeight.w700),
      //   ),
      // ),
      floatingActionButton: _SlideFab(
        visible: _fabVisible,
        child: FloatingActionButton.extended(
          elevation: 4,
          onPressed: () {},
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          icon: const Icon(Icons.campaign),
          label: const Text(
            'Reportar ocorrência',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      // floatingActionButton: _buildAnimatedFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // Widget _buildAnimatedFab() {
  //   return AnimatedSlide(
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeInOut,
  //     offset: _isFabVisible ? Offset.zero : const Offset(0, 2),
  //     child: AnimatedOpacity(
  //       duration: const Duration(milliseconds: 300),
  //       opacity: _isFabVisible ? 1.0 : 0.0,
  //       child: Container(
  //         margin: const EdgeInsets.only(bottom: 20),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(30),
  //           boxShadow: [
  //             BoxShadow(
  //               color: AppColors.primaryColor.withOpacity(0.3),
  //               blurRadius: 15,
  //               offset: const Offset(0, 6),
  //             ),
  //           ],
  //         ),
  //         child: FloatingActionButton.extended(
  //           onPressed: () {
  //             // Navegar para tela de reportar ocorrência
  //           },
  //           backgroundColor: AppColors.primaryColor,
  //           foregroundColor: Colors.white,
  //           elevation: 0,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(30),
  //           ),
  //           icon: Container(
  //             width: 28,
  //             height: 28,
  //             decoration: BoxDecoration(
  //               color: Colors.white.withOpacity(0.2),
  //               borderRadius: BorderRadius.circular(14),
  //             ),
  //             child: const Icon(
  //               Icons.add_alert_rounded,
  //               size: 18,
  //             ),
  //           ),
  //           label: const Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 8),
  //             child: Text(
  //               'Reportar Ocorrência',
  //               style: TextStyle(
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.w700,
  //                 letterSpacing: 0.2,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildAnimatedFab2() {
  //   return AnimatedContainer(
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeInOut,
  //     margin: EdgeInsets.only(bottom: _isFabVisible ? 20 : -100),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(30),
  //         boxShadow: [
  //           BoxShadow(
  //             color:
  //                 AppColors.primaryColor.withOpacity(_isFabVisible ? 0.3 : 0.0),
  //             blurRadius: 15,
  //             offset: const Offset(0, 6),
  //           ),
  //         ],
  //       ),
  //       child: FloatingActionButton.extended(
  //         onPressed: () {
  //           // Navegar para tela de reportar ocorrência
  //         },
  //         backgroundColor: AppColors.primaryColor,
  //         foregroundColor: Colors.white,
  //         elevation: 0,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(30),
  //         ),
  //         icon: AnimatedOpacity(
  //           duration: const Duration(milliseconds: 200),
  //           opacity: _isFabVisible ? 1.0 : 0.0,
  //           child: Container(
  //             width: 28,
  //             height: 28,
  //             decoration: BoxDecoration(
  //               color: Colors.white.withOpacity(0.2),
  //               borderRadius: BorderRadius.circular(14),
  //             ),
  //             child: const Icon(
  //               Icons.add_alert_rounded,
  //               size: 18,
  //             ),
  //           ),
  //         ),
  //         label: AnimatedOpacity(
  //           duration: const Duration(milliseconds: 200),
  //           opacity: _isFabVisible ? 1.0 : 0.0,
  //           child: const Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 8),
  //             child: Text(
  //               'Reportar Ocorrência',
  //               style: TextStyle(
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.w700,
  //                 letterSpacing: 0.2,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildQuickAction({
    required IconData icon,
    required String label,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.primaryColor.withValues(alpha: 0.1),
          child: Icon(
            icon,
            color: AppColors.primaryColor,
            size: 30,
          ),
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(fontSize: 14),
        )
      ],
    );
  }
}

/// ===============================
/// Widgets / Models
/// ===============================

class _HeaderIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const _HeaderIconButton({
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onPressed,
      child: Ink(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.16),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.20),
          ),
        ),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final double size;
  final String? imageUrl;
  final IconData fallbackIcon;

  const _Avatar({
    required this.size,
    required this.imageUrl,
    required this.fallbackIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(size / 2),
        border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
      ),
      child: Center(
        child: Icon(
          fallbackIcon,
          color: Colors.white.withValues(alpha: 0.92),
          size: size * 0.52,
        ),
      ),
    );
  }
}

class _BlueInfoCard extends StatelessWidget {
  final Widget child;
  const _BlueInfoCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.18),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 18,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: DefaultTextStyle.merge(
        style: const TextStyle(color: Colors.white),
        child: child,
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String text;
  const _Pill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.22)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.95),
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String value;
  final String sub;

  const _MiniStat({
    required this.label,
    required this.value,
    required this.sub,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.82),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            sub,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.80),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionChip extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isPrimary;

  const _QuickActionChip({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    final baseBg = isPrimary
        ? Colors.white.withValues(alpha: 0.18)
        : Colors.white.withValues(alpha: 0.14);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        width: 210,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: baseBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: isPrimary ? 0.20 : 0.16),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.82),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: Colors.white.withValues(alpha: 0.85),
            ),
          ],
        ),
      ),
    );
  }
}

enum _IncidentKind { theft, robbery, recovered }

class _RecentIncident {
  final String title;
  final String location;
  final String time;
  final _IncidentKind kind;

  _RecentIncident({
    required this.title,
    required this.location,
    required this.time,
    required this.kind,
  });
}

class _RecentIncidentCard extends StatelessWidget {
  final Color surface;
  final Color border;
  final Color ink;
  final Color muted;

  final _RecentIncident item;
  final VoidCallback onTap;

  const _RecentIncidentCard({
    required this.surface,
    required this.border,
    required this.ink,
    required this.muted,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final (tagText, tagColor, tagBg) = switch (item.kind) {
      _IncidentKind.theft => (
          'Furto',
          const Color(0xFFB45309),
          const Color(0xFFFFF7ED),
        ),
      _IncidentKind.robbery => (
          'Roubo',
          const Color(0xFFB91C1C),
          const Color(0xFFFEF2F2),
        ),
      _IncidentKind.recovered => (
          'Recuperado',
          const Color(0xFF166534),
          const Color(0xFFF0FDF4),
        ),
    };

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Ink(
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: border),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 18,
              offset: Offset(0, 10),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  item.kind == _IncidentKind.theft
                      ? Icons.smartphone_rounded
                      : Icons.two_wheeler_rounded,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: ink,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: tagBg,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            tagText,
                            style: TextStyle(
                              color: tagColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.place_rounded, size: 16, color: muted),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            item.location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: muted,
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(Icons.schedule_rounded, size: 16, color: muted),
                        const SizedBox(width: 6),
                        Text(
                          item.time,
                          style: TextStyle(
                            color: muted,
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.chevron_right_rounded, color: muted),
            ],
          ),
        ),
      ),
    );
  }
}

class _LocationSearchField extends StatelessWidget {
  final String hint;
  final VoidCallback onTap;
  final VoidCallback onUseGps;

  const _LocationSearchField({
    required this.hint,
    required this.onTap,
    required this.onUseGps,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Ink(
        height: 46,
        decoration: BoxDecoration(
          // 🔹 azul fraco elegante
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.28),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            Icon(
              Icons.search_rounded,
              color: Colors.white.withValues(alpha: 0.90),
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                hint,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            IconButton(
              onPressed: onUseGps,
              splashRadius: 20,
              icon: Icon(
                Icons.my_location_rounded,
                color: Colors.white.withValues(alpha: 0.90),
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserAddressHeader extends StatelessWidget {
  final String cityState;
  final String streetLine;
  final String? riskLabel;

  const _UserAddressHeader({
    required this.cityState,
    required this.streetLine,
    this.riskLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.location_on_rounded,
          color: Colors.white.withValues(alpha: 0.92),
          size: 18,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cityState,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                streetLine,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        // if (riskLabel != null) ...[
        //   const SizedBox(width: 8),
        //   _Pill(text: riskLabel!),
        // ],
      ],
    );
  }
}

class _AnimatedFab extends StatelessWidget {
  final bool visible;
  final Widget child;

  const _AnimatedFab({
    required this.visible,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !visible,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        // ✅ some descendo / aparece subindo
        offset: visible ? Offset.zero : const Offset(0, 0.70),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          opacity: visible ? 1.0 : 0.0,
          child: child,
        ),
      ),
    );
  }
}

class _SlideFab extends StatelessWidget {
  final bool visible;
  final Widget child;

  const _SlideFab({
    required this.visible,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !visible,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
        // ✅ some descendo / aparece subindo
        // offset: visible ? Offset.zero : const Offset(0, 1.15),
        offset: visible ? Offset.zero : const Offset(0, 2.0),
        child: AnimatedScale(
          // ✅ dá sensação de “sumir” sem opacity
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutCubic,
          scale: visible ? 1.0 : 0.99,
          child: child,
        ),
      ),
    );
  }
}
