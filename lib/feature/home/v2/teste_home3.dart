// home_screen.dart (refatorada: mais profissional e menos poluída)

import 'dart:math';
import 'package:deehelp/core/extension/color_extension.dart';
import 'package:flutter/material.dart';

class TesteHome5 extends StatefulWidget {
  const TesteHome5({super.key});

  @override
  State<TesteHome5> createState() => _TesteHome5State();
}

class _TesteHome5State extends State<TesteHome5> {
  // ====== Design tokens (consistência) ======
  static const _bg = Color(0xFFF3F5F8);
  static const _ink = Color(0xFF1F2A37);
  static const _muted = Color(0xFF6B7280);
  static const _primary = Color(0xFF667EEA);
  static const _card = Colors.white;

  static const _r12 = 12.0;
  static const _r16 = 16.0;
  static const _r20 = 20.0;

  static const _padScreen = EdgeInsets.all(16);
  static const _padCard = EdgeInsets.all(16);

  final List<String> _alertMessages = const [
    "⚠️ Atenção: o risco na sua região está elevado. Redobre o cuidado ao sair.",
    "🔔 Com risco alto, mantenha objetos de valor fora de vista.",
    "💡 Compartilhe sua rota com familiares hoje.",
    "🛡️ Evite vias desertas e prefira locais iluminados.",
    "📱 Deixe contatos de emergência acessíveis.",
    "👥 Avise vizinhos sobre movimentações suspeitas.",
  ];

  late final String _randomMessage;

