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
        decoration: const BoxDecoration(
          color: Color(0xFF050505),
          borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
          boxShadow: [
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
                            color: Colors.white,
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
                            color: Colors.white.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(99),
                            border: Border.all(
                              // color: const Color(0xFFE5E7EB),
                              color: Colors.grey.withValues(alpha: 0.6),
                            ),
                          ),
                          child: AnimatedRotation(
                            turns: _isExpanded ? 0.5 : 0.0,
                            duration: const Duration(milliseconds: 260),
                            child: Icon(
                              Icons.keyboard_arrow_up_rounded,
                              size: IconSizes.lg,
                              // color: const Color(0xFF111827),
                              color: Colors.white54,
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
                        color: Colors.grey,
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
                        title: 'Criar alerta',
                        subtitle: 'Roubo ou atitude suspeita',
                        selected: true,
                        leading: const _MapPreviewIcon(
                          dotColor: Color(0xFFFFC400),
                          showAvatar: true,
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
                        subtitle: 'Carro, moto ou celular',
                        selected: false,
                        leading: const _MapPreviewIcon(
                          dotColor: Color(0xFFFF8A00),
                          showAvatar: false,
                          centerIcon: Icons.person,
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
    final borderColor = selected
        ? const Color(0xFF2A2A2A)
        : Colors.white.withValues(alpha: 0.12);

    final backgroundColor =
        selected ? const Color(0xFF171717) : const Color(0xFF0D0D0D);

    return Material(
      color: Colors.transparent,
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
                color: Colors.black.withOpacity(0.18),
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
                  color: Colors.white,
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
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.06),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.08),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                      color: Colors.white70,
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
  final Color dotColor;
  final bool showAvatar;
  final IconData? centerIcon;

  const _MapPreviewIcon({
    required this.dotColor,
    required this.showAvatar,
    this.centerIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF0F0F10),
              border: Border.all(
                color: Colors.white.withOpacity(0.08),
              ),
            ),
            child: CustomPaint(
              painter: _RadarPainter(),
              child: Center(
                child: centerIcon != null
                    ? Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: dotColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          centerIcon,
                          size: 11,
                          color: Colors.black,
                        ),
                      )
                    : null,
              ),
            ),
          ),
          Positioned(
            left: 6,
            bottom: 8,
            child: Container(
              width: 11,
              height: 11,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: dotColor.withOpacity(0.5),
                    blurRadius: 8,
                    spreadRadius: 0.2,
                  ),
                ],
                border: Border.all(color: Colors.black, width: 1.2),
              ),
            ),
          ),
          if (showAvatar)
            Positioned(
              right: -1,
              top: -1,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 1.5),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=80&q=80',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _RadarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = Colors.white.withOpacity(0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;

    final linePaint = Paint()
      ..color = Colors.white.withOpacity(0.07)
      ..strokeWidth = 0.8;

    final center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, size.width * 0.22, gridPaint);
    canvas.drawCircle(center, size.width * 0.38, gridPaint);
    canvas.drawCircle(center, size.width * 0.49, gridPaint);

    canvas.drawLine(
      Offset(center.dx, 3),
      Offset(center.dx, size.height - 3),
      linePaint,
    );
    canvas.drawLine(
      Offset(3, center.dy),
      Offset(size.width - 3, center.dy),
      linePaint,
    );
    canvas.drawLine(
      const Offset(8, 8),
      Offset(size.width - 8, size.height - 8),
      linePaint,
    );
    canvas.drawLine(
      Offset(size.width - 8, 8),
      Offset(8, size.height - 8),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
