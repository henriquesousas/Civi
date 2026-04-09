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
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncidentDetailComunityPage extends ConsumerWidget {
  final IncidentOutput? incident;

  const IncidentDetailComunityPage({
    super.key,
    this.incident,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocation = ref.watch(currentLocationProvider);
    final theme = Theme.of(context);

    final data = _IncidentDetailPresenter.fromIncident(
      incident,
      currentLocation,
    );

    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: _IncidentHeroSection(
                  incidentId: data.alertId,
                  incidentCreated: data.occurredAt,
                  photos: data.photos,
                  height: 280.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 130),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _StatusPill(
                            label: data.categoryLabel,
                            icon: Icons.warning_amber_rounded,
                            bgColor: const Color(0x22FF5A5F),
                            textColor: const Color(0xFFFF6B6F),
                          ),
                          if (data.distanceText != null)
                            _StatusPill(
                              label: data.distanceText!,
                              icon: Icons.near_me_rounded,
                              bgColor: context.primaryBgCardLow,
                              textColor: context.primaryTextColor,
                            ),
                          if (data.isVerified)
                            _StatusPill(
                              label: 'Verificado',
                              icon: Icons.verified_rounded,
                              bgColor: AppColors.primaryColor
                                  .withValues(alpha: 0.10),
                              textColor: AppColors.primaryColor,
                            ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        data.title,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: context.primaryTextColor,
                          fontWeight: FontWeight.w800,
                          height: 1.05,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        data.subtitle,
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: context.secondaryTextColor,
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _SectionCard(
                        child: Column(
                          children: [
                            _InfoRow(
                              icon: Icons.calendar_month_rounded,
                              title: 'Ocorrido em',
                              subtitle: data.occurredAtText,
                            ),
                            _SectionDivider(),
                            _InfoRow(
                              icon: Icons.location_on_rounded,
                              title: 'Local',
                              subtitle: data.locationText,
                              trailingIcon: Icons.map_outlined,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      _ItemHighlightCard(
                        icon: data.itemIcon,
                        title: 'Item relacionado',
                        name: data.itemName,
                        subtitle: data.itemDetails,
                      ),
                      const SizedBox(height: 24),
                      const _SectionTitle(
                        title: 'Descrição',
                        subtitle: 'Detalhes informados sobre a ocorrência',
                      ),
                      const SizedBox(height: 12),
                      _DescriptionCard(
                        text: data.description,
                      ),
                      const SizedBox(height: 24),
                      _SectionTitle(
                        title: 'Resumo',
                        subtitle: 'Informações rápidas da ocorrência',
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _MetricCard(
                              label: 'Verificado',
                              value: data.isVerified ? 'Sim' : 'Não',
                              icon: Icons.verified_rounded,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _MetricCard(
                              label: 'Região',
                              value: data.regionLabel,
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
                              value: data.publishedAtLabel,
                              icon: Icons.schedule_rounded,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _MetricCard(
                              label: 'Fonte',
                              value: data.sourceLabel,
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
          _BottomActionBar(
            title: 'Ocorrência ativa',
            onShare: incident == null
                ? null
                : () => UrlLauncherUtils.shareIncident(
                      context,
                      incident!.alertId,
                      incident!.occurredAt,
                    ),
          ),
        ],
      ),
    );
  }
}

class _IncidentDetailPresenter {
  final String alertId;
  final DateTime occurredAt;
  final List<ImageMedia> photos;
  final String title;
  final String subtitle;
  final String categoryLabel;
  final String occurredAtText;
  final String locationText;
  final String description;
  final String regionLabel;
  final String publishedAtLabel;
  final String sourceLabel;
  final String itemName;
  final String itemDetails;
  final String? distanceText;
  final bool isVerified;
  final IconData itemIcon;

  const _IncidentDetailPresenter({
    required this.alertId,
    required this.occurredAt,
    required this.photos,
    required this.title,
    required this.subtitle,
    required this.categoryLabel,
    required this.occurredAtText,
    required this.locationText,
    required this.description,
    required this.regionLabel,
    required this.publishedAtLabel,
    required this.sourceLabel,
    required this.itemName,
    required this.itemDetails,
    required this.distanceText,
    required this.isVerified,
    required this.itemIcon,
  });

  factory _IncidentDetailPresenter.fromIncident(
    IncidentOutput? incident,
    CurrentLocation? currentLocation,
  ) {
    final itemType = incident == null
        ? ItemType.car
        : EnumUtils.fromString(ItemType.values, incident.productType);

    final distanceText = _calculateDistance(incident, currentLocation);

    return _IncidentDetailPresenter(
      alertId: incident?.alertId ?? '',
      occurredAt: incident?.occurredAt ?? DateTime.now(),
      photos: incident?.product?.images ?? [],
      title: _buildTitle(incident, itemType),
      subtitle: _buildSubtitle(incident, itemType),
      categoryLabel: itemType.labelRouberry,
      occurredAtText: incident != null
          ? '${incident.occurredAt.toDateWithFullMonth()} às ${incident.occurredAtTime.to24hFormat()}'
          : 'Não informado',
      locationText: _buildLocation(incident),
      description: incident?.howTo?.trim().isNotEmpty == true
          ? incident!.howTo!
          : 'Nenhuma descrição adicional foi informada para esta ocorrência.',
      regionLabel: incident?.local?.city?.trim().isNotEmpty == true
          ? incident!.local!.city!
          : 'Não informado',
      publishedAtLabel: incident?.createdAt.timeAgo() ?? 'Não informado',
      sourceLabel: incident == null
          ? 'Não informado'
          : incident.isPlatformGenerated
              ? 'Civi'
              : 'Comunidade',
      itemName: incident?.product?.name?.trim().isNotEmpty == true
          ? incident!.product!.name!
          : 'Item não informado',
      itemDetails: _buildItemDetails(incident, itemType),
      distanceText: distanceText,
      isVerified: incident?.visibilty == true,
      itemIcon: itemType.icon,
    );
  }

  static String? _calculateDistance(
    IncidentOutput? incident,
    CurrentLocation? currentLocation,
  ) {
    if (incident == null || currentLocation == null) return null;
    if (incident.local?.latitue == null || incident.local?.longitude == null) {
      return null;
    }

    return DistanceUtils.formatDistance(
      startLatitude: incident.local!.latitue!,
      startLongitude: incident.local!.longitude!,
      endLatitude: currentLocation.latitude,
      endLongitude: currentLocation.longitude,
    );
  }

  static String _buildTitle(IncidentOutput? incident, ItemType itemType) {
    final productName = incident?.product?.name;

    if (productName != null && productName.trim().isNotEmpty) {
      if (itemType == ItemType.moto) return '$productName roubada';
      return '$productName roubado';
    }

    return itemType.labelRouberry;
  }

  static String _buildSubtitle(IncidentOutput? incident, ItemType itemType) {
    final brand = incident?.product?.brand;
    final name = incident?.product?.name;
    final color = incident?.product?.color;
    final code = incident?.product?.code;

    final parts = <String>[];

    final brandAndName =
        [brand, name].where((e) => e != null && e.trim().isNotEmpty).join(' ');
    if (brandAndName.isNotEmpty) parts.add(brandAndName);

    if (color != null && color.trim().isNotEmpty) {
      parts.add(color);
    }

    if (code != null && code.trim().isNotEmpty) {
      parts.add(itemType == ItemType.phone ? 'IMEI $code' : 'Placa $code');
    }

    if (parts.isEmpty) {
      return 'Informações do item não disponíveis';
    }

    return parts.join(' • ');
  }

  static String _buildLocation(IncidentOutput? incident) {
    final parts = <String>[
      if (incident?.local?.address?.trim().isNotEmpty == true)
        incident!.local!.address!,
      if (incident?.local?.city?.trim().isNotEmpty == true)
        incident!.local!.city!,
      if (incident?.local?.state?.trim().isNotEmpty == true)
        incident!.local!.state!,
    ];

    return parts.isEmpty ? 'Local não informado' : parts.join(' • ');
  }

  static String _buildItemDetails(IncidentOutput? incident, ItemType itemType) {
    if (incident == null) return 'Informações não disponíveis';

    final parts = <String>[];

    if (incident.product?.color?.trim().isNotEmpty == true) {
      parts.add('Cor ${incident.product!.color!}');
    }

    if (itemType != ItemType.phone &&
        incident.product?.year?.toString().trim().isNotEmpty == true) {
      parts.add('Ano ${incident.product!.year}');
    }

    if (incident.alertId.trim().isNotEmpty) {
      parts.add('Código ${incident.alertId}');
    }

    return parts.isEmpty ? 'Informações não disponíveis' : parts.join(' • ');
  }
}

class _IncidentHeroSection extends StatefulWidget {
  final String incidentId;
  final DateTime incidentCreated;
  final List<ImageMedia> photos;
  final double height;

  const _IncidentHeroSection({
    required this.incidentId,
    required this.incidentCreated,
    required this.photos,
    required this.height,
  });

  @override
  State<_IncidentHeroSection> createState() => _IncidentHeroSectionState();
}

class _IncidentHeroSectionState extends State<_IncidentHeroSection> {
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
      margin: const EdgeInsets.only(top: 12),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: context.primaryBgCard,
        border: Border.all(
          color: context.outlineVariantColor.withValues(alpha: 0.25),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: photos.isEmpty
                ? Container(
                    color: context.primaryBgCardLow,
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: context.secondaryTextColor,
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
                    },
                  ),
          ),
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
                      Colors.black.withValues(alpha: 0.62),
                    ],
                    stops: const [0.0, 0.18, 0.56, 1.0],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: context.topPadding + 10,
            left: 14,
            right: 14,
            child: Row(
              children: [
                _GlassCircleButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: () => Navigator.pop(context),
                ),
                const Spacer(),
                _GlassCircleButton(
                  icon: Icons.share_outlined,
                  onTap: () => UrlLauncherUtils.shareIncident(
                    context,
                    widget.incidentId,
                    widget.incidentCreated,
                  ),
                ),
              ],
            ),
          ),
          if (photos.length > 1)
            Positioned(
              top: context.topPadding + 62,
              right: 14,
              child: _PhotoCounter(
                currentIndex: currentIndex,
                total: photos.length,
              ),
            ),
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

class _PhotoCounter extends StatelessWidget {
  final int currentIndex;
  final int total;

  const _PhotoCounter({
    required this.currentIndex,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.34),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.06),
            ),
          ),
          child: Text(
            '${currentIndex + 1}/$total',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const _SectionTitle({
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            color: context.primaryTextColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(
            subtitle!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: context.secondaryTextColor,
              height: 1.3,
            ),
          ),
        ],
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  final Widget child;

  const _SectionCard({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.secondaryContainer,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: context.outline),
      ),
      child: child,
    );
  }
}

class _DescriptionCard extends StatelessWidget {
  final String text;

  const _DescriptionCard({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.secondaryContainer,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: context.outline),
      ),
      child: Text(
        text,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: context.primaryTextColor,
          height: 1.55,
        ),
      ),
    );
  }
}