  @override
  void initState() {
    super.initState();
    _randomMessage = _alertMessages[Random().nextInt(_alertMessages.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _TopBar(
              title: "Bem-vindo de volta,",
              subtitle: "Cidadão",
              badgeCount: 3,
              onNotifications: () {},
            ),
            SliverPadding(
              padding: _padScreen,
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // ====== Destaque do dia (menos chamativo, mais premium) ======
                  _HighlightIncidentCard(
                    title: "Nova ocorrência",
                    description:
                        "Roubo de veículo registrado no Centro • 10:30",
                    remaining: "23h restantes",
                    onTap: () {},
                  ),

                  const SizedBox(height: 12),

                  // ====== Score / risco ======
                  _CityRiskCard(
                    score: 72,
                    label: "Alto risco",
                    trendA: _MiniTrend(
                        label: "Roubos", value: "↑ 15%", tone: _Tone.danger),
                    trendB: _MiniTrend(
                        label: "Furtos", value: "↑ 8%", tone: _Tone.warning),
                    trendC: _MiniTrend(
                        label: "Vandalismo",
                        value: "↓ 3%",
                        tone: _Tone.success),
                  ),

                  const SizedBox(height: 12),

                  // ====== Dica do dia ======
                  _InfoBanner(
                    icon: Icons.security,
                    title: "Recomendação",
                    message: _randomMessage,
                    tone: _Tone.warning,
                  ),

                  const SizedBox(height: 12),

                  // ====== Panorama ======
                  _PanoramaCard(
                    headline: "Panorama de hoje",
                    chip: "Últimas 24h",
                    items: const [
                      _Metric(
                          label: "Ocorrências",
                          value: "12",
                          icon: Icons.warning_amber_rounded,
                          tone: _Tone.danger,
                          foot: "↑ 2"),
                      _Metric(
                          label: "Alertas",
                          value: "8",
                          icon: Icons.notifications_active,
                          tone: _Tone.warning,
                          foot: "3 novos"),
                      _Metric(
                          label: "Patrulhas",
                          value: "15",
                          icon: Icons.local_police,
                          tone: _Tone.primary,
                          foot: "Ativas"),
                      _Metric(
                          label: "Resolvidos",
                          value: "5",
                          icon: Icons.check_circle,
                          tone: _Tone.success,
                          foot: "80%"),
                    ],
                    insight: "Volume de ocorrências 15% maior que ontem",
                  ),

                  const SizedBox(height: 16),

                  // ====== Ocorrências 24h ======
                  // _SectionHeader(
                  //   title: "Ocorrências ativas",
                  //   subtitle: "Expiram em 24h",
                  //   icon: Icons.timer,
                  //   onAction: () {
                  //     // ver todas (opcional)
                  //   },
                  //   actionLabel: "Ver",
                  // ),

                  // const SizedBox(height: 10),

                  // _OccurrenceTile(
                  //   title: "Veículo suspeito",
                  //   location: "Centro, Rua Principal",
                  //   time: "Há 2h • 22h restantes",
                  //   tone: _Tone.warning,
                  //   icon: Icons.directions_car,
                  //   onTap: () {},
                  // ),
                  // _OccurrenceTile(
                  //   title: "Barulho suspeito",
                  //   location: "Jardim América",
                  //   time: "Há 5h • 19h restantes",
                  //   tone: _Tone.primary,
                  //   icon: Icons.home,
                  //   onTap: () {},
                  // ),
                  // _OccurrenceTile(
                  //   title: "Iluminação pública",
                  //   location: "Parque Central",
                  //   time: "Há 8h • 16h restantes",
                  //   tone: _Tone.neutral,
                  //   icon: Icons.lightbulb,
                  //   onTap: () {},
                  // ),

                  // const SizedBox(height: 16),

                  // ====== Comunidade (menos “painelzão”, mais compacto) ======
                  // _CommunityCard(
                  //   contributions: "157",
                  //   views: "1.2k",
                  //   active: "89",
                  //   activities: const [
                  //     _ActivityLine(
                  //         icon: Icons.person_outline,
                  //         text: "Alguém reportou veículo suspeito",
                  //         time: "10 min"),
                  //     _ActivityLine(
                  //         icon: Icons.route,
                  //         text: "2 pessoas compartilharam rotas",
                  //         time: "25 min"),
                  //     _ActivityLine(
                  //         icon: Icons.lightbulb_outline,
                  //         text: "Alguém sugeriu melhoria",
                  //         time: "1h"),
                  //   ],
                  //   onContribute: () {},
                  // ),
                  CommunityTipsAndActionsCard(
                    tips: const [
                      CommunityTip(
                        icon: Icons.traffic,
                        title: "Trânsito parado? atenção redobrada",
                        subtitle:
                            "Em retornos e sob viadutos, evite ficar exposto e observe ao redor.",
                      ),
                      CommunityTip(
                        icon: Icons.smartphone,
                        title: "Celular fora de vista",
                        subtitle:
                            "Preferir bolso interno/bolsa fechada em pontos de ônibus e semáforos.",
                      ),
                      CommunityTip(
                        icon: Icons.lightbulb,
                        title: "Prefira rotas iluminadas",
                        subtitle:
                            "Evite ruas desertas; se possível, caminhe acompanhado.",
                      ),
                    ],
                    onSendTip: () {
                      // abrir modal/tela “Enviar dica”
                      // showModalBottomSheet<ReportEntry>(
                      //   context: context,
                      //   isScrollControlled: false,
                      //   backgroundColor: Colors.transparent,
                      //   builder: (ctx) {
                      //     return const TesteReportyEntryBottomSheet();
                      //   },
                      // );
                    },
                    onShareRoute: () {
                      // abrir share sheet / deep link / etc.
                    },
                  ),

                  const SizedBox(height: 16),

                  // ====== Ações rápidas ======
                  _SectionHeader(
                    title: "Ações rápidas",
                    subtitle: "Atalhos",
                    icon: Icons.flash_on,
                  ),
                  const SizedBox(height: 10),

                  _QuickActionsGrid(
                    onReport: () {},
                    onRiskAreas: () {},
                    onNeighbors: () {},
                    onEmergency: () {},
                  ),

                  const SizedBox(height: 16),

                  // ====== Atualizações ======
                  _SectionHeader(
                    title: "Últimas atualizações",
                    subtitle: "Hoje",
                    icon: Icons.newspaper,
                    actionLabel: "Ver todas",
                    onAction: () {},
                  ),
                  const SizedBox(height: 10),

                  const _UpdateTile(
                    title: "Patrulhamento reforçado na região sul",
                    time: "Há 2 horas",
                    icon: Icons.policy,
                  ),
                  const _UpdateTile(
                    title: "Câmeras de segurança instaladas",
                    time: "Há 5 horas",
                    icon: Icons.videocam,
                  ),
                  const _UpdateTile(
                    title: "Reunião comunitária hoje às 19h",
                    time: "Há 8 horas",
                    icon: Icons.event,
                  ),

                  const SizedBox(height: 24),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =======================================================
// Components
// =======================================================

class _TopBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final int badgeCount;
  final VoidCallback onNotifications;

  const _TopBar({
    required this.title,
    required this.subtitle,
    required this.badgeCount,
    required this.onNotifications,
  });

  static const _ink = Color(0xFF1F2A37);
  static const _muted = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 16,
      title: Row(
        children: [
          _IconPill(icon: Icons.location_city),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 12, color: _muted, fontWeight: FontWeight.w500),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                    fontSize: 16, color: _ink, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: _NotificationButton(count: badgeCount, onTap: onNotifications),
        ),
      ],
    );
  }
}

class _IconPill extends StatelessWidget {
  final IconData icon;
  const _IconPill({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Icon(icon, size: 22, color: const Color(0xFF1F2A37)),
    );
  }
}

class _NotificationButton extends StatelessWidget {
  final int count;
  final VoidCallback onTap;

