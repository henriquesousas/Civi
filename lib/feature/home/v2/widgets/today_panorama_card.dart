import 'package:deehelp/feature/home/v2/widgets/kpi_title.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
import 'package:flutter/material.dart';

class TodayPanoramaCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int total24h;
  final int confirmed;
  final int analyzing;

  const TodayPanoramaCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.total24h,
    required this.confirmed,
    required this.analyzing,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);

  @override
  Widget build(BuildContext context) {
    return PageCard(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                    label: "Registros",
                    value: "$total24h",
                    icon: Icons.receipt_long_rounded,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: KpiTile(
                    label: "Confirmados",
                    value: "$confirmed",
                    icon: Icons.verified_rounded,
                    valueColor: const Color(0xFF059669),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: KpiTile(
                    label: "Em análise",
                    value: "$analyzing",
                    icon: Icons.hourglass_top_rounded,
                    valueColor: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFF),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: _border),
              ),
              child: const Text(
                "Acompanhe e contribua para fortalecer o monitoramento coletivo da região.",
                style: TextStyle(
                  color: _muted,
                  fontWeight: FontWeight.w700,
                  height: 1.25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
