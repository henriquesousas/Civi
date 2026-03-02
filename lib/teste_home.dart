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
