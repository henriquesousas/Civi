import 'package:flutter/material.dart';

class TesteHome extends StatefulWidget {
  const TesteHome({super.key});

  @override
  State<TesteHome> createState() => _TesteHomeState();
}

enum ItemKind { car, motorcycle, phone }

enum IncidentKind { robbery, theft, recovered }

class IncidentFeedItem {
  final ItemKind itemKind;
  final IncidentKind kind;
  final String itemName;
  final DateTime date;
  final String district;
  final String imageUrl;

  const IncidentFeedItem({
    required this.itemKind,
    required this.kind,
    required this.itemName,
    required this.date,
    required this.district,
    required this.imageUrl,
  });
}

class _TesteHomeState extends State<TesteHome> {
  // ===== Premium tokens (mesma vibe do app)
  static const _bg = Color(0xFFF5F7FD);
  static const _surface = Colors.white;
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);
  static const _divider = Color(0xFFE9EEF8); // gray thin
  static const _primary = Color(0xFF2B5BEE);
  static const _success = Color(0xFF16A34A);

  String locality = 'Minha região';
  String lastUpdate = 'Atualizado há 5 min';

  // late final RiskSummary risk = RiskSummary(
  //   locality: "Osasco • SP",
  //   level: RiskLevel.high,
  //   score: 72,
  //   periodLabel: "Últimos 30 dias",
  //   updateLabel: lastUpdate,
  //   changePct7d: 12.4,
  //   drivers: const [
  //     RiskDriver(
  //       label: "Roubo de celular",
  //       value: "↑ 18%",
  //       positiveUp: true,
  //       icon: Icons.smartphone_rounded,
  //     ),
  //     RiskDriver(
  //       label: "Roubo de veículo",
  //       value: "↑ 9%",
  //       positiveUp: true,
  //       icon: Icons.directions_car_rounded,
  //     ),
  //     RiskDriver(
  //       label: "Furto de moto",
  //       value: "↓ 6%",
  //       positiveUp: false,
  //       icon: Icons.two_wheeler_rounded,
  //     ),
  //   ],
  // );
  late final RiskSummary risk = RiskSummary(
    locality: "Osasco • SP",
    level: RiskLevel.low,
    score: 18,
    periodLabel: "Últimos 30 dias",
    updateLabel: lastUpdate,
    changePct7d: -9.2,
    drivers: const [
      RiskDriver(
        label: "Roubo de celular",
        value: "↓ 12%",
        positiveUp: false,
        icon: Icons.smartphone_rounded,
      ),
      RiskDriver(
        label: "Roubo de veículo",
        value: "↓ 6%",
        positiveUp: false,
        icon: Icons.directions_car_rounded,
      ),
      RiskDriver(
        label: "Furto de moto",
        value: "↑ 2%",
        positiveUp: true,
        icon: Icons.two_wheeler_rounded,
      ),
    ],
  );

  final List<IncidentFeedItem> items = [
    IncidentFeedItem(
      itemKind: ItemKind.motorcycle,
      kind: IncidentKind.robbery,
      itemName: 'CG Titan 150 • Vermelha',
      date: DateTime(2026, 2, 19, 21, 10),
      district: 'Centro',
      imageUrl: 'https://picsum.photos/seed/titan150/800/700',
    ),
    IncidentFeedItem(
      itemKind: ItemKind.phone,
      kind: IncidentKind.theft,
      itemName: 'iPhone 13 • Preto',
      date: DateTime(2026, 2, 18, 18, 40),
      district: 'Vila Nova',
      imageUrl: 'https://picsum.photos/seed/iphone13/800/700',
    ),
    IncidentFeedItem(
      itemKind: ItemKind.car,
      kind: IncidentKind.robbery,
      itemName: 'Onix 2020 • Prata',
      date: DateTime(2026, 2, 16, 23, 05),
      district: 'Jardim Sul',
      imageUrl: 'https://picsum.photos/seed/onix2020/800/700',
    ),
    IncidentFeedItem(
      itemKind: ItemKind.phone,
      kind: IncidentKind.recovered,
      itemName: 'Galaxy S22 • Azul',
      date: DateTime(2026, 2, 15, 12, 25),
      district: 'Boa Vista',
      imageUrl: 'https://picsum.photos/seed/galaxyS22/800/700',
    ),
  ];

  void _showRiskHowItWorks(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const _RiskHowItWorksSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: _surface,
        surfaceTintColor: _surface,
        titleSpacing: 16,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ocorrências na região',
              style: TextStyle(
                color: _ink,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 14, color: _muted),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    '$locality • $lastUpdate',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: _muted,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.5,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Filtrar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Filtro (exemplo)')),
              );
            },
            icon: const Icon(Icons.tune_rounded, color: _ink),
          ),
          IconButton(
            tooltip: 'Atualizar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Atualizando (exemplo)...')),
              );
            },
            icon: const Icon(Icons.refresh_rounded, color: _ink),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          // _RiskOverviewCard(
          //   data: risk,
          //   onSeeDetails: () => _toast(context, "Abrir detalhes de risco"),
          //   onHowItWorks: () => _showRiskHowItWorks(context),
          // ),
          // const SizedBox(height: 14),
          _RiskOverviewExpandableCard(
            data: risk,
            initiallyExpanded: true, // ou false
            onSeeDetails: () => _toast(context, "Abrir detalhes de risco"),
            onHowItWorks: () => _showRiskHowItWorks(context),
          ),
          const SizedBox(height: 14),
          // CARD 1 — Acesso rápido
          _Card(
            child: Column(
              children: [
                const _CardHeader(
                  title: 'Acesso rápido',
                  subtitle: 'Atalhos úteis para a sua região',
                  icon: Icons.flash_on_rounded,
                ),
                const _ThinDivider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _QuickActionTile(
                              icon: Icons.add_alert_outlined,
                              title: 'Reportar',
                              subtitle: 'Nova ocorrência',
                              accent: _success,
                              onTap: () =>
                                  _toast(context, 'Reportar ocorrência'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _QuickActionTile(
                              icon: Icons.search_rounded,
                              title: 'Pesquisar',
                              subtitle: 'Placa / IMEI',
                              accent: _primary,
                              onTap: () => _toast(context, 'Pesquisar item'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _QuickActionTile(
                              icon: Icons.list_alt_rounded,
                              title: 'Minhas',
                              subtitle: 'Ocorrências',
                              accent: const Color(0xFF8B5CF6),
                              onTap: () =>
                                  _toast(context, 'Minhas ocorrências'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _QuickActionTile(
                              icon: Icons.shield_outlined,
                              title: 'Dicas',
                              subtitle: 'Prevenção',
                              accent: const Color(0xFF6B7280),
                              onTap: () =>
                                  _toast(context, 'Dicas de segurança'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // CARD 2 — Listagem de ocorrências
          _Card(
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: _CardHeader(
                        title: 'Ocorrências recentes',
                        subtitle: 'Últimos registros próximos de você',
                        icon: Icons.public_rounded,
                        showBottomPadding: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 12),
                      child: _Pill(
                        text: '${items.length} itens',
                        icon: Icons.format_list_bulleted_rounded,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const _ThinDivider(),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const _ThinDivider(indent: 14),
                  itemBuilder: (_, i) => _IncidentRowItem(
                    item: items[i],
                    onTap: () =>
                        _toast(context, 'Abrir detalhes da ocorrência'),
                  ),
                ),
                const _ThinDivider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => _toast(context, 'Ver todas'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: _ink,
                            side: const BorderSide(color: _border),
                            backgroundColor: _surface,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'Ver todas',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () =>
                              _toast(context, 'Filtrar por categoria'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _primary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'Filtrar',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}

/* ==================== UI COMPONENTS ==================== */

class _Card extends StatelessWidget {
  final Widget child;
  const _Card({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _TesteHomeState._surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _ThinDivider extends StatelessWidget {
  final double indent;
  const _ThinDivider({this.indent = 0});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: _TesteHomeState._divider,
      indent: indent,
    );
  }
}

class _CardHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool showBottomPadding;

  const _CardHeader({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.showBottomPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(14, 14, 14, showBottomPadding ? 12 : 0),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: _TesteHomeState._primary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: _TesteHomeState._primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w900,
                    color: _TesteHomeState._ink,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: _TesteHomeState._muted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String text;
  final IconData icon;

  const _Pill({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: _TesteHomeState._primary.withOpacity(0.10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: _TesteHomeState._primary.withOpacity(0.18),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: _TesteHomeState._primary),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: _TesteHomeState._primary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color accent;
  final VoidCallback onTap;

  const _QuickActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.accent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F7FD),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: _TesteHomeState._border),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: accent.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: accent, size: 20),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: _TesteHomeState._ink,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: _TesteHomeState._muted,
                      fontSize: 12.2,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: _TesteHomeState._muted),
          ],
        ),
      ),
    );
  }
}

class _IncidentRowItem extends StatelessWidget {
  final IncidentFeedItem item;
  final VoidCallback onTap;

  const _IncidentRowItem({
    required this.item,
    required this.onTap,
  });

  static const _ink = _TesteHomeState._ink;
  static const _muted = _TesteHomeState._muted;

  bool get _isRecovered => item.kind == IncidentKind.recovered;

  IconData get _itemIcon => switch (item.itemKind) {
        ItemKind.car => Icons.directions_car_rounded,
        ItemKind.motorcycle => Icons.two_wheeler_rounded,
        ItemKind.phone => Icons.smartphone_rounded,
      };

  String get _kindLabel => switch (item.kind) {
        IncidentKind.robbery => 'Roubo',
        IncidentKind.theft => 'Furto',
        IncidentKind.recovered => 'Recuperado',
      };

  Color get _kindColor => switch (item.kind) {
        IncidentKind.robbery => const Color(0xFFE53935),
        IncidentKind.theft => const Color(0xFFF59E0B),
        IncidentKind.recovered => const Color(0xFF16A34A),
      };

  String _formatDate(DateTime dt) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(dt.day)}/${two(dt.month)}/${dt.year} • ${two(dt.hour)}:${two(dt.minute)}';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // imagem do produto roubado
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: 68,
                height: 56,
                color: const Color(0xFFF5F7FD),
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // nome do item
                  Text(
                    item.itemName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w900,
                      color: _ink,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Row(
                    children: [
                      // Container(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 8, vertical: 5),
                      //   decoration: BoxDecoration(
                      //     color: _kindColor.withOpacity(0.12),
                      //     borderRadius: BorderRadius.circular(999),
                      //     border: Border.all(
                      //       color: _kindColor.withOpacity(0.22),
                      //     ),
                      //   ),
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: [
                      //       // Icon(_itemIcon, size: 14, color: _kindColor),
                      //       // const SizedBox(width: 6),
                      //       // Text(
                      //       //   _kindLabel,
                      //       //   style: TextStyle(
                      //       //     fontSize: 12,
                      //       //     fontWeight: FontWeight.w900,
                      //       //     color: _kindColor,
                      //       //   ),
                      //       // ),
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '${_formatDate(item.date)} • ${item.district}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                            color: _muted,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),
            Icon(
              _isRecovered ? Icons.verified_rounded : Icons.chevron_right,
              color: _isRecovered ? _kindColor : _muted,
              size: _isRecovered ? 20 : 22,
            ),
          ],
        ),
      ),
    );
  }
}

enum RiskLevel { low, moderate, high, critical }

class RiskSummary {
  final String locality; // "Osasco • SP"
  final RiskLevel level; // high
  final int score; // 0..100
  final String periodLabel; // "Últimos 30 dias"
  final String updateLabel; // "Atualizado há 5 min"
  final double changePct7d; // +12.4 (negativo se caiu)

  // “drivers” (o que mais impactou)
  final List<RiskDriver> drivers;

  const RiskSummary({
    required this.locality,
    required this.level,
    required this.score,
    required this.periodLabel,
    required this.updateLabel,
    required this.changePct7d,
    required this.drivers,
  });
}

class RiskDriver {
  final String label; // "Roubo de celular"
  final String value; // "↑ 18%"
  final bool positiveUp; // true quando aumentou (piorou)
  final IconData icon;

  const RiskDriver({
    required this.label,
    required this.value,
    required this.positiveUp,
    required this.icon,
  });
}

class _RiskOverviewCard extends StatelessWidget {
  final RiskSummary data;
  final VoidCallback onSeeDetails;
  final VoidCallback onHowItWorks;

  const _RiskOverviewCard({
    required this.data,
    required this.onSeeDetails,
    required this.onHowItWorks,
  });

  static const _surface = _TesteHomeState._surface;
  static const _ink = _TesteHomeState._ink;
  static const _muted = _TesteHomeState._muted;
  static const _border = _TesteHomeState._border;
  static const _primary = _TesteHomeState._primary;

  Color get _levelColor => switch (data.level) {
        RiskLevel.low => const Color(0xFF16A34A),
        RiskLevel.moderate => const Color(0xFFF59E0B),
        RiskLevel.high => const Color(0xFFEF4444),
        RiskLevel.critical => const Color(0xFFB91C1C),
      };

  String get _levelLabel => switch (data.level) {
        RiskLevel.low => "Baixo",
        RiskLevel.moderate => "Moderado",
        RiskLevel.high => "Alto",
        RiskLevel.critical => "Crítico",
      };

  String get _changeLabel {
    final v = data.changePct7d;
    final arrow = v >= 0 ? "↑" : "↓";
    final abs = v.abs().toStringAsFixed(1).replaceAll('.', ',');
    return "$arrow $abs% (7 dias)";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
        child: Column(
          children: [
            // Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: _levelColor.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: _levelColor.withOpacity(0.22)),
                  ),
                  child: Icon(Icons.shield_rounded, color: _levelColor),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Periculosidade da região",
                        style: TextStyle(
                          color: _ink,
                          fontWeight: FontWeight.w900,
                          fontSize: 14.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined,
                              size: 14, color: _muted),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              "${data.locality} • ${data.periodLabel}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: _muted,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                _RiskPill(
                  text: _levelLabel,
                  color: _levelColor,
                ),
              ],
            ),

            const SizedBox(height: 12),
            const Divider(
                height: 1, thickness: 1, color: _TesteHomeState._divider),
            const SizedBox(height: 12),

            // Score + Change
            Row(
              children: [
                Expanded(
                  child: _MetricBox(
                    title: "Índice",
                    value: "${data.score}/100",
                    subtitle: data.updateLabel,
                    accent: _primary,
                    icon: Icons.speed_rounded,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _MetricBox(
                    title: "Variação",
                    value: _changeLabel,
                    subtitle: "comparado aos 7 dias anteriores",
                    accent: _levelColor,
                    icon: Icons.trending_up_rounded,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Drivers (o que pesa no risco)
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Principais fatores",
                style: TextStyle(
                  color: _muted,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Column(
              children: data.drivers.map((d) => _DriverRow(driver: d)).toList(),
            ),

            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F7FD),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: _border),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Este indicador é um resumo baseado em ocorrências reportadas e validações disponíveis.",
                      style: const TextStyle(
                        color: _muted,
                        fontWeight: FontWeight.w600,
                        height: 1.25,
                        fontSize: 12.2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: onHowItWorks,
                    child: const Text(
                      "Como calculamos?",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // CTAs
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onSeeDetails,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _ink,
                      side: const BorderSide(color: _border),
                      backgroundColor: _surface,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      "Ver detalhes",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Ex: abrir tela de filtro de localização
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Trocar região (exemplo)")),
                      );
                    },
                    icon: const Icon(Icons.tune_rounded, size: 18),
                    label: const Text(
                      "Trocar região",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RiskPill extends StatelessWidget {
  final String text;
  final Color color;

  const _RiskPill({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withOpacity(0.22)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: color,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _MetricBox extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color accent;
  final IconData icon;

  const _MetricBox({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.accent,
    required this.icon,
  });

  static const _ink = _TesteHomeState._ink;
  static const _muted = _TesteHomeState._muted;
  static const _border = _TesteHomeState._border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FD),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: accent.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: accent, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: _muted,
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: _ink,
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: _muted,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DriverRow extends StatelessWidget {
  final RiskDriver driver;
  const _DriverRow({required this.driver});

  static const _ink = _TesteHomeState._ink;
  static const _muted = _TesteHomeState._muted;
  static const _border = _TesteHomeState._border;

  Color get _valueColor {
    // se aumentou e isso é ruim, puxa pro vermelho/laranja; se caiu, puxa pro verde
    if (driver.positiveUp) return const Color(0xFFEF4444);
    return const Color(0xFF16A34A);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _border),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: _valueColor.withOpacity(0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(driver.icon, color: _valueColor, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              driver.label,
              style: const TextStyle(
                color: _ink,
                fontWeight: FontWeight.w800,
                fontSize: 13,
              ),
            ),
          ),
          Text(
            driver.value,
            style: TextStyle(
              color: _valueColor,
              fontWeight: FontWeight.w900,
              fontSize: 13,
            ),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.chevron_right, color: _muted),
        ],
      ),
    );
  }
}

class _RiskHowItWorksSheet extends StatelessWidget {
  const _RiskHowItWorksSheet();

  static const _ink = _TesteHomeState._ink;
  static const _muted = _TesteHomeState._muted;
  static const _primary = _TesteHomeState._primary;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(16, 10, 16, 16 + bottomInset),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          boxShadow: const [
            BoxShadow(
              color: Color(0x22000000),
              blurRadius: 24,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6EAF6),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: const [
                  Icon(Icons.info_outline, color: _primary),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Como calculamos o índice",
                      style: TextStyle(
                        color: _ink,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const _HowItWorksItem(
                title: "1) Volume de ocorrências",
                text:
                    "Considera quantas ocorrências foram reportadas na região no período selecionado.",
              ),
              const SizedBox(height: 8),
              const _HowItWorksItem(
                title: "2) Recência e proximidade",
                text:
                    "Ocorrências mais recentes e mais próximas recebem peso maior.",
              ),
              const SizedBox(height: 8),
              const _HowItWorksItem(
                title: "3) Tipo de evento",
                text:
                    "Alguns eventos podem ter peso maior (ex: roubo vs. furto).",
              ),
              const SizedBox(height: 8),
              const _HowItWorksItem(
                title: "4) Verificação (quando disponível)",
                text:
                    "Registros verificados podem aumentar a confiabilidade do indicador.",
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    "Entendi",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HowItWorksItem extends StatelessWidget {
  final String title;
  final String text;

  const _HowItWorksItem({required this.title, required this.text});

  static const _ink = _TesteHomeState._ink;
  static const _muted = _TesteHomeState._muted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FD),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE6EAF6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: _ink,
              fontWeight: FontWeight.w900,
              fontSize: 13.5,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            text,
            style: const TextStyle(
              color: _muted,
              fontWeight: FontWeight.w600,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}

class _RiskOverviewExpandableCard extends StatefulWidget {
  final RiskSummary data;
  final bool initiallyExpanded;
  final VoidCallback onSeeDetails;
  final VoidCallback onHowItWorks;

  const _RiskOverviewExpandableCard({
    required this.data,
    required this.onSeeDetails,
    required this.onHowItWorks,
    this.initiallyExpanded = false,
  });

  @override
  State<_RiskOverviewExpandableCard> createState() =>
      _RiskOverviewExpandableCardState();
}

class _RiskOverviewExpandableCardState
    extends State<_RiskOverviewExpandableCard> with TickerProviderStateMixin {
  static const _surface = _TesteHomeState._surface;
  static const _ink = _TesteHomeState._ink;
  static const _muted = _TesteHomeState._muted;
  static const _border = _TesteHomeState._border;
  static const _divider = _TesteHomeState._divider;
  static const _primary = _TesteHomeState._primary;

  late bool expanded = widget.initiallyExpanded;

  Color get _levelColor => switch (widget.data.level) {
        RiskLevel.low => const Color(0xFF16A34A),
        RiskLevel.moderate => const Color(0xFFF59E0B),
        RiskLevel.high => const Color(0xFFEF4444),
        RiskLevel.critical => const Color(0xFFB91C1C),
      };

  String get _levelLabel => switch (widget.data.level) {
        RiskLevel.low => "Baixo",
        RiskLevel.moderate => "Moderado",
        RiskLevel.high => "Alto",
        RiskLevel.critical => "Crítico",
      };

  String get _changeLabel {
    final v = widget.data.changePct7d;
    final arrow = v >= 0 ? "↑" : "↓";
    final abs = v.abs().toStringAsFixed(1).replaceAll('.', ',');
    return "$arrow $abs% (7 dias)";
  }

  String get _summaryLine {
    // ex: "Roubo de celular ↑ • Roubo de veículo ↑"
    final top = widget.data.drivers.take(2).toList();
    if (top.isEmpty) return "Sem dados suficientes para resumo.";
    return top.map((d) => "${d.label} ${d.value}").join(" • ");
  }

  void _toggle() => setState(() => expanded = !expanded);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Material(
          color: _surface,
          child: InkWell(
            onTap: _toggle, // tap no card todo alterna
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
              child: Column(
                children: [
                  // ===== Header sempre visível =====
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: _levelColor.withOpacity(0.10),
                          borderRadius: BorderRadius.circular(16),
                          border:
                              Border.all(color: _levelColor.withOpacity(0.22)),
                        ),
                        child: Icon(Icons.shield_rounded, color: _levelColor),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Periculosidade da região",
                              style: TextStyle(
                                color: _ink,
                                fontWeight: FontWeight.w900,
                                fontSize: 14.5,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.location_on_outlined,
                                    size: 14, color: _muted),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    "${widget.data.locality} • ${widget.data.periodLabel}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: _muted,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _RiskPill(text: _levelLabel, color: _levelColor),
                          const SizedBox(height: 6),
                          AnimatedRotation(
                            turns: expanded ? 0.5 : 0.0,
                            duration: const Duration(milliseconds: 180),
                            child: const Icon(Icons.expand_more_rounded,
                                color: _muted),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Linha compacta sempre visível (fica “profissional” mesmo colapsado)
                  Row(
                    children: [
                      _MiniMetric(
                        label: "Índice",
                        value: "${widget.data.score}/100",
                        color: _primary,
                        icon: Icons.speed_rounded,
                      ),
                      const SizedBox(width: 10),
                      _MiniMetric(
                        label: "Variação",
                        value: _changeLabel,
                        color: _levelColor,
                        icon: Icons.trending_up_rounded,
                      ),
                      const Spacer(),
                      Text(
                        widget.data.updateLabel,
                        style: const TextStyle(
                          color: _muted,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  // Resumo em 1 linha (aparece sempre, ajuda muito no colapsado)
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F7FD),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: _border),
                    ),
                    child: Text(
                      _summaryLine,
                      maxLines: expanded ? 3 : 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: _muted,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                        fontSize: 12.5,
                      ),
                    ),
                  ),

                  // ===== Conteúdo expansível =====
                  AnimatedSize(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOut,
                    alignment: Alignment.topCenter,
                    child: expanded
                        ? Column(
                            children: [
                              const SizedBox(height: 12),
                              const Divider(
                                  height: 1, thickness: 1, color: _divider),
                              const SizedBox(height: 12),

                              // Boxes completas
                              Row(
                                children: [
                                  Expanded(
                                    child: _MetricBox(
                                      title: "Índice",
                                      value: "${widget.data.score}/100",
                                      subtitle: widget.data.updateLabel,
                                      accent: _primary,
                                      icon: Icons.speed_rounded,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: _MetricBox(
                                      title: "Variação",
                                      value: _changeLabel,
                                      subtitle:
                                          "comparado aos 7 dias anteriores",
                                      accent: _levelColor,
                                      icon: Icons.trending_up_rounded,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Principais fatores",
                                  style: TextStyle(
                                    color: _muted,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Column(
                                children: widget.data.drivers
                                    .map((d) => _DriverRow(driver: d))
                                    .toList(),
                              ),

                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5F7FD),
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(color: _border),
                                ),
                                child: Row(
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        "Indicador baseado em ocorrências reportadas e validações disponíveis.",
                                        style: TextStyle(
                                          color: _muted,
                                          fontWeight: FontWeight.w600,
                                          height: 1.25,
                                          fontSize: 12.2,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    TextButton(
                                      onPressed: () {
                                        // não fecha o card; só abre a explicação
                                        widget.onHowItWorks();
                                      },
                                      child: const Text(
                                        "Como calculamos?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 12),

                              // CTAs
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: widget.onSeeDetails,
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: _ink,
                                        side: const BorderSide(color: _border),
                                        backgroundColor: _surface,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                      child: const Text(
                                        "Ver detalhes",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content:
                                              Text("Trocar região (exemplo)"),
                                        ));
                                      },
                                      icon: const Icon(Icons.tune_rounded,
                                          size: 18),
                                      label: const Text(
                                        "Trocar região",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: _primary,
                                        foregroundColor: Colors.white,
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MiniMetric extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final IconData icon;

  const _MiniMetric({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
  });

  static const _muted = _TesteHomeState._muted;
  static const _border = _TesteHomeState._border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FD),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _border),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: _muted,
                  fontWeight: FontWeight.w800,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w900,
                  fontSize: 12.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