  const _NotificationButton({required this.count, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2))
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: onTap,
            color: const Color(0xFF1F2A37),
          ),
        ),
        if (count > 0)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(999)),
              child: Text(
                "$count",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
      ],
    );
  }
}

class _SurfaceCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  const _SurfaceCard({
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final content = Padding(padding: padding, child: child);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 18,
              offset: const Offset(0, 8)),
          BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: onTap == null
            ? ClipRRect(borderRadius: BorderRadius.circular(20), child: content)
            : InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: onTap,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), child: content),
              ),
      ),
    );
  }
}

class _HighlightIncidentCard extends StatelessWidget {
  final String title;
  final String description;
  final String remaining;
  final VoidCallback onTap;

  const _HighlightIncidentCard({
    required this.title,
    required this.description,
    required this.remaining,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _SurfaceCard(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF667EEA).withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.warning_amber_rounded,
                color: Color(0xFF667EEA), size: 26),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.6,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.timer, size: 14, color: Color(0xFF6B7280)),
                    const SizedBox(width: 4),
                    Text(
                      remaining,
                      style: const TextStyle(
                          fontSize: 11, color: Color(0xFF6B7280)),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1F2A37),
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.04),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_forward,
                size: 18, color: Color(0xFF1F2A37)),
          ),
        ],
      ),
    );
  }
}

class _CityRiskCard extends StatelessWidget {
  final int score;
  final String label;
  final _MiniTrend trendA;
  final _MiniTrend trendB;
  final _MiniTrend trendC;

  const _CityRiskCard({
    required this.score,
    required this.label,
    required this.trendA,
    required this.trendB,
    required this.trendC,
  });

