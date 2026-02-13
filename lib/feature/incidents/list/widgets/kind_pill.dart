import 'package:deehelp/feature/home/widgets/recent_incident_card.dart';
import 'package:flutter/material.dart';

class KindPill extends StatelessWidget {
  final IncidentKind kind;
  const KindPill({super.key, required this.kind});

  Color get _c => switch (kind) {
        IncidentKind.robbery => const Color(0xFFE53935),
        IncidentKind.theft => const Color(0xFFF59E0B),
        IncidentKind.recovered => const Color(0xFF16A34A),
      };

  String get _t => switch (kind) {
        IncidentKind.robbery => 'ROUBO',
        IncidentKind.theft => 'FURTO',
        IncidentKind.recovered => 'RECUPERADO',
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: _c.withOpacity(0.12),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: _c.withOpacity(0.22)),
      ),
      child: Text(
        _t,
        style: TextStyle(
          color: _c,
          fontWeight: FontWeight.w900,
          fontSize: 11,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}
