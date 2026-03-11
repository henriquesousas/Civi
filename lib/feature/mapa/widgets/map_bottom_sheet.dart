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
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        boxShadow: [
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
                child: Row(
                  children: [
                    Container(
                      width: IconSizes.xl,
                      height: IconSizes.xl,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFE5E7EB),
                        ),
                      ),
                      child: AnimatedRotation(
                        turns: _isExpanded ? 0.5 : 0.0,
                        duration: const Duration(milliseconds: 260),
                        child: Icon(
                          Icons.keyboard_arrow_up_rounded,
                          size: IconSizes.sm,
                          color: const Color(0xFF111827),
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
              AnimatedCrossFade(
                firstChild: const SizedBox(height: 0),
                secondChild: const Column(
                  children: [
                    SizedBox(height: 16),
                    _MapLayerOptionCard(
                      title: "Default",
                      subtitle:
                          "See incidents (Assaults, Fires etc.) along with Good Vibes and Friends.",
                      selected: true,
                      icon: Icons.public,
                    ),
                    SizedBox(height: 12),
                    _MapLayerOptionCard(
                      title: "Criar alerta",
                      subtitle:
                          "Avise a comunidade sobre um incidente nesta área.",
                      selected: false,
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
        color: selected ? const Color(0xFFF3F4F6) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
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
                  style: context.appText.bodySmall.copyWith(
                    color: const Color(0xFF6B7280),
                    height: 1.25,
                    fontWeight: FontWeight.normal,
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

class _LayerPreviewIcon extends StatelessWidget {
  final bool selected;
  final IconData icon;

  const _LayerPreviewIcon({
    required this.selected,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final accent = selected ? const Color(0xFF2B5BEE) : const Color(0xFFF97316);

    return Container(
      width: IconSizes.xxl,
      height: IconSizes.xxl,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFF9FAFB),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          size: IconSizes.md,
          color: accent,
        ),
      ),
    );
  }
}
