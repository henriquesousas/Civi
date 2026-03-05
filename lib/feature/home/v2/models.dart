import 'package:flutter/material.dart';

enum RiskLevel { low, moderate, high, critical }

enum EvidenceKind { robbery, theft, recovered }

class RecentEvidence {
  final EvidenceKind kind;
  final String title;
  final String subtitle; // "Há 12 min • Centro"
  final bool verified;

  // NOVO (coletivo/preventivo)
  final double distanceKm; // 1.8
  final int confirmations; // 4 confirmações da comunidade

  const RecentEvidence({
    required this.kind,
    required this.title,
    required this.subtitle,
    required this.verified,
    required this.distanceKm,
    required this.confirmations,
  });
}

class RiskDriver {
  final String label; // "Roubo de celular"
  final String value; // "18"
  final bool positiveUp; // usado só para cor do indicador
  final IconData icon;

  const RiskDriver({
    required this.label,
    required this.value,
    required this.positiveUp,
    required this.icon,
  });
}

class TodaySnapshot {
  final int total24h;
  final int confirmed;
  final int analyzing;

  const TodaySnapshot({
    required this.total24h,
    required this.confirmed,
    required this.analyzing,
  });
}

class CommunityPulse {
  final int watchersToday;
  final int contributorsToday;

  const CommunityPulse({
    required this.watchersToday,
    required this.contributorsToday,
  });
}