  @override
  Widget build(BuildContext context) {
    final clamped = (score / 100).clamp(0.0, 1.0);
    final tone = score >= 70
        ? _Tone.warning
        : (score >= 40 ? _Tone.primary : _Tone.success);

    return _SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Score da cidade",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1F2A37)),
              ),
              const Spacer(),
              _Chip(
                text: label,
                tone: tone,
              ),
            ],
          ),
          const SizedBox(height: 14),
          Center(
            child: SizedBox(
              height: 180,
              width: 180,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 180,
                    width: 180,
                    child: CircularProgressIndicator(
                      value: clamped,
                      strokeWidth: 16, // mais "forte"
                      backgroundColor: Colors.grey[200],
                      valueColor:
                          AlwaysStoppedAnimation<Color>(_toneColor(tone)),
                      strokeCap: StrokeCap.round, // deixa mais premium
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "$score",
                          style: const TextStyle(
                            fontSize: 46, // menor que antes
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF1F2A37),
                            height: 1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "de 100",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Center(
          //   child: SizedBox(
          //     height: 140,
          //     width: 140,
          //     child: Stack(
          //       alignment: Alignment.center,
          //       children: [
          //         CircularProgressIndicator(
          //           value: clamped,
          //           strokeWidth: 12,
          //           backgroundColor: Colors.grey[200],
          //           valueColor: AlwaysStoppedAnimation<Color>(_toneColor(tone)),
          //         ),
          //         Column(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             Text(
          //               "$score",
          //               style: const TextStyle(
          //                   fontSize: 40,
          //                   fontWeight: FontWeight.w900,
          //                   color: Color(0xFF1F2A37)),
          //             ),
          //             Text("de 100",
          //                 style:
          //                     TextStyle(fontSize: 13, color: Colors.grey[600])),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _TrendPill(trendA),
              _TrendPill(trendB),
              _TrendPill(trendC),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoBanner extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final _Tone tone;

  const _InfoBanner({
    required this.icon,
    required this.title,
    required this.message,
    required this.tone,
  });

  @override
  Widget build(BuildContext context) {
    final c = _toneColor(tone);
    return _SurfaceCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: c.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: c, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1F2A37))),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(
                      fontSize: 13, color: Color(0xFF374151), height: 1.35),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PanoramaCard extends StatelessWidget {
  final String headline;
  final String chip;
  final List<_Metric> items;
  final String insight;

  const _PanoramaCard({
    required this.headline,
    required this.chip,
    required this.items,
    required this.insight,
  });

  @override
  Widget build(BuildContext context) {
    return _SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const _MiniIcon(icon: Icons.timeline),
              const SizedBox(width: 8),
              Text(headline,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1F2A37))),
              const Spacer(),
              _NeutralChip(text: chip),
            ],
          ),
          const SizedBox(height: 12),
          // 2x2 grid “limpo”
          Row(
            children: [
              Expanded(child: _MetricCard(items[0])),
              const SizedBox(width: 10),
              Expanded(child: _MetricCard(items[1])),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _MetricCard(items[2])),
              const SizedBox(width: 10),
              Expanded(child: _MetricCard(items[3])),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.03),
                borderRadius: BorderRadius.circular(14)),
            child: Row(
              children: [
                Icon(Icons.trending_up, size: 18, color: Colors.orange[700]),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    insight,
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
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

class _SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onAction;

  const _SectionHeader({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _MiniIcon(icon: icon),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Color(0xFF1F2A37)),
        ),
        const SizedBox(width: 8),
        _NeutralChip(text: subtitle),
        const Spacer(),
        if (actionLabel != null)
          TextButton(
            onPressed: onAction,
            child: Text(actionLabel!,
                style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
      ],
    );
  }
}

class _OccurrenceTile extends StatelessWidget {
  final String title;
  final String location;
  final String time;
  final _Tone tone;
  final IconData icon;
  final VoidCallback onTap;

