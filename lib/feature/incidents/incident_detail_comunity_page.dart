import 'dart:ui';
import 'package:deehelp/core/extension/date_extension.dart';
import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/extension/time_extension.dart';
import 'package:deehelp/core/services/permissions/location/domain/current_location.dart';
import 'package:deehelp/core/services/permissions/location/providers/location_providers.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/buttons/button_primary.dart';
import 'package:deehelp/core/ui/widgets/image/custom_network_image.dart';
import 'package:deehelp/core/utils/enum_utils.dart';
import 'package:deehelp/core/utils/url_launcher_utils.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/feature/search/search_page_v2.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/module/item/domain/entities/image_media.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncidentDetailComunityPage extends ConsumerWidget {
  final IncidentOutput? incident;
  const IncidentDetailComunityPage({super.key, this.incident});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocation = ref.watch(currentLocationProvider);
    final theme = Theme.of(context);

    final distance = _calculateDistance(incident, currentLocation);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0F),
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: IncidentPhotosCard(
                  height: 250.h,
                  incidentId: incident?.alertId ?? '',
                  incidentCreated: incident?.occurredAt ?? DateTime.now(),
                  photos: incident?.product.images ?? [],
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
                        children: [
                          const _Pill(
                            label: 'ROUBO',
                            icon: Icons.warning_amber_rounded,
                            bgColor: Color(0x22FF5A5F),
                            textColor: Color(0xFFFF6B6F),
                          ),
                          const _Pill(
                            label: 'ATIVO',
                            icon: Icons.bolt_rounded,
                            bgColor: Color(0x222E6BFF),
                            textColor: Color(0xFF7DA2FF),
                          ),
                          if (distance != null) ...[
                            _Pill(
                              // label: '1,8 km',
                              label: distance,
                              icon: Icons.near_me_rounded,
                              bgColor: const Color(0x22FFFFFF),
                              textColor: const Color(0xFFE7E7EA),
                            ),
                          ],
                        ],
                      ),

                      const SizedBox(height: 18),

                      /// Título
                      Text(
                        EnumUtils.fromString(
                                ItemType.values, incident?.productType)
                            .labelRouberry,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w800,
                          height: 1.05,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        _getProductDescription(incident),
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: const Color(0xFFB8B8C2),
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 24),

                      _InfoTile(
                        icon: Icons.calendar_month_rounded,
                        title: 'Ocorrido em',
                        subtitle: incident != null
                            ? '${incident?.occurredAt.toDateWithFullMonth()} as ${incident?.occurredAtTime.to24hFormat()}'
                            : 'Não informado',
                      ),

                      const Divider(color: Color(0xFF1E1F26), height: 28),

                      _InfoTile(
                        icon: Icons.location_on_rounded,
                        title: 'Local',
                        // subtitle:
                        //     'Rua Galvão Bueno, 352 • Liberdade • São Paulo, SP',
                        subtitle: incident != null
                            ? '${incident?.local?.address} • ${incident?.local?.city} • ${incident?.local?.state}'
                            : "Não informado",
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
                              width: 45.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1C1D24),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                incident == null
                                    ? CupertinoIcons.cube_box
                                    : EnumUtils.fromString(ItemType.values,
                                            incident!.productType)
                                        .icon,
                                // color: const Color(0xFF7DA2FF),
                                color: AppColors.primaryColor,
                                size: 25.w,
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
                                    incident != null
                                        ? incident!.product.name
                                        : "Não informado",
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _details(incident),
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
                        incident?.howTo ?? 'Não informado',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFFD6D6DC),
                          height: 1.55,
                        ),
                      ),

                      const SizedBox(height: 24),

                      Row(
                        children: [
                          Expanded(
                            child: _MetricCard(
                              label: 'Verificado',
                              value:
                                  incident?.visibilty == true ? "Sim" : "Não",
                              icon: Icons.verified_rounded,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _MetricCard(
                              label: 'Região',
                              value: incident?.local?.city ?? 'NI',
                              icon: Icons.public_rounded,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(
                            child: _MetricCard(
                              label: 'Publicado',
                              value: incident?.createdAt.timeAgo() ?? 'NI',
                              icon: Icons.schedule_rounded,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _MetricCard(
                              label: 'Fonte',
                              value: incident != null
                                  ? incident!.isPlatformGenerated
                                      ? "Civi"
                                      : "Comunidade"
                                  : "NI",
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
                      Expanded(
                        child: ButtonPrimary(
                          press: () => UrlLauncherUtils.shareIncident(
                            context,
                            incident!.alertId,
                            incident!.occurredAt,
                          ),
                          text: "Compartilhar",
                        ),
                      ),
                      // SizedBox(
                      //   height: 52,
                      //   child: FilledButton.icon(
                      //     style: FilledButton.styleFrom(
                      //       backgroundColor: const Color(0xFF2E6BFF),
                      //       foregroundColor: Colors.white,
                      //       padding: const EdgeInsets.symmetric(
                      //         horizontal: 20,
                      //       ),
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(18),
                      //       ),
                      //     ),
                      //     onPressed: () {},
                      //     icon: const Icon(Icons.map_rounded),
                      //     label: const Text('Ver no mapa'),
                      //   ),
                      // ),
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

  String? _calculateDistance(
      IncidentOutput? incident, CurrentLocation? currentLocation) {
    if (currentLocation == null) return null;
    if (incident?.local?.latitue == null ||
        incident?.local?.longitude == null) {
      return null;
    }
    return DistanceUtils.formatDistance(
      startLatitude: incident!.local!.latitue!,
      startLongitude: incident.local!.longitude!,
      endLatitude: currentLocation.latitude,
      endLongitude: currentLocation.longitude,
    );
  }

  String _getProductDescription(IncidentOutput? incident) {
    if (incident?.productType == ItemType.phone.name) {
      return "${incident?.product.brand} ${incident?.product.name} • ${incident?.product.color} • IMEI ${incident?.product.code}";
    }

    return "${incident?.product.brand} ${incident?.product.name} • ${incident?.product.color} • placa ${incident?.product.code}";
  }

  String _details(IncidentOutput? incident) {
    if (incident == null) return '';
    if (EnumUtils.fromString(ItemType.values, incident.productType) ==
        ItemType.phone) {
      return 'Cor ${incident.product.color} • Código ${incident.alertId} ';
    }

    return 'Cor ${incident.product.color} • Ano ${incident.product.year} • Código ${incident.alertId} ';
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
            width: 42.w,
            height: 42.h,
            decoration: BoxDecoration(
              color: const Color(0xFF1C1D24),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              // color: const Color(0xFF7DA2FF),
              color: AppColors.primaryColor,
              size: 20.w,
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
  final String incidentId;
  final DateTime incidentCreated;
  final List<ImageMedia> photos;
  final double height;
  final VoidCallback? onBack;
  final VoidCallback? onShare;
  final VoidCallback? onBookmark;

  const IncidentPhotosCard({
    super.key,
    required this.photos,
    required this.incidentId,
    required this.incidentCreated,
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
      margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFF121319),
        // borderRadius: BorderRadius.circular(28),
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
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.white54,
                        size: 42.w,
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
                      return CustomNetworkImage(
                        imageUrl: photos[index].value,
                      );
                      // return Image.network(
                      //   photos[index],
                      //   fit: BoxFit.cover,
                      // );
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
            top: context.topPadding + 10,
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
                  onTap: widget.onShare ??
                      () => UrlLauncherUtils.shareIncident(
                          context, widget.incidentId, widget.incidentCreated),
                ),
                // const SizedBox(width: 10),
                // _GlassCircleButton(
                //   icon: Icons.bookmark_border_rounded,
                //   onTap: widget.onBookmark ?? () {},
                // ),
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
