import 'package:deehelp/core/components/icon/ui_icon.dart';
import 'package:deehelp/core/components/ui_app_bar.dart';
import 'package:deehelp/features/occurrence/presentation/occurrence_card_item_widget.dart';
import 'package:deehelp/features/occurrence/presentation/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/resources/resources.dart';
import '../../core/theme/app_colors.dart';

// --- 1. ENUMS E EXTENSIONS ---
enum TipoVeiculo {
  carro,
  moto,
  caminhao,
  outros,
}

extension TipoVeiculoExtension on TipoVeiculo {
  String get nome {
    switch (this) {
      case TipoVeiculo.carro:
        return 'Carro';
      case TipoVeiculo.moto:
        return 'Moto';
      case TipoVeiculo.caminhao:
        return 'Caminhão';
      case TipoVeiculo.outros:
        return 'Outros';
    }
  }

  String get icone {
    switch (this) {
      case TipoVeiculo.carro:
        return '🚗';
      case TipoVeiculo.moto:
        return '🏍️';
      case TipoVeiculo.caminhao:
        return '🚚';
      case TipoVeiculo.outros:
        return '❓';
    }
  }

  Color get corPrincipal {
    switch (this) {
      case TipoVeiculo.carro:
        return Colors.blue.shade600;
      case TipoVeiculo.moto:
        return Colors.orange.shade600;
      case TipoVeiculo.caminhao:
        return Colors.red.shade600;
      case TipoVeiculo.outros:
        return Colors.teal.shade600;
    }
  }
}

// --- 2. MODELO DE DADOS ---
class Ocorrencia {
  final String id;
  final String nomeVeiculo;
  final String placa;
  final TipoVeiculo tipo;
  final DateTime dataOcorrencia;
  final String? imagemUrl;
  final bool validado;
  final String local;
  final String? descricao;

  Ocorrencia({
    required this.id,
    required this.nomeVeiculo,
    required this.placa,
    required this.tipo,
    required this.dataOcorrencia,
    this.imagemUrl,
    required this.validado,
    required this.local,
    this.descricao,
  });
}

// --- 3. DADOS MOCKADOS MELHORADOS ---
// Usando as URLs originais e adicionando mais um item para teste
final List<Ocorrencia> _ocorrenciasMock = [
  Ocorrencia(
    id: '1',
    nomeVeiculo: 'Renault Megane E-Tech',
    placa: 'ABC1D23',
    tipo: TipoVeiculo.carro,
    dataOcorrencia: DateTime.now().subtract(const Duration(hours: 5)),
    imagemUrl:
        'https://stories.cnnbrasil.com.br/wp-content/uploads/sites/9/2024/09/carro-eletrico-megane.jpg',
    validado: true,
    local: 'Av. Paulista, São Paulo - SP',
    descricao: 'Veículo roubado em frente ao shopping. Ocupantes armados.',
  ),
  Ocorrencia(
    id: '2',
    nomeVeiculo: 'Yamaha MT-07',
    placa: 'XYZ4E56',
    tipo: TipoVeiculo.moto,
    dataOcorrencia: DateTime.now().subtract(const Duration(days: 2)),
    imagemUrl:
        "https://start.youse.com.br/wp-content/uploads/2024/03/novokwid_01.jpg__3832.0x2481.0_q85_subsampling-2-scaled.jpg",
    validado: false,
    local: 'Copacabana, Rio de Janeiro - RJ',
    descricao: 'Assalto no semáforo com dois indivíduos em outra moto.',
  ),
  Ocorrencia(
    id: '3',
    nomeVeiculo: 'Volvo FH 540',
    placa: 'CAM7B89',
    tipo: TipoVeiculo.caminhao,
    dataOcorrencia: DateTime.now().subtract(const Duration(hours: 12)),
    imagemUrl:
        'https://start.youse.com.br/wp-content/uploads/2024/03/novokwid_01.jpg__3832.0x2481.0_q85_subsampling-2-scaled.jpg',
    validado: true,
    local: 'Rodovia BR-101, KM 245 - SC',
    descricao: 'Carga de eletrônicos roubada durante parada para descanso.',
  ),
  Ocorrencia(
    id: '4',
    nomeVeiculo: 'Fiat Argo',
    placa: 'DEF0F12',
    tipo: TipoVeiculo.carro,
    dataOcorrencia: DateTime.now().subtract(const Duration(days: 3)),
    imagemUrl:
        'https://www.idinheiro.com.br/wp-content/uploads/2023/06/renault-kwid-zen.jpg',
    validado: false,
    local: 'Savassi, Belo Horizonte - MG',
    descricao: 'Veículo roubado em frente ao prédio durante a noite.',
  ),
  Ocorrencia(
    id: '5',
    nomeVeiculo: 'Bicicleta Caloi',
    placa: '',
    tipo: TipoVeiculo.outros,
    dataOcorrencia:
        DateTime.now().subtract(const Duration(minutes: 30)), // Recentíssima
    imagemUrl: '',
    validado: true,
    local: 'Parque Ibirapuera, São Paulo - SP',
    descricao: 'Furto de bicicleta no bicicletário.',
  ),
];