  const _OccurrenceTile({
    required this.title,
    required this.location,
    required this.time,
    required this.tone,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final c = _toneColor(tone);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: _SurfaceCard(
        onTap: onTap,
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: c.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14)),
              child: Icon(icon, color: c, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1F2A37))),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          size: 12, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[600]),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _Chip(text: "Expira", tone: tone, compact: true),
                const SizedBox(height: 6),
                Text(time,
                    style: TextStyle(fontSize: 11, color: Colors.grey[500])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CommunityCard extends StatelessWidget {
  final String contributions;
  final String views;
  final String active;
  final List<_ActivityLine> activities;
  final VoidCallback onContribute;

  const _CommunityCard({
    required this.contributions,
    required this.views,
    required this.active,
    required this.activities,
    required this.onContribute,
  });

  @override
  Widget build(BuildContext context) {
    // troquei o gradient forte por um “tinted surface” mais elegante
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF43A047).withOpacity(0.10),
        border: Border.all(color: const Color(0xFF43A047).withOpacity(0.18)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                _MiniIcon(icon: Icons.people, tone: _Tone.success),
                SizedBox(width: 8),
                Text(
                  "Movimentos da comunidade",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1F2A37)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _Stat(label: "Contribuições", value: contributions),
                _Stat(label: "Visualizações", value: views),
                _Stat(label: "Ativos", value: active),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  for (int i = 0; i < activities.length; i++) ...[
                    _ActivityRow(activities[i]),
                    if (i != activities.length - 1) const Divider(height: 16),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Icon(Icons.privacy_tip, size: 16, color: Color(0xFF43A047)),
                SizedBox(width: 8),
                Text(
                  "Informações anônimas",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF43A047)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onContribute,
                icon: const Icon(Icons.add),
                label: const Text("Contribuir agora"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF43A047),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  textStyle: const TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickActionsGrid extends StatelessWidget {
  final VoidCallback onReport;
  final VoidCallback onRiskAreas;
  final VoidCallback onNeighbors;
  final VoidCallback onEmergency;

  const _QuickActionsGrid({
    required this.onReport,
    required this.onRiskAreas,
    required this.onNeighbors,
    required this.onEmergency,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: _QuickAction(
                icon: Icons.add_alert,
                label: "Reportar",
                onTap: onReport,
                tone: _Tone.primary)),
        const SizedBox(width: 10),
        Expanded(
            child: _QuickAction(
                icon: Icons.location_on,
                label: "Áreas",
                onTap: onRiskAreas,
                tone: _Tone.neutral)),
        const SizedBox(width: 10),
        Expanded(
            child: _QuickAction(
                icon: Icons.group,
                label: "Vizinhos",
                onTap: onNeighbors,
                tone: _Tone.neutral)),
        const SizedBox(width: 10),
        Expanded(
            child: _QuickAction(
                icon: Icons.emergency,
                label: "Emergência",
                onTap: onEmergency,
                tone: _Tone.danger)),
      ],
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final _Tone tone;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.tone,
  });

  @override
  Widget build(BuildContext context) {
    final c = _toneColor(tone);
    final bg = c.withOpacity(tone == _Tone.danger ? 0.12 : 0.10);

    return _SurfaceCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: bg, borderRadius: BorderRadius.circular(14)),
            child: Icon(icon, color: c, size: 22),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: tone == _Tone.danger ? c : const Color(0xFF1F2A37)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _UpdateTile extends StatelessWidget {
  final String title;
  final String time;
  final IconData icon;

  const _UpdateTile(
      {required this.title, required this.time, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: _SurfaceCard(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color(0xFF667EEA).withOpacity(0.10),
                  borderRadius: BorderRadius.circular(14)),
              child: Icon(icon, color: const Color(0xFF667EEA), size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1F2A37))),
                  const SizedBox(height: 4),
                  Text(time,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =======================================================
// Small UI pieces
// =======================================================

enum _Tone { primary, warning, danger, success, neutral }

Color _toneColor(_Tone tone) {
  switch (tone) {
    case _Tone.primary:
      return const Color(0xFF667EEA);
    case _Tone.warning:
      return const Color(0xFFF59E0B);
    case _Tone.danger:
      return const Color(0xFFEF4444);
    case _Tone.success:
      return const Color(0xFF22C55E);
    case _Tone.neutral:
      return const Color(0xFF8B5CF6);
  }
}

class _MiniIcon extends StatelessWidget {
  final IconData icon;
  final _Tone tone;

  const _MiniIcon({required this.icon, this.tone = _Tone.primary});

  @override
  Widget build(BuildContext context) {
    final c = _toneColor(tone);
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: c.withOpacity(0.10), borderRadius: BorderRadius.circular(10)),
      child: Icon(icon, size: 16, color: c),
    );
  }
}

class _NeutralChip extends StatelessWidget {
  final String text;
  const _NeutralChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.circular(999)),
      child: Text(text,
          style: TextStyle(
              fontSize: 11,
              color: Colors.grey[700],
              fontWeight: FontWeight.w600)),
    );
  }
}

class _Chip extends StatelessWidget {
  final String text;
  final _Tone tone;
  final bool compact;

  const _Chip({required this.text, required this.tone, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final c = _toneColor(tone);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: compact ? 8 : 10, vertical: compact ? 5 : 6),
      decoration: BoxDecoration(
          color: c.withOpacity(0.12), borderRadius: BorderRadius.circular(999)),
      child: Text(
        text,
        style: TextStyle(
            fontSize: compact ? 10 : 11, color: c, fontWeight: FontWeight.w800),
      ),
    );
  }
}

class _MiniTrend {
  final String label;
  final String value;
  final _Tone tone;
  const _MiniTrend(
      {required this.label, required this.value, required this.tone});
}

class _TrendPill extends StatelessWidget {
  final _MiniTrend t;
  const _TrendPill(this.t);

  @override
  Widget build(BuildContext context) {
    final c = _toneColor(t.tone);
    return Column(
      children: [
        Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: c, shape: BoxShape.circle)),
        const SizedBox(height: 6),
        Text(t.label,
            style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF6B7280),
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 2),
        Text(t.value,
            style:
                TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: c)),
      ],
    );
  }
}

