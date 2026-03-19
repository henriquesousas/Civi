import 'dart:ui';
import 'package:flutter/material.dart';

class TesteDetailPage extends StatelessWidget {
  const TesteDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final incident = CiviIncidentDetailsModel(
      title: 'Moto roubada',
      subtitle: 'Honda CG 160 Fan • preta • placa final 42',
      photos: [
        'https://images.unsplash.com/photo-1558981806-ec527fa84c39?q=80&w=1200&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1517846693594-1567da72af75?q=80&w=1200&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1502877338535-766e1452684a?q=80&w=1200&auto=format&fit=crop',
      ],
      occurredAt: DateTime.now(),
      address: 'Rua Galvão Bueno, 352',
      neighborhood: 'Liberdade',
      city: 'São Paulo',
      description:
          'A vítima informou que a moto foi levada por dois suspeitos armados. A ocorrência segue ativa e foi compartilhada com a comunidade.',
      status: 'Ativo',
      distanceText: '1,8 km',
      verified: true,
      source: 'Comunidade',
      itemName: 'Honda CG 160 Fan',
      itemMeta: 'Cor preta • Ano 2022 • Código CIVI-2048',
    );

    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0F),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // SliverAppBar(
              //   backgroundColor: const Color(0xFF0B0B0F),
              //   expandedHeight: 300,
              //   pinned: true,
              //   elevation: 0,
              //   leading: _CircleIconButton(
              //     icon: Icons.arrow_back_ios_new_rounded,
              //     onTap: () => Navigator.pop(context),
              //   ),
              //   actions: [
              //     _CircleIconButton(
              //       icon: Icons.share_outlined,
              //       onTap: () {},
              //     ),
              //     const SizedBox(width: 8),
              //     _CircleIconButton(
              //       icon: Icons.bookmark_border_rounded,
              //       onTap: () {},
              //     ),
              //     const SizedBox(width: 12),
              //   ],
              //   flexibleSpace: FlexibleSpaceBar(
              //     background: Stack(
              //       fit: StackFit.expand,
              //       children: [
              //         Image.network(
              //           'https://images.unsplash.com/photo-1547447134-cd3f5c716030?q=80&w=1200&auto=format&fit=crop',
              //           fit: BoxFit.cover,
              //         ),
              //         const DecoratedBox(
              //           decoration: BoxDecoration(
              //             gradient: LinearGradient(
              //               begin: Alignment.topCenter,
              //               end: Alignment.bottomCenter,
              //               colors: [
              //                 Colors.transparent,
              //                 Colors.transparent,
              //                 Color(0xAA0B0B0F),
              //                 Color(0xFF0B0B0F),
              //               ],
              //               stops: [0.0, 0.45, 0.78, 1.0],
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SliverToBoxAdapter(
                child: IncidentPhotosCard(
                  photos: incident.photos,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Tipo + status
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: const [
                          _Pill(
                            label: 'ROUBO',
                            icon: Icons.warning_amber_rounded,
                            bgColor: Color(0x22FF5A5F),
                            textColor: Color(0xFFFF6B6F),
                          ),
                          _Pill(
                            label: 'ATIVO',
                            icon: Icons.bolt_rounded,
                            bgColor: Color(0x222E6BFF),
                            textColor: Color(0xFF7DA2FF),
                          ),
                          _Pill(
                            label: '1,8 km',
                            icon: Icons.near_me_rounded,
                            bgColor: Color(0x22FFFFFF),
                            textColor: Color(0xFFE7E7EA),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      /// Título
                      Text(
                        'Moto roubada',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          height: 1.05,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        'Honda CG 160 Fan • preta • placa final 42',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: const Color(0xFFB8B8C2),
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 24),

                      const _InfoTile(
                        icon: Icons.calendar_month_rounded,
                        title: 'Ocorrido em',
                        subtitle: 'sábado, 28 março 2026 • 14:30',
                      ),

                      const Divider(color: Color(0xFF1E1F26), height: 28),

                      const _InfoTile(
                        icon: Icons.location_on_rounded,
                        title: 'Local',
                        subtitle:
                            'Rua Galvão Bueno, 352 • Liberdade • São Paulo, SP',
                        trailingIcon: Icons.map_outlined,
                      ),

                      const SizedBox(height: 18),

                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF13141A),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.05),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 58,
                              height: 58,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1C1D24),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                Icons.two_wheeler_rounded,
                                color: Color(0xFF7DA2FF),
                                size: 30,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Item relacionado',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: const Color(0xFF8E90A0),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Honda CG 160 Fan',
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Cor preta • Ano 2022 • Código CIVI-2048',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: const Color(0xFFB8B8C2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      Text(
                        'Descrição',
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        'A vítima informou que a moto foi levada por dois suspeitos armados na região da Liberdade. '
                        'O veículo estava estacionado próximo ao comércio local. '
                        'A ocorrência segue ativa e foi compartilhada com a comunidade para aumentar as chances de localização.',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFFD6D6DC),
                          height: 1.55,
                        ),
                      ),

                      const SizedBox(height: 24),

                      Row(
                        children: const [
                          Expanded(
                            child: _MetricCard(
                              label: 'Verificado',
                              value: 'Sim',
                              icon: Icons.verified_rounded,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: _MetricCard(
                              label: 'Região',
                              value: 'Centro',
                              icon: Icons.public_rounded,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: const [
                          Expanded(
                            child: _MetricCard(
                              label: 'Publicado',
                              value: 'há 12 min',
                              icon: Icons.schedule_rounded,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: _MetricCard(
                              label: 'Fonte',
                              value: 'Comunidade',
                              icon: Icons.groups_rounded,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          /// bottom action
          Positioned(
            left: 16,
            right: 16,
            bottom: 18,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(26),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF121319).withValues(alpha: 0.92),
                    borderRadius: BorderRadius.circular(26),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.06),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.24),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Ocorrência ativa',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 52,
                        child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xFF2E6BFF),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onPressed: () {},
                          icon: const Icon(Icons.map_rounded),
                          label: const Text('Ver no mapa'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
        child: Ink(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.30),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.05),
            ),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final IconData? trailingIcon;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFF15161D),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: const Color(0xFFFD9B5A),
            size: 22,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF8E90A0),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
        if (trailingIcon != null)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Icon(
              trailingIcon,
              color: const Color(0xFF9FA3B4),
            ),
          ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _MetricCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF13141A),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFF1C1D24),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF7DA2FF),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF8E90A0),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color bgColor;
  final Color textColor;

  const _Pill({
    required this.label,
    required this.icon,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.04),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: textColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class CiviIncidentDetailsModel {
  final String title;
  final String subtitle;
  final List<String> photos;
  final DateTime occurredAt;
  final String address;
  final String neighborhood;
  final String city;
  final String description;
  final String status;
  final String distanceText;
  final bool verified;
  final String source;
  final String itemName;
  final String itemMeta;

  CiviIncidentDetailsModel({
    required this.title,
    required this.subtitle,
    required this.photos,
    required this.occurredAt,
    required this.address,
    required this.neighborhood,
    required this.city,
    required this.description,
    required this.status,
    required this.distanceText,
    required this.verified,
    required this.source,
    required this.itemName,
    required this.itemMeta,
  });
}

class IncidentPhotosCard extends StatefulWidget {
  final List<String> photos;
  final double height;
  final VoidCallback? onBack;
  final VoidCallback? onShare;
  final VoidCallback? onBookmark;

  const IncidentPhotosCard({
    super.key,
    required this.photos,
    this.height = 300,
    this.onBack,
    this.onShare,
    this.onBookmark,
  });

  @override
  State<IncidentPhotosCard> createState() => _IncidentPhotosCardState();
}

class _IncidentPhotosCardState extends State<IncidentPhotosCard> {
  late final PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final photos = widget.photos;

    return Container(
      height: widget.height,
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFF121319),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: photos.isEmpty
                ? Container(
                    color: const Color(0xFF181A22),
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.white54,
                        size: 42,
                      ),
                    ),
                  )
                : PageView.builder(
                    controller: _pageController,
                    itemCount: photos.length,
                    onPageChanged: (index) {
                      setState(() => currentIndex = index);
                    },
                    itemBuilder: (_, index) {
                      return Image.network(
                        photos[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
          ),

          /// gradiente superior
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.34),
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.58),
                    ],
                    stops: const [0.0, 0.18, 0.56, 1.0],
                  ),
                ),
              ),
            ),
          ),

          /// ações topo
          Positioned(
            top: 14,
            left: 14,
            right: 14,
            child: Row(
              children: [
                _GlassCircleButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: widget.onBack ?? () => Navigator.pop(context),
                ),
                const Spacer(),
                _GlassCircleButton(
                  icon: Icons.share_outlined,
                  onTap: widget.onShare ?? () {},
                ),
                const SizedBox(width: 10),
                _GlassCircleButton(
                  icon: Icons.bookmark_border_rounded,
                  onTap: widget.onBookmark ?? () {},
                ),
              ],
            ),
          ),

          /// contador
          if (photos.length > 1)
            Positioned(
              top: 68,
              right: 14,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.34),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.06),
                      ),
                    ),
                    child: Text(
                      '${currentIndex + 1}/${photos.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          /// indicadores
          if (photos.length > 1)
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  photos.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentIndex == index ? 22 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.38),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _GlassCircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _GlassCircleButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Material(
          color: Colors.black.withValues(alpha: 0.28),
          child: InkWell(
            onTap: onTap,
            child: SizedBox(
              width: 42,
              height: 42,
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