class OccurrencePage extends StatefulWidget {
  const OccurrencePage({super.key});

  @override
  _OccurrencePageState createState() => _OccurrencePageState();
}

class _OccurrencePageState extends State<OccurrencePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Ocorrencia> _ocorrencias = [];
  List<Ocorrencia> _filteredOcorrencias = [];

  // Filtros
  Set<TipoVeiculo> _filtrosTipo = {};
  bool _filtro24Horas = false;
  bool _mostrarApenasValidados = false;

  @override
  void initState() {
    super.initState();
    _carregarOcorrencias();
    _searchController.addListener(_filtrarOcorrencias);
  }

  void _carregarOcorrencias() {
    // Simula carregamento de dados
    _ocorrencias = _ocorrenciasMock;
    _filtrarOcorrencias();
  }

  void _filtrarOcorrencias() {
    final query = _searchController.text.toLowerCase();

    setState(() {
      _filteredOcorrencias = _ocorrencias.where((ocorrencia) {
        // 1. Filtro por pesquisa
        final matchesSearch = query.isEmpty ||
            ocorrencia.nomeVeiculo.toLowerCase().contains(query) ||
            ocorrencia.placa.toLowerCase().contains(query) ||
            ocorrencia.local.toLowerCase().contains(query);

        // 2. Filtro por tipo de veículo
        final matchesTipo =
            _filtrosTipo.isEmpty || _filtrosTipo.contains(ocorrencia.tipo);

        // 3. Filtro por 24 horas
        final matchesTempo = !_filtro24Horas ||
            ocorrencia.dataOcorrencia
                .isAfter(DateTime.now().subtract(const Duration(hours: 24)));

        // 4. Filtro por validação
        final matchesValidacao =
            !_mostrarApenasValidados || ocorrencia.validado;

        return matchesSearch && matchesTipo && matchesTempo && matchesValidacao;
      }).toList();

      // Ordena do mais recente para o mais antigo
      _filteredOcorrencias
          .sort((a, b) => b.dataOcorrencia.compareTo(a.dataOcorrencia));
    });
  }

  void _mostrarFiltros(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FiltrosBottomSheet(
        filtrosTipo: _filtrosTipo,
        filtro24Horas: _filtro24Horas,
        mostrarApenasValidados: _mostrarApenasValidados,
        onFiltrosChanged: (tipos, horas24, apenasValidados) {
          setState(() {
            _filtrosTipo = tipos;
            _filtro24Horas = horas24;
            _mostrarApenasValidados = apenasValidados;
          });
          _filtrarOcorrencias();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[50],
      appBar: UIAppBar(
        title: "Ocorrencias",
        actions: [
          UIICon(
              bgColor: Colors.grey.shade300,
              // radius: 12,
              icon: SvgPicture.asset(
                R.images.svgNotification,
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!,
                  BlendMode.srcIn,
                ),
              ))
        ],
      ),
      body: Column(
        // spacing: 10,
        children: [
          Row(
            children: [
              Expanded(
                child: SearchWidget(
                  controller: _searchController,
                ),
              ),
              const UIICon(
                icon: Icon(Icons.filter_list, color: Colors.white),
                bgColor: AppColors.primaryColor,
                // radius: 8,
              ),
            ],
          ),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_filteredOcorrencias.isEmpty) {
      final hasSearch = _searchController.text.isNotEmpty;
      final hasFilters =
          _filtrosTipo.isNotEmpty || _filtro24Horas || _mostrarApenasValidados;

      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                hasSearch || hasFilters
                    ? Icons.search_off_rounded
                    : Icons.search_off,
                size: 90,
                color: Colors.grey[300],
              ),
              const SizedBox(height: 24),
              Text(
                hasSearch || hasFilters
                    ? 'Nenhum resultado encontrado'
                    : 'Nenhuma ocorrência registrada',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                hasSearch || hasFilters
                    ? 'Ajuste os termos de busca ou limpe os filtros para ver mais ocorrências.'
                    : 'As ocorrências cadastradas aparecerão aqui. Comece a registrar uma agora!',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[500],
                ),
                textAlign: TextAlign.center,
              ),
              if (hasSearch || hasFilters)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _filtrosTipo.clear();
                        _filtro24Horas = false;
                        _mostrarApenasValidados = false;
                      });
                      _filtrarOcorrencias();
                    },
                    icon: const Icon(Icons.refresh_rounded, size: 20),
                    label: const Text('Limpar Filtros e Busca'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 1),
      itemCount: _filteredOcorrencias.length,
      itemBuilder: (context, index) {
        final occurrence = _filteredOcorrencias[index];
        return OccurrenceCardItemWidget(occurrence: occurrence);
      },
    );
  }

  @override
  void dispose() {
    _searchController.removeListener(_filtrarOcorrencias);
    _searchController.dispose();
    super.dispose();
  }
}

