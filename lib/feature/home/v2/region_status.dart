import 'package:deehelp/feature/home/v2/models.dart';

class RegionStatus {
  final String localityLabel;
  final String updateLabel;
  final String periodLabel;

  final RiskLevel level;
  final int score;

  final List<RiskDriver> drivers;
  final RecentEvidence? evidence;

  final TodaySnapshot today;
  final CommunityPulse pulse;

  // NOVO: foco Osasco
  // final OsascoFocus osasco;

  const RegionStatus({
    required this.localityLabel,
    required this.updateLabel,
    required this.periodLabel,
    required this.level,
    required this.score,
    required this.drivers,
    required this.evidence,
    required this.today,
    required this.pulse,
  });
}
