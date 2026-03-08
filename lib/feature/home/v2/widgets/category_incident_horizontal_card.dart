import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/feature/home/v2/models.dart';
import 'package:deehelp/feature/home/v2/page_card_variant.dart';
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

class CategoryIncidentHorizontalCardPro extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<RiskDriver> drivers;
  final ValueChanged<RiskDriver>? onTapDriver;

  /// opcional (se quiser no futuro navegar para lista completa)
  final VoidCallback? onSeeAll;

  const CategoryIncidentHorizontalCardPro({
    super.key,
    required this.title,
    required this.subtitle,
    required this.drivers,
    this.onTapDriver,
    this.onSeeAll,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);
  static const _soft = Color(0xFFF8FAFF);
  static const _accent = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    final top3 = drivers.take(3).toList();

    return PageCard(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: título + badge + (opcional) ver todos
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: _ink,
                      fontWeight: FontWeight.w900,
                      fontSize: 16.5,
                      height: 1.05,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  decoration: BoxDecoration(
                    color: _soft,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: _border),
                  ),
                  child: const Text(
                    "TOP 3",
                    style: TextStyle(
                      color: _accent,
                      fontWeight: FontWeight.w900,
                      fontSize: 12.2,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
                if (onSeeAll != null) ...[
                  const SizedBox(width: 6),
                  TextButton(
                    onPressed: onSeeAll,
                    style: TextButton.styleFrom(
                      foregroundColor: _accent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      textStyle: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    child: const Text("Ver"),
                  ),
                ],
              ],
            ),

            const SizedBox(height: 6),

            Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: _muted,
                fontWeight: FontWeight.w700,
                fontSize: 13.2,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 12),
            Container(height: 1, color: _border),
            const SizedBox(height: 12),

            // Drivers
            Row(
              children: [
                for (int i = 0; i < top3.length; i++) ...[
                  Expanded(
                    child: _DriverSlot(
                      child: DriverMiniCard(
                        driver: top3[i],
                        onTap: onTapDriver == null
                            ? null
                            : () => onTapDriver!(top3[i]),
                      ),
                    ),
                  ),
                  if (i != top3.length - 1) const SizedBox(width: 10),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryIncidentHorizontalCardProV2 extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<RiskDriver> drivers;
  final ValueChanged<RiskDriver>? onTapDriver;

  const CategoryIncidentHorizontalCardProV2({
    super.key,
    required this.title,
    required this.subtitle,
    required this.drivers,
    this.onTapDriver,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);
  static const _soft = Color(0xFFF8FAFF);

  @override
  Widget build(BuildContext context) {
    final top3 = drivers.take(3).toList();

    return PageCard(
      // variant: PageCardVariant.elevated,
      // bgColor: Colors.grey.withValues(alpha: 0.1),
      // bgColor: AppColors.success.withValues(alpha: 0.1),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: _ink,
                fontWeight: FontWeight.w900,
                fontSize: 16.5,
                height: 1.05,
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
            const SizedBox(height: 12),
            Container(height: 1, color: _border),
            const SizedBox(height: 12),
            Row(
              children: [
                for (int i = 0; i < top3.length; i++) ...[
                  Expanded(
                    child: _LightDriverCard(
                      label: top3[i].label,
                      count: 12,
                      icon: driverIconFromLabel(top3[i].label),
                      tint: driverColorFromLabel(top3[i].label),
                      onTap: onTapDriver == null
                          ? null
                          : () => onTapDriver!(top3[i]),
                    ),
                  ),
                  if (i != top3.length - 1) const SizedBox(width: 10),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Cardzinho leve e “pro”
class _LightDriverCard extends StatelessWidget {
  final String label;
  final int count;
  final IconData icon;
  final Color tint;
  final VoidCallback? onTap;

  const _LightDriverCard({
    required this.label,
    required this.count,
    required this.icon,
    required this.tint,
    this.onTap,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);
  static const _soft = Color(0xFFF8FAFF);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: _border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // topo: ícone leve
            Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: tint.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(icon, color: tint, size: 18),
                ),
                const Spacer(),
                // “pill” discreta de contexto
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: _soft,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: _border),
                  ),
                  child: const Text(
                    "24h",
                    style: TextStyle(
                      color: _muted,
                      fontWeight: FontWeight.w900,
                      fontSize: 11.5,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // total
            Text(
              "$count",
              style: const TextStyle(
                color: _ink,
                fontWeight: FontWeight.w900,
                fontSize: 22,
                height: 1.0,
              ),
            ),
            const SizedBox(height: 4),

            // descrição curta
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: _muted,
                fontWeight: FontWeight.w800,
                fontSize: 12.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Helpers (não depende do seu model ter icon/color)
IconData driverIconFromLabel(String label) {
  final s = label.toLowerCase();
  if (s.contains('cel')) return Icons.smartphone_rounded;
  if (s.contains('moto')) return Icons.two_wheeler_rounded;
  if (s.contains('car')) return Icons.directions_car_rounded;
  return Icons.bolt_rounded;
}

Color driverColorFromLabel(String label) {
  final s = label.toLowerCase();
  if (s.contains('cel')) return const Color(0xFFDC2626);
  if (s.contains('moto')) return const Color(0xFFD97706);
  if (s.contains('car')) return const Color(0xFF2B5BEE);
  return const Color(0xFF64748B);
}

/// Um “slot” para deixar o DriverMiniCard com respiro consistente
/// (e garantir que os 3 fiquem alinhados e com a mesma altura visual).
class _DriverSlot extends StatelessWidget {
  final Widget child;
  const _DriverSlot({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // só um “halo” leve, sem virar outra caixa
        borderRadius: BorderRadius.circular(18),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