// class _OcorrenciaListItem extends StatelessWidget {
//   final Ocorrencia ocorrencia;
//
//   const _OcorrenciaListItem({required this.ocorrencia});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade100),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       // margin: EdgeInsets.only(bottom: 16),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: () => context.push(RouterConstant.productDetail),
//           child: Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withValues(alpha: 0.1),
//                   offset: const Offset(0, 4),
//                   blurRadius: 20,
//                   spreadRadius: 0,
//                 ),
//               ],
//             ),
//             child: Row(
//               spacing: 10,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 UINetworkImageWithLoader(
//                   width: 90,
//                   height: 90,
//                   src: ocorrencia.imagemUrl!,
//                 ),
//                 Expanded(
//                   child: OccurrenceItemWidget(occurrence: ocorrencia),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// --- 6. BOTTOM SHEET DE FILTROS ---
class FiltrosBottomSheet extends StatefulWidget {
  final Set<TipoVeiculo> filtrosTipo;
  final bool filtro24Horas;
  final bool mostrarApenasValidados;
  final Function(Set<TipoVeiculo>, bool, bool) onFiltrosChanged;

  const FiltrosBottomSheet({
    super.key,
    required this.filtrosTipo,
    required this.filtro24Horas,
    required this.mostrarApenasValidados,
    required this.onFiltrosChanged,
  });

  @override
  _FiltrosBottomSheetState createState() => _FiltrosBottomSheetState();
}

class _FiltrosBottomSheetState extends State<FiltrosBottomSheet> {
  late Set<TipoVeiculo> _selectedTipos;
  late bool _ultimas24Horas;
  late bool _apenasValidados;

  @override
  void initState() {
    super.initState();
    _selectedTipos = Set.from(widget.filtrosTipo);
    _ultimas24Horas = widget.filtro24Horas;
    _apenasValidados = widget.mostrarApenasValidados;
  }

  void _aplicarFiltros() {
    widget.onFiltrosChanged(_selectedTipos, _ultimas24Horas, _apenasValidados);
    Navigator.of(context).pop();
  }

  void _limparFiltros() {
    setState(() {
      _selectedTipos.clear();
      _ultimas24Horas = false;
      _apenasValidados = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Filtrar Ocorrências',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.grey[900],
            ),
          ),
          const SizedBox(height: 25),

          // Filtro por tipo de veículo
          Text(
            'Tipo de Veículo',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: TipoVeiculo.values.map((tipo) {
              final isSelected = _selectedTipos.contains(tipo);
              return FilterChip(
                label: Text(
                  '${tipo.icone} ${tipo.nome}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                selected: isSelected,
                selectedColor: tipo.corPrincipal.withOpacity(0.1),
                checkmarkColor: tipo.corPrincipal.darken(10),
                backgroundColor: Colors.grey[100],
                labelStyle: TextStyle(
                  color: isSelected
                      ? tipo.corPrincipal.darken(10)
                      : Colors.grey[700],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: isSelected ? tipo.corPrincipal : Colors.grey[300]!,
                    width: isSelected ? 1.5 : 1.0,
                  ),
                ),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedTipos.add(tipo);
                    } else {
                      _selectedTipos.remove(tipo);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 25),

          // Filtros de Status e Tempo
          _buildFilterSwitch(
            title: 'Últimas 24 horas',
            subtitle: 'Mostrar apenas ocorrências mais recentes',
            value: _ultimas24Horas,
            color: Colors.pink.shade700,
            onChanged: (value) {
              setState(() {
                _ultimas24Horas = value;
              });
            },
          ),
          const SizedBox(height: 12),
          _buildFilterSwitch(
            title: 'Apenas validadas',
            subtitle: 'Exibir somente ocorrências confirmadas',
            value: _apenasValidados,
            color: Colors.teal.shade700,
            onChanged: (value) {
              setState(() {
                _apenasValidados = value;
              });
            },
          ),

          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _limparFiltros,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    side: BorderSide(color: Colors.grey[400]!),
                    foregroundColor: Colors.grey[700],
                  ),
                  child: const Text('Limpar Filtros',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: ElevatedButton(
                  onPressed: _aplicarFiltros,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.blue[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Aplicar Filtros',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSwitch({
    required String title,
    required String subtitle,
    required bool value,
    required Color color,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: SwitchListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        subtitle: Text(subtitle,
            style: TextStyle(fontSize: 13, color: Colors.grey[600])),
        value: value,
        onChanged: onChanged,
        activeColor: color,
      ),
    );
  }
}

// Extensão para manipular cores (utilizada nos chips)
extension ColorManipulation on Color {
  Color darken(int amount) {
    assert(amount >= 0 && amount <= 100);
    final int r = (red - (255 * amount / 100)).round().clamp(0, 255);
    final int g = (green - (255 * amount / 100)).round().clamp(0, 255);
    final int b = (blue - (255 * amount / 100)).round().clamp(0, 255);
    return Color.fromARGB(alpha, r, g, b);
  }

  Color lighten(int amount) {
    assert(amount >= 0 && amount <= 100);
    final int r = (red + (255 * amount / 100)).round().clamp(0, 255);
    final int g = (green + (255 * amount / 100)).round().clamp(0, 255);
    final int b = (blue + (255 * amount / 100)).round().clamp(0, 255);
    return Color.fromARGB(alpha, r, g, b);
  }
}