class _Metric {
  final String label;
  final String value;
  final IconData icon;
  final _Tone tone;
  final String foot;

  const _Metric({
    required this.label,
    required this.value,
    required this.icon,
    required this.tone,
    required this.foot,
  });
}

class _MetricCard extends StatelessWidget {
  final _Metric m;
  const _MetricCard(this.m);

  @override
  Widget build(BuildContext context) {
    final c = _toneColor(m.tone);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: c.withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: c.withOpacity(0.10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(m.icon, size: 14, color: c),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  m.label,
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(m.value,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w900, color: c)),
          const SizedBox(height: 2),
          Text(m.foot,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: c.withOpacity(0.85))),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String label;
  final String value;

  const _Stat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Color(0xFF1F2A37))),
        const SizedBox(height: 2),
        Text(label,
            style: TextStyle(
                fontSize: 10,
                color: Colors.grey[700],
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _ActivityLine {
  final IconData icon;
  final String text;
  final String time;

  const _ActivityLine(
      {required this.icon, required this.text, required this.time});
}

class _ActivityRow extends StatelessWidget {
  final _ActivityLine a;
  const _ActivityRow(this.a);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05), shape: BoxShape.circle),
          child: Icon(a.icon, size: 16, color: const Color(0xFF1F2A37)),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(a.text,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1F2A37))),
        ),
        Text(a.time, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
      ],
    );
  }
}

class CommunityTipsAndActionsCard extends StatelessWidget {
  final List<CommunityTip> tips;
  final VoidCallback onSendTip;
  final VoidCallback onShareRoute;

  const CommunityTipsAndActionsCard({
    super.key,
    required this.tips,
    required this.onSendTip,
    required this.onShareRoute,
  });

  @override
  Widget build(BuildContext context) {
    const ink = Color(0xFF1F2A37);
    const muted = Color(0xFF6B7280);
    const success = Color(0xFF22C55E);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: success.withOpacity(0.09),
        color: context.primaryColor.withOpacity(0.09),
        border: Border.all(color: context.primaryColor.withOpacity(0.18)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child:
                      Icon(Icons.people, size: 18, color: context.primaryColor),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dicas & ações",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: ink,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Sugestões rápidas para reduzir risco hoje",
                        style: TextStyle(
                          fontSize: 12,
                          color: muted,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                _Pill(
                  text: "Anônimo",
                  icon: Icons.privacy_tip,
                  tone: _PillTone.success,
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Tips list
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  for (int i = 0; i < tips.length; i++) ...[
                    _TipRow(tip: tips[i]),
                    if (i != tips.length - 1)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(height: 1),
                      ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Actions
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onSendTip,
                    icon: const Icon(Icons.edit, size: 18),
                    label: const Text("Enviar dica"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: ink,
                      side: BorderSide(
                          color: context.primaryColor.withOpacity(0.35)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      textStyle: const TextStyle(fontWeight: FontWeight.w800),
                      backgroundColor: Colors.white.withOpacity(0.6),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onShareRoute,
                    icon: const Icon(Icons.route, size: 18),
                    label: const Text("Compartilhar rota"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      textStyle: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Footnote
            Text(
              "Dica: registre ocorrências em 10s para alertar vizinhos próximos.",
              style: TextStyle(
                fontSize: 11,
                color: muted.withOpacity(0.95),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommunityTip {
  final IconData icon;
  final String title;
  final String subtitle;

  const CommunityTip({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

class _TipRow extends StatelessWidget {
  final CommunityTip tip;
  const _TipRow({required this.tip});

  @override
  Widget build(BuildContext context) {
    const ink = Color(0xFF1F2A37);
    const muted = Color(0xFF6B7280);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: context.primaryColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            tip.icon,
            size: 18,
            color: context.primaryColor,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tip.title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  color: ink,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                tip.subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: muted,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

enum _PillTone { success, neutral }

class _Pill extends StatelessWidget {
  final String text;
  final IconData icon;
  final _PillTone tone;

  const _Pill({
    required this.text,
    required this.icon,
    required this.tone,
  });

  @override
  Widget build(BuildContext context) {
    final color = switch (tone) {
      // _PillTone.success => const Color(0xFF22C55E),
      _PillTone.success => context.primaryColor,
      _PillTone.neutral => const Color(0xFF6B7280),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
