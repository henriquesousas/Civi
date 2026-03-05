import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
import 'package:flutter/material.dart';

class ContributePrimaryCard extends StatelessWidget {
  final VoidCallback onContribute;

  const ContributePrimaryCard({
    super.key,
    required this.onContribute,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);
  static const _border = Color(0xFFE6EAF6);

  @override
  Widget build(BuildContext context) {
    return PageCard(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Contribua com a segurança da região",
              style: TextStyle(
                color: _ink,
                fontWeight: FontWeight.w900,
                fontSize: 16.5,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Registre um alerta para ajudar outras pessoas a se prevenirem.",
              style: TextStyle(
                color: _muted,
                fontWeight: FontWeight.w700,
                fontSize: 13.2,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onContribute,
                icon: const Icon(Icons.add_alert_rounded),
                label: const Text(
                  "Contribuir com alerta",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFF),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: _border),
              ),
              child: const Text(
                "Quanto mais contribuições e confirmações, mais forte fica o monitoramento coletivo.",
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
