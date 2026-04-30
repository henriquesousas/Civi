import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/widgets/ui_thin_divider.dart';
import 'package:deehelp/v2/feature/map/presentation/widgets/incident_item.dart';
import 'package:flutter/material.dart';

class IncidentCard extends StatelessWidget {
  final IncidentItem item;

  const IncidentCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SizeLayoutSpacing.m,
        vertical: SizeLayoutSpacing.m,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${item.distance} · ${item.place}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.appText.subtitle.copyWith(
              color: const Color(0xFFF0C24C),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: SizeSpacing.m),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: context.appText.title.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: SizeSpacing.m),
                    Text(
                      item.description,
                      style: context.appText.subtitle.copyWith(
                        color: context.themeColor.secundaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: SizeSpacing.m),
              Container(
                width: 92,
                height: 92,
                decoration: BoxDecoration(
                  color: const Color(0xFF0F1420),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: const Color(0xFFF0C24C),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        item.icon,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: SizeSpacing.m),
          Row(
            children: [
              Text(
                item.updatedAt,
                style: context.appText.caption.copyWith(
                  color: context.themeColor.secundaryTextColor,
                ),
              ),
              const Spacer(),
              Text(
                item.views,
                style: context.appText.caption.copyWith(
                  color: context.themeColor.secundaryTextColor,
                ),
              ),
              const SizedBox(width: SizeSpacing.l),
              const Icon(Icons.reply, color: Colors.white, size: SizeIcon.s),
              const SizedBox(width: SizeSpacing.s),
              Text(
                'Compartilhar',
                style: context.appText.caption.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: SizeSpacing.xl),
          const UIThinDivider(),
        ],
      ),
    );
  }
}
