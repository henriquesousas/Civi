import 'package:deehelp/feature/home/v2/page_card_variant.dart';
import 'package:deehelp/feature/home/v2/widgets/kpi_title.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
import 'package:flutter/material.dart';

// class TodayPanoramaCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final int total24h;
//   final int confirmed;
//   final int analyzing;

//   const TodayPanoramaCard({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.total24h,
//     required this.confirmed,
//     required this.analyzing,
//   });

//   static const _ink = Color(0xFF1F2A44);
//   static const _muted = Color(0xFF8A96C8);
//   static const _border = Color(0xFFE6EAF6);

//   @override
//   Widget build(BuildContext context) {
//     return PageCard(
//       isFloating: true,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 color: _ink,
//                 fontWeight: FontWeight.w900,
//                 fontSize: 16.5,
//               ),
//             ),
//             const SizedBox(height: 6),
//             Text(
//               subtitle,
//               style: const TextStyle(
//                 color: _muted,
//                 fontWeight: FontWeight.w700,
//                 fontSize: 13.2,
//               ),
//             ),
//             const SizedBox(height: 14),
//             Row(
//               children: [
//                 Expanded(
//                   child: KpiTile(
//                     label: "Registros",
//                     value: "$total24h",
//                     icon: Icons.receipt_long_rounded,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: KpiTile(
//                     label: "Confirmados",
//                     value: "$confirmed",
//                     icon: Icons.verified_rounded,
//                     valueColor: const Color(0xFF059669),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: KpiTile(
//                     label: "Em análise",
//                     value: "$analyzing",
//                     icon: Icons.hourglass_top_rounded,
//                     valueColor: const Color(0xFF64748B),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 6),
//             Container(
//               margin: const EdgeInsets.only(top: 10),
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF8FAFF),
//                 borderRadius: BorderRadius.circular(18),
//                 border: Border.all(color: _border),
//               ),
//               child: const Text(
//                 "Acompanhe e contribua para fortalecer o monitoramento coletivo da região.",
//                 style: TextStyle(
//                   color: _muted,
//                   fontWeight: FontWeight.w700,
//                   height: 1.25,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class TodayPanoramaCardPro extends StatelessWidget {
  final String title;
  final String subtitle;
  final int total24h;
  final int confirmed;
  final int analyzing;

  const TodayPanoramaCardPro({
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
  static const _soft = Color(0xFFF8FAFF);

  // detalhe de identidade (seu azul)
  static const _accent = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return PageCard(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // “top accent” fino (profissional, sem poluir)
            Container(
              height: 4,
              width: 44,
              decoration: BoxDecoration(
                color: _accent,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            const SizedBox(height: 12),

            // Header (título + subtítulo)
            Text(
              title,
              style: const TextStyle(
                color: _ink,
                fontWeight: FontWeight.w900,
                fontSize: 16.5,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: const TextStyle(
                color: _muted,
                fontWeight: FontWeight.w700,
                fontSize: 13.2,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 14),

            // KPIs (mesma info, layout mais “alinhado”)
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

            const SizedBox(height: 12),

            // Rodapé com mensagem (bem discreto)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: _soft,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: _border),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 18,
                    color: _muted,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Acompanhe e contribua para fortalecer o monitoramento coletivo da região.",
                      style: TextStyle(
                        color: _muted,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                        fontSize: 12.8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TodayPanoramaCardProV2 extends StatelessWidget {
  final String title;
  final String subtitle; // ex: "Osasco • últimas 24h"
  final int total24h;
  final int confirmed;
  final int analyzing;

  const TodayPanoramaCardProV2({
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
  static const _surface = Colors.white;

  static const _accent = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return PageCard(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: título + badge
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                _MetaBadge(text: subtitle),
              ],
            ),

            const SizedBox(height: 12),

            // Separador leve (bem pro)
            Container(
              height: 1,
              width: double.infinity,
              color: _border,
            ),

            const SizedBox(height: 12),

            // KPIs em “faixa única” (muito mais profissional que 3 caixinhas)
            Container(
              decoration: BoxDecoration(
                color: _surface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: _border),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: _KpiMini(
                      label: "Registros",
                      value: "$total24h",
                      icon: Icons.receipt_long_rounded,
                      iconColor: _accent,
                      valueColor: _ink,
                    ),
                  ),
                  _vDivider(),
                  Expanded(
                    child: _KpiMini(
                      label: "Confirmados",
                      value: "$confirmed",
                      icon: Icons.verified_rounded,
                      iconColor: const Color(0xFF059669),
                      valueColor: const Color(0xFF059669),
                    ),
                  ),
                  _vDivider(),
                  Expanded(
                    child: _KpiMini(
                      label: "Em análise",
                      value: "$analyzing",
                      icon: Icons.hourglass_top_rounded,
                      iconColor: const Color(0xFF64748B),
                      valueColor: const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Callout minimalista (sem “box dentro de box” pesado)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFFF8FAFF),
                border: Border.all(color: _border),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                children: const [
                  Icon(Icons.info_outline_rounded, size: 18, color: _muted),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Acompanhe e contribua para fortalecer o monitoramento coletivo da região.",
                      style: TextStyle(
                        color: _muted,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.8,
                        height: 1.25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _vDivider() => Container(
        width: 1,
        height: 46,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        color: _border,
      );
}

class TodayPanoramaCardProB extends StatelessWidget {
  final String title;
  final String subtitle;
  final int total24h;
  final int confirmed;
  final int analyzing;

  const TodayPanoramaCardProB({
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
  static const _soft = Color(0xFFF8FAFF);
  static const _accent = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return PageCard(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header
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

            const SizedBox(height: 12),
            Container(height: 1, color: _border),
            const SizedBox(height: 12),

            // destaque total
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "$total24h",
                  style: const TextStyle(
                    color: _ink,
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                    height: 1.0,
                  ),
                ),
                const SizedBox(width: 10),
                const Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Text(
                    "registros nas últimas 24h",
                    style: TextStyle(
                      color: _muted,
                      fontWeight: FontWeight.w800,
                      fontSize: 13.2,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  decoration: BoxDecoration(
                    color: _soft,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: _border),
                  ),
                  child:
                      const Icon(Icons.today_rounded, color: _accent, size: 18),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // mini KPIs
            Row(
              children: [
                Expanded(
                  child: _MiniStat(
                    label: "Confirmados",
                    value: "$confirmed",
                    valueColor: const Color(0xFF059669),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _MiniStat(
                    label: "Em análise",
                    value: "$analyzing",
                    valueColor: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Container(
              decoration: BoxDecoration(
                color: _soft,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: _border),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: const Text(
                "Acompanhe e contribua para fortalecer o monitoramento coletivo da região.",
                style: TextStyle(
                  color: _muted,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.8,
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

class TodayPanoramaCardProC extends StatelessWidget {
  final String title;
  final String subtitle;
  final int total24h;
  final int confirmed;
  final int analyzing;

  const TodayPanoramaCardProC({
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
  static const _soft = Color(0xFFF8FAFF);
  static const _accent = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return PageCard(
      // bgColor: Colors.grey.withValues(alpha: 0.1),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // linha de título compacta
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: _ink,
                      fontWeight: FontWeight.w900,
                      fontSize: 16.0,
                      height: 1.05,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 9,
                  height: 9,
                  decoration: const BoxDecoration(
                    color: _accent,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: const TextStyle(
                color: _muted,
                fontWeight: FontWeight.w700,
                fontSize: 13.0,
              ),
            ),

            const SizedBox(height: 12),

            // KPIs em 2 linhas (mais compacto)
            Row(
              children: [
                Expanded(
                    child: _Metric(label: "Registros", value: "$total24h")),
                const SizedBox(width: 10),
                Expanded(
                  child: _Metric(
                    label: "Confirmados",
                    value: "$confirmed",
                    valueColor: const Color(0xFF059669),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _Metric(
                    label: "Em análise",
                    value: "$analyzing",
                    valueColor: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _soft,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: _border),
              ),
              child: const Text(
                "Acompanhe e contribua para fortalecer o monitoramento coletivo da região.",
                style: TextStyle(
                  color: _muted,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.8,
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

class _Metric extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const _Metric({
    required this.label,
    required this.value,
    this.valueColor = const Color(0xFF1F2A44),
  });

  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontWeight: FontWeight.w900,
              fontSize: 18,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: _muted,
              fontWeight: FontWeight.w800,
              fontSize: 12.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const _MiniStat({
    required this.label,
    required this.value,
    required this.valueColor,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontWeight: FontWeight.w900,
              fontSize: 18,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "",
            style: TextStyle(),
          ),
          Text(
            label,
            style: const TextStyle(
              color: _muted,
              fontWeight: FontWeight.w800,
              fontSize: 12.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  const _Badge({required this.text});

  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFF),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: _border),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: _muted,
          fontWeight: FontWeight.w800,
          fontSize: 12.2,
        ),
      ),
    );
  }
}

class _KpiMini extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color valueColor;

  const _KpiMini({
    required this.label,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.valueColor,
  });

  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 19),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: valueColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 16.5,
                  height: 1.0,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: _muted,
                  fontWeight: FontWeight.w800,
                  fontSize: 12.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MetaBadge extends StatelessWidget {
  final String text;
  const _MetaBadge({required this.text});

  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFF),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: _border),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: _muted,
          fontWeight: FontWeight.w800,
          fontSize: 12.2,
        ),
      ),
    );
  }
}

// class _KpiMini extends StatelessWidget {
//   final String label;
//   final String value;
//   final IconData icon;
//   final Color iconColor;
//   final Color valueColor;

//   const _KpiMini({
//     required this.label,
//     required this.value,
//     required this.icon,
//     required this.iconColor,
//     required this.valueColor,
//   });

//   static const _muted = Color(0xFF8A96C8);
//   static const _ink = Color(0xFF1F2A44);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: 34,
//           height: 34,
//           decoration: BoxDecoration(
//             color: const Color(0xFFF8FAFF),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Icon(icon, color: iconColor, size: 19),
//         ),
//         const SizedBox(width: 10),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 value,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   color: valueColor,
//                   fontWeight: FontWeight.w900,
//                   fontSize: 16.5,
//                   height: 1.0,
//                 ),
//               ),
//               const SizedBox(height: 2),
//               Text(
//                 label,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   color: _muted,
//                   fontWeight: FontWeight.w800,
//                   fontSize: 12.2,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
