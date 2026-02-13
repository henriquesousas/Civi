import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/empty/empty_state.dart';
import 'package:deehelp/core/ui/widgets/tabs/segmented_tabs.dart';
import 'package:deehelp/feature/home/widgets/recent_incident_card.dart';
import 'package:deehelp/feature/incidents/list/widgets/fake_incident_list_model.dart';
import 'package:deehelp/feature/incidents/list/widgets/row_incident_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IncidentListPage extends StatefulWidget {
  const IncidentListPage({super.key});

  @override
  State<IncidentListPage> createState() => _IncidentListPageState();
}

class _IncidentListPageState extends State<IncidentListPage> {
  static const _bg = Color(0xFFF5F7FD);
  static const _surface = Colors.white;
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);
  static const _primary = Color(0xFF2B5BEE);

  int tabIndex = 0; // 0 todas, 1 ativas, 2 em análise, 3 finalizadas

  final List<FakeIncidentListModel> _items = [
    FakeIncidentListModel(
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
          'https://i0.statig.com.br/bancodeimagens/by/de/p9/bydep98gz6tsgdki4idyufx0x.jpg',
    ),
    FakeIncidentListModel(
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
      imageUrl:
          'https://images.unsplash.com/photo-1558980664-10e7170a2f9c?auto=format&fit=crop&w=1200&q=60',
    ),
    FakeIncidentListModel(
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
    FakeIncidentListModel(
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
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsKchykFXqp3JD5YiG7bUkN_ntC0YS2zgKFA&s',
    ),
  ];

  List<FakeIncidentListModel> get _filtered {
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

  void _openDetails(FakeIncidentListModel it) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Abrir detalhes: ${it.id}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final list = _filtered;

    return Scaffold(
      backgroundColor: _bg,
      appBar: DefaultAppBar(
        title: "Minhas ocorrências",
        press: () => context.pop(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: SegmentedTabs(
              index: tabIndex,
              onChanged: (i) => setState(() => tabIndex = i),
              items: const ['Todas', 'Ativas', 'Em análise', 'Finalizadas'],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 18),
              itemCount: list.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: SpacingSize.md),
              itemBuilder: (context, i) {
                final it = list[i];
                return RowIncidentItem(
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