class _ItemHighlightCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String name;
  final String subtitle;

  const _ItemHighlightCard({
    required this.icon,
    required this.title,
    required this.name,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.secondaryContainer,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: context.outline),
      ),
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: AppColors.primaryColor,
              size: 24.w,
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
                    color: context.secondaryTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: context.primaryTextColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: context.secondaryTextColor,
                    height: 1.35,
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

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final IconData? trailingIcon;

  const _InfoRow({
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
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: AppColors.primaryColor,
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
                  color: context.secondaryTextColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: context.primaryTextColor,
                  fontWeight: FontWeight.w600,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
        if (trailingIcon != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Icon(
              trailingIcon,
              color: context.secondaryTextColor,
              size: 20,
            ),
          ),
      ],
    );
  }
}

class _SectionDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 1,
      color: context.outlineVariantColor,
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
        color: context.secondaryContainer,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: context.outline),
      ),
      child: Row(
        children: [
          Container(
            width: 42.w,
            height: 42.h,
            decoration: BoxDecoration(
              color: context.primaryBgCardLow,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: context.secondaryTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: context.primaryTextColor,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
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

class _StatusPill extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color bgColor;
  final Color textColor;

  const _StatusPill({
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
          color: bgColor.withValues(alpha: 0.9),
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
              fontSize: 13.sp,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomActionBar extends StatelessWidget {
  final String title;
  final VoidCallback? onShare;

  const _BottomActionBar({
    required this.title,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Positioned(
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
              color: context.secondaryContainer,
              borderRadius: BorderRadius.circular(26),
              border: Border.all(color: context.outline),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: context.primaryTextColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Compartilhe esta ocorrência com segurança',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: context.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ButtonPrimary(
                    press: onShare ?? () {},
                    text: 'Compartilhar',
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
