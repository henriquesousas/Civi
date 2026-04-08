import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/feature/alerts/alert_type_bottom_sheet.dart';
import 'package:deehelp/feature/alerts/alerts_router.dart';
import 'package:deehelp/feature/incidents/incident_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MapLayersBottomSheet2 extends StatefulWidget {
  final bool initiallyExpanded;
  final Function(bool)? onTapHeader;
  final String? city;
  final String? address;
  const MapLayersBottomSheet2({
    super.key,
    required this.initiallyExpanded,
    required this.city,
    required this.address,
    this.onTapHeader,
  });

  @override
  State<MapLayersBottomSheet2> createState() => _MapLayersBottomSheet2State();
}

class _MapLayersBottomSheet2State extends State<MapLayersBottomSheet2>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    widget.onTapHeader?.call(_isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeInOut,
      width: double.infinity,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
        decoration: BoxDecoration(
          // color: Color(0xFF050505),
          color: context.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 24,
              offset: Offset(0, -6),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _toggle,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.city ?? "Não identificado",
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.2,
                          ),
                        ),
                        Container(
                          width: IconSizes.xl,
                          height: IconSizes.xl,
                          decoration: BoxDecoration(
                            // color: const Color(0xFFF3F4F6),
                            // color: Colors.white.withValues(alpha: 0.1),
                            color: context.primaryBgCardLow,
                            borderRadius: BorderRadius.circular(99),
                            border: Border.all(
                              // color: const Color(0xFFE5E7EB),
                              // color: Colors.grey.withValues(alpha: 0.6),
                              color: context.outline,
                            ),
                          ),
                          child: AnimatedRotation(
                            turns: _isExpanded ? 0.5 : 0.0,
                            duration: const Duration(milliseconds: 260),
                            child: Icon(
                              Icons.keyboard_arrow_up_rounded,
                              size: IconSizes.lg,
                              // color: const Color(0xFF111827),
                              color: context.primaryTextColor
                                  .withValues(alpha: 0.5),
                            ),
                          ),
                        ),
                        // CloseButtonV2(
                        //   onTap: () => Navigator.pop(context),
                        // ),
                      ],
                    ),
                    Text(
                      widget.address ?? '',
                      style: TextStyle(
                        color: context.secondaryTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              AnimatedCrossFade(
                firstChild: const SizedBox(height: 0),
                secondChild: Row(
                  children: [
                    Expanded(
                      child: _LayerActionTile(
                        title: 'Publicar alerta',
                        subtitle: 'Escolha uma categoria',
                        selected: true,
                        leading: const _MapPreviewIcon(
                          // accentColor: Color(0xFFFFC400),
                          accentColor: Color(0xFFFFB300),
                          showBadge: true,
                          centerIcon: Icons.warning_amber_rounded,
                          badgeIcon: Icons.people_alt_rounded,
                        ),
                        onTap: () {
                          _toggle();
                          AlertTypeBottomSheet.show(
                            context,
                            onSuspiciousTap: () {
                              context.push(AlertsRouter.suspiciousActivity);
                            },
                            onRobberyTap: () =>
                                context.push(AlertsRouter.chooseAttemptType),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _LayerActionTile(
                        title: 'Item roubado',
                        subtitle: 'Seus itens',
                        selected: false,
                        leading: const _MapPreviewIcon(
                          accentColor: Color(0xFFFF5A36),
                          showBadge: false,
                          centerIcon: Icons.directions_car_filled_rounded,
                        ),
                        onTap: () {
                          _toggle();
                          context.push(IncidentRouter.register);
                        },
                      ),
                    ),
                  ],
                ),
                crossFadeState: _isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 240),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LayerActionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool selected;
  final Widget leading;
  final VoidCallback onTap;

  const _LayerActionTile({
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.leading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // final borderColor = selected ? const Color(0xFF2A2A2A) : context.outline;
    // final backgroundColor =
    //     selected ? const Color(0xFF171717) : const Color(0xFF0D0D0D);
    final borderColor = context.outline;
    final backgroundColor = context.primaryBgCardLow;

    return Material(
      color: Colors.transparent,
      // color: context.primaryBgCard,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: borderColor),
            boxShadow: [
              BoxShadow(
                color: context.primaryBgCardLow.withValues(alpha: 0.18),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              leading,
              const SizedBox(height: 14),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: context.safeSp(16),
                  fontWeight: FontWeight.w800,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  // color: Colors.white.withValues(alpha: 0.72),
                  color: context.secondaryTextColor,
                  fontSize: context.safeSp(11),
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Container(
                    width: 26.w,
                    height: 26.w,
                    decoration: BoxDecoration(
                      color: context.primaryBgCardHigh,
                      shape: BoxShape.circle,
                      border: Border.all(
                        // color: Colors.white.withValues(alpha: 0.08),
                        color: context.primaryBgCardHigh,
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                      color: context.primaryTextColor.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MapPreviewIcon extends StatelessWidget {
  final Color accentColor;
  final bool showBadge;
  final IconData centerIcon;
  final IconData? badgeIcon;

  const _MapPreviewIcon({
    required this.accentColor,
    required this.showBadge,
    required this.centerIcon,
    this.badgeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 52,
      height: 52,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.primaryBgCardLow,
              border: Border.all(
                color: context.outline,
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.10),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: accentColor.withValues(alpha: 0.10),
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: accentColor.withValues(alpha: 0.18),
                  ),
                ),
                Icon(
                  centerIcon,
                  size: 20,
                  color: accentColor,
                ),
              ],
            ),
          ),
          Positioned(
            left: 4,
            bottom: 4,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: accentColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.surface,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withValues(alpha: 0.35),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
          if (showBadge)
            Positioned(
              right: -2,
              top: -2,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.surface,
                  border: Border.all(
                    color: context.outline,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.10),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  badgeIcon ?? Icons.campaign_rounded,
                  size: 11,
                  color: context.primaryTextColor.withValues(alpha: 0.75),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
