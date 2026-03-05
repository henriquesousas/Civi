import 'package:deehelp/feature/home/v2/models.dart';
import 'package:deehelp/feature/home/v2/widgets/drivers_mini_card.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
import 'package:flutter/material.dart';

class CategoryIncidentHorizontalCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<RiskDriver> drivers;
  final ValueChanged<RiskDriver>? onTapDriver;

  const CategoryIncidentHorizontalCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.drivers,
    this.onTapDriver,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    final top3 = drivers.take(3).toList();

    return PageCard(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: _ink,
                fontWeight: FontWeight.w900,
                fontSize: 16.5,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: const TextStyle(
                color: _muted,
                fontWeight: FontWeight.w700,
                fontSize: 13.2,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: top3
                  .map(
                    (d) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: DriverMiniCard(
                          driver: d,
                          onTap: onTapDriver == null
                              ? null
                              : () => onTapDriver!(d),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
