import 'package:flutter/material.dart';

class TestOcorrencia extends StatefulWidget {
  const TestOcorrencia({super.key});

  @override
  State<TestOcorrencia> createState() => _TestOcorrenciaState();
}

enum IncidentKind { robbery, theft, recovered }

enum IncidentStatus { active, inReview, canceled }

enum ItemType { car, moto, phone }

class _TestOcorrenciaState extends State<TestOcorrencia> {
  static const _bg = Color(0xFFF5F7FD);
  static const _surface = Colors.white;
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);
  static const _primary = Color(0xFF2B5BEE);

  int tabIndex = 0; // 0 todas, 1 ativas, 2 em análise, 3 finalizadas

  final List<_IncidentListModel> _items = [
    _IncidentListModel(
      id: 'INC-20391',
      itemName: 'CG Titan 150',
      itemType: ItemType.moto,
      kind: IncidentKind.robbery,
      status: IncidentStatus.active,
      location: 'Centro • Osasco/SP',
      happenedAt: 'Hoje • 14:10',
      postedAt: 'há 12 min',
      how:
          'Eu estava parado no semáforo e um homem se aproximou, apontou uma arma e levou a moto rapidamente.',
      imageUrl:
          'https://images.unsplash.com/photo-1558980664-10e7170a2f9c?auto=format&fit=crop&w=1200&q=60',
    ),
    _IncidentListModel(
      id: 'INC-20342',
      itemName: 'iPhone 13',
      itemType: ItemType.phone,
      kind: IncidentKind.theft,
      status: IncidentStatus.inReview,
      location: 'Bela Vista • Osasco/SP',
      happenedAt: 'Ontem • 21:30',
      postedAt: 'há 1 dia',
      how:
          'Foi levado enquanto eu aguardava o ônibus. Aconteceu rápido e não vi quem foi.',
      imageUrl: null,
    ),
    _IncidentListModel(
      id: 'INC-20211',
      itemName: 'HB20 1.0',
      itemType: ItemType.car,
      kind: IncidentKind.recovered,
      status: IncidentStatus.active,
      location: 'Vila Yara • Osasco/SP',
      happenedAt: 'há 5 dias',
      postedAt: 'há 5 dias',
      how: 'O carro estava estacionado e foi levado durante a noite.',
      imageUrl:
          'https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=1200&q=60',
    ),
    _IncidentListModel(
      id: 'INC-20110',
      itemName: 'CG Fan 160',
      itemType: ItemType.moto,
      kind: IncidentKind.robbery,
      status: IncidentStatus.canceled,
      location: 'Jardim das Flores • Osasco/SP',
      happenedAt: 'há 12 dias',
      postedAt: 'há 12 dias',
      how: 'Registro feito por engano, não ocorreu roubo.',
      imageUrl:
          'https://images.unsplash.com/photo-1558980664-10e7170a2f9c?auto=format&fit=crop&w=1200&q=60',
    ),
  ];

  List<_IncidentListModel> get _filtered {
    return _items.where((e) {
      if (tabIndex == 0) return true;
      if (tabIndex == 1)
        return e.status == IncidentStatus.active &&
            e.kind != IncidentKind.recovered;
      if (tabIndex == 2) return e.status == IncidentStatus.inReview;
      if (tabIndex == 3)
        return e.kind == IncidentKind.recovered ||
            e.status == IncidentStatus.canceled;
      return true;
    }).toList();
  }

  void _openDetails(_IncidentListModel it) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Abrir detalhes: ${it.id}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final list = _filtered;

    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        elevation: 0.8,
        backgroundColor: _surface,
        surfaceTintColor: _surface,
        iconTheme: const IconThemeData(color: _ink),
        title: const Text(
          'Minhas ocorrências',
          style: TextStyle(color: _ink, fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: _SegmentedTabs(
              index: tabIndex,
              onChanged: (i) => setState(() => tabIndex = i),
              items: const ['Todas', 'Ativas', 'Em análise', 'Finalizadas'],
            ),
          ),
          Expanded(
            child: list.isEmpty
                ? const _EmptyState()
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 18),
                    itemCount: list.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, i) {
                      final it = list[i];
                      return _IncidentPremiumCard(
                        item: it,
                        onTap: () => _openDetails(it),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: _primary,
        foregroundColor: Colors.white,
        elevation: 0,
        icon: const Icon(Icons.add_rounded),
        label: const Text(
          'Reportar',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}

/// ===============================
/// MODEL
/// ===============================
class _IncidentListModel {
  final String id;
  final String itemName;
  final ItemType itemType;
  final IncidentKind kind;
  final IncidentStatus status;
  final String location;
  final String happenedAt;
  final String postedAt;
  final String how; // ✅ até 300 chars
  final String? imageUrl;

  const _IncidentListModel({
    required this.id,
    required this.itemName,
    required this.itemType,
    required this.kind,
    required this.status,
    required this.location,
    required this.happenedAt,
    required this.postedAt,
    required this.how,
    required this.imageUrl,
  });

  bool get isVehicle => itemType == ItemType.car || itemType == ItemType.moto;
}

/// ===============================
/// SEGMENTED TABS
/// ===============================
class _SegmentedTabs extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChanged;
  final List<String> items;

  const _SegmentedTabs({
    required this.index,
    required this.onChanged,
    required this.items,
  });

  static const _primary = Color(0xFF2B5BEE);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _border),
      ),
      child: Row(
        children: List.generate(items.length, (i) {
          final selected = i == index;
          return Expanded(
            child: InkWell(
              onTap: () => onChanged(i),
              borderRadius: BorderRadius.circular(14),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOut,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: selected
                      ? _primary.withOpacity(0.10)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: selected
                        ? _primary.withOpacity(0.20)
                        : Colors.transparent,
                  ),
                ),
                child: Center(
                  child: Text(
                    items[i],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: selected ? _ink : _muted,
                      fontWeight: selected ? FontWeight.w900 : FontWeight.w800,
                      fontSize: 12.5,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

/// ===============================
/// INCIDENT PREMIUM CARD
/// - sem botão cancelar
/// - adiciona "Como foi" (até 300 chars)
/// ===============================
class _IncidentPremiumCard extends StatelessWidget {
  final _IncidentListModel item;
  final VoidCallback onTap;

  const _IncidentPremiumCard({
    required this.item,
    required this.onTap,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);

  bool get _hasImage =>
      item.imageUrl != null && item.imageUrl!.trim().isNotEmpty;

  IconData get _fallbackIcon => switch (item.itemType) {
        ItemType.car => Icons.directions_car_rounded,
        ItemType.moto => Icons.two_wheeler_rounded,
        ItemType.phone => Icons.smartphone_rounded,
      };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: _border),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 18,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: thumb + info
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      width: 82,
                      height: 74,
                      color: const Color(0xFFF5F7FD),
                      child: (item.isVehicle && _hasImage)
                          ? Image.network(
                              item.imageUrl!,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Center(
                                child: Icon(_fallbackIcon,
                                    color: _muted, size: 26),
                              ),
                            )
                          : Center(
                              child: Icon(_fallbackIcon, color: _ink, size: 28),
                            ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.itemName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: _ink,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15.5,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            _KindPill(kind: item.kind),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item.location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: _muted,
                            fontWeight: FontWeight.w800,
                            fontSize: 12.5,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _MetaPill(
                              icon: Icons.schedule_rounded,
                              text: item.happenedAt,
                            ),
                            _MetaPill(
                              icon: Icons.cloud_upload_outlined,
                              text: item.postedAt,
                            ),
                            _StatusPill(status: item.status),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              const Divider(height: 1, color: _border),
              const SizedBox(height: 12),

              // "Como foi" compact inside card
              Row(
                children: const [
                  Icon(Icons.description_outlined, size: 16, color: _muted),
                  SizedBox(width: 8),
                  Text(
                    'Como foi',
                    style: TextStyle(
                      color: _muted,
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                item.how.trim().isEmpty ? 'Não informado.' : item.how.trim(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: item.how.trim().isEmpty ? _muted : _ink,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  height: 1.25,
                ),
              ),

              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F7FD),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: _border),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Ver detalhes',
                        style: TextStyle(
                          color: _muted,
                          fontWeight: FontWeight.w900,
                          fontSize: 12.5,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.chevron_right_rounded,
                          color: _muted, size: 18),
                    ],
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

class _MetaPill extends StatelessWidget {
  final IconData icon;
  final String text;

  const _MetaPill({required this.icon, required this.text});

  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FD),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: _border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: _muted),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: _muted,
              fontWeight: FontWeight.w800,
              fontSize: 11.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _KindPill extends StatelessWidget {
  final IncidentKind kind;
  const _KindPill({required this.kind});

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

class _StatusPill extends StatelessWidget {
  final IncidentStatus status;
  const _StatusPill({required this.status});

  Color get _c => switch (status) {
        IncidentStatus.active => const Color(0xFF2B5BEE),
        IncidentStatus.inReview => const Color(0xFFFB8C00),
        IncidentStatus.canceled => const Color(0xFF8A96C8),
      };

  String get _t => switch (status) {
        IncidentStatus.active => 'ATIVA',
        IncidentStatus.inReview => 'EM ANÁLISE',
        IncidentStatus.canceled => 'CANCELADA',
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: _c.withOpacity(0.10),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: _c.withOpacity(0.20)),
      ),
      child: Text(
        _t,
        style: TextStyle(
          color: _c,
          fontWeight: FontWeight.w900,
          fontSize: 12,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

/// ===============================
/// EMPTY STATE
/// ===============================
class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFE6EAF6)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F000000),
                blurRadius: 18,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.inbox_outlined, size: 40, color: Color(0xFF8A96C8)),
              SizedBox(height: 12),
              Text(
                'Nenhuma ocorrência por aqui',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF1F2A44),
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Quando você reportar um incidente, ele aparecerá nesta lista.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF8A96C8),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
