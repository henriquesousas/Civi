import 'package:deehelp/feature/home/v2/widgets/kpi_title.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
import 'package:flutter/material.dart';

class CommunityMovementCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int watchersToday;
  final int contributorsToday;
  final VoidCallback onSeeMore;

  const CommunityMovementCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.watchersToday,
    required this.contributorsToday,
    required this.onSeeMore,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return PageCard(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
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
              children: [
                Expanded(
                  child: KpiTile(
                    label: "Acompanhando",
                    value: "$watchersToday",
                    icon: Icons.visibility_rounded,
                    valueColor: _primary,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: KpiTile(
                    label: "Contribuíram",
                    value: "$contributorsToday",
                    icon: Icons.volunteer_activism_rounded,
                    valueColor: const Color(0xFF059669),
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 8),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: TextButton(
            //     onPressed: onSeeMore,
            //     child: const Text(
            //       "Ver detalhes",
            //       style: TextStyle(fontWeight: FontWeight.w900),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
