import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class MapLayersBottomSheet extends StatefulWidget {
  final bool initiallyExpanded;
  final Function(bool)? onTapHeader;

  const MapLayersBottomSheet({
    super.key,
    this.initiallyExpanded = false,
    this.onTapHeader,
  });

  @override
  State<MapLayersBottomSheet> createState() => _MapLayersBottomSheetState();
}

class _MapLayersBottomSheetState extends State<MapLayersBottomSheet>
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
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 18,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _toggle,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: IconSizes.xl,
                        height: IconSizes.xl,
                        decoration: BoxDecoration(
                          // color: const Color(0xFFF3F4F6),
                          color: context.secondaryColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(
                            // color: const Color(0xFFE5E7EB),
                            color: context.outlineVariantColor,
                          ),
                        ),
                        child: AnimatedRotation(
                          turns: _isExpanded ? 0.5 : 0.0,
                          duration: const Duration(milliseconds: 260),
                          child: Icon(
                            Icons.keyboard_arrow_up_rounded,
                            size: IconSizes.sm,
                            // color: const Color(0xFF111827),
                            color: context.outlineVariantColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Osasco',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: context.appText.headerlg,
                            ),
                            Text(
                              'Travessa Francisco Alves da Silva, Osasco, Baronera',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: context.appText.caption,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedCrossFade(
                firstChild: const SizedBox(height: 0),
                secondChild: const Column(
                  children: [
                    SizedBox(height: 16),
                    _MapLayerOptionCard(
                      title: "Default",
                      subtitle:
                          "See incidents (Assaults, Fires etc.) along with Good Vibes and Friends.",
                      selected: false,
                      icon: Icons.public,
                    ),
                    SizedBox(height: 12),
                    _MapLayerOptionCard(
                      title: "Criar alerta",
                      subtitle:
                          "Avise a comunidade sobre um incidente nesta área.",
                      selected: true,
                      icon: Icons.warning_amber_rounded,
                    ),
                  ],
                ),
                crossFadeState: _isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 240),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MapLayerOptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool selected;
  final IconData icon;

  const _MapLayerOptionCard({
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        // color: selected ? const Color(0xFFF3F4F6) : Colors.white,
        // color: selected ? const Color(0xFFF3F4F6) : context.surfaceColor,
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          // color: const Color(0xFFE5E7EB),
          // color: context.outlineVariantColor.withValues(alpha: 0.5),
          color: selected
              ? AppColors.danger2.withValues(alpha: 0.5)
              : context.outlineVariantColor.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        children: [
          _LayerPreviewIcon(
            selected: selected,
            icon: icon,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.appText.headermd),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: context.appText.caption.copyWith(
                    color: context.secondaryColor,
                  ),
                  // style: context.appText.bodySmall.copyWith(
                  //   color: const Color(0xFF6B7280),
                  //   height: 1.25,
                  //   fontWeight: FontWeight.normal,
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LayerPreviewIcon extends StatelessWidget {
  final bool selected;
  final IconData icon;

  const _LayerPreviewIcon({
    required this.selected,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final accent = selected ? const Color(0xFFF97316) : const Color(0xFF2B5BEE);

    return Container(
      width: IconSizes.xxl,
      height: IconSizes.xxl,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // color: const Color(0xFFF9FAFB),
        color: selected
            ? AppColors.danger2.withValues(alpha: 0.2)
            : context.surfaceColor,
        border: Border.all(
          // color: const Color(0xFFE5E7EB),
          color: selected
              ? AppColors.danger2.withValues(alpha: 0.4)
              : context.outlineVariantColor,
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          size: IconSizes.md,
          color: selected ? AppColors.danger : accent,
        ),
      ),
    );
  }
}

//DOIS

class MapLayersBottomSheet2 extends StatelessWidget {
  const MapLayersBottomSheet2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Center(
              child: Container(
                width: 54,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Map Layers',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(height: 14),
            _LayerTile(
              title: 'Default',
              subtitle:
                  'See incidents (Assaults, Fires etc.) along with Good Vibes and Friends.',
              selected: true,
              leading: const _MapPreviewIcon(
                dotColor: Color(0xFFFFC400),
                showAvatar: true,
              ),
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _LayerTile(
              title: 'Registered Offenders',
              subtitle: 'See registered offenders with detailed information.',
              selected: false,
              leading: const _MapPreviewIcon(
                dotColor: Color(0xFFFF8A00),
                showAvatar: false,
                centerIcon: Icons.person,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _LayerTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool selected;
  final Widget leading;
  final VoidCallback onTap;

  const _LayerTile({
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.leading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor =
        selected ? Colors.transparent : Colors.white.withOpacity(0.16);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF171717) : Colors.transparent,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              leading,
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.82),
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500,
                          height: 1.25,
                        ),
                      ),
                    ],
                  ),
                ),
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
