import 'package:deehelp/core/components/icon/ui_icon_alpha.dart';
import 'package:deehelp/core/resources/resources.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/features/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final MapController _mapController = MapController();
  final PanelController _panelController = PanelController();

  double _panelPosition = 0.0; // 0 = fechado, 1 = aberto

  final List<RouboMarker> _roubos = [
    RouboMarker(
        "Roubo de celular",
        DateTime(2025, 12, 1, 18, 20),
        "Vítima abordada próximo ao ponto de ônibus",
        LatLng(-23.5045, -46.8750)),
    RouboMarker("Roubo de bicicleta", DateTime(2025, 12, 3, 7, 45),
        "Ocorrência em ciclovia durante a manhã", LatLng(-23.5160, -46.8825)),
    RouboMarker("Roubo a pedestre", DateTime(2025, 12, 4, 22, 10),
        "Dois indivíduos em moto, sem feridos", LatLng(-23.5120, -46.8690)),
    RouboMarker("Roubo de carro", DateTime(2025, 12, 5, 20, 30),
        "Veículo levado em estacionamento", LatLng(-23.5150, -46.8700)),
    RouboMarker("Tentativa de assalto", DateTime(2025, 12, 6, 15, 10),
        "Suspeitos fugiram sem levar nada", LatLng(-23.5180, -46.8720)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SlidingUpPanel(
            controller: _panelController,
            minHeight: 120,
            maxHeight: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            panel: _buildPanel(),
            body: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: LatLng(-23.5107, -46.8764),
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: _roubos
                      .map(
                        (r) => Marker(
                          point: r.pos,
                          width: 40,
                          height: 40,
                          child: GestureDetector(
                            onTap: () => _mostrarDetalhes(r),
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppColors.primaryColor, width: 2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: const Center(
                                  child: Icon(Icons.motorcycle,
                                      color: Colors.white, size: 22),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // (r) => Marker(
                        //   point: r.pos,
                        //   width: 40,
                        //   height: 40,
                        //   child: GestureDetector(
                        //     onTap: () => _mostrarDetalhes(r),
                        //     child: const Icon(
                        //       Icons.location_on,
                        //       color: Colors.red,
                        //       size: 36,
                        //     ),
                        //   ),
                        // ),
                      )
                      .toList(),
                ),
              ],
            ),
            onPanelSlide: (pos) {
              setState(() {
                _panelPosition = pos;
              });
            },
          ),

          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            left: 12,
            child: AnimatedSlide(
              // só inicia a saída quando o painel >= 90%
              offset:
                  _panelPosition >= 0.7 ? const Offset(-1.5, 0) : Offset.zero,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              child: FloatingActionButton(
                heroTag: 'menu_fab',
                elevation: 3,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: const Icon(Icons.menu, size: 30),
                onPressed: () {
                  _abrirMenuBottomSheet(context);
                },
              ),
            ),
          ),

          // Card com informação da localização
          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            right: 16,
            child: AnimatedSlide(
              offset:
                  _panelPosition >= 0.7 ? const Offset(1.5, 0) : Offset.zero,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              child: Material(
                color: Colors.transparent, // não interfere no fundo
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    // ação ao clicar
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Ícone dentro de círculo colorido
                        Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red.withOpacity(0.2),
                          ),
                          child: const Center(
                            child: Icon(Icons.location_on,
                                color: Colors.red, size: 16),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Barueri",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 210,
            right: 16,
            child: AnimatedSlide(
              offset:
                  _panelPosition >= 0.01 ? const Offset(2.0, 0) : Offset.zero,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              child: FloatingActionButton(
                heroTag: 'center_fab',
                elevation: 2,
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                child: const Icon(Icons.my_location, size: 28),
                onPressed: () {
                  _mapController.move(LatLng(-23.5107, -46.8764), 13.0);
                },
              ),
            ),
          ),

          // Botão alerta amarelo logo abaixo
          Positioned(
            bottom: 140, // fica abaixo do center fab
            right: 16,
            child: AnimatedSlide(
              offset:
                  _panelPosition >= 0.001 ? const Offset(2.0, 0) : Offset.zero,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              child: FloatingActionButton(
                heroTag: 'alert_fab',
                elevation: 2,
                backgroundColor: Colors.white,
                foregroundColor: Colors.amber,
                // child: const Icon(Icons.warning, size: 28),
                child: SvgPicture.asset(
                  R.images.svgMapInfo,
                  width: 28,
                ),
                onPressed: () {
                  // TODO: ação do alerta
                  debugPrint("Botão de alerta clicado!");
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => _bottomSheetInfoButton(),
                  );
                },
              ),
            ),
          ),

          // Vai aparecer em determinado momento
          Positioned(
            bottom: 150, // ajuste conforme altura do seu SlidingUpPanel
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  "Total de ocorrências: 12", // variável dinâmica
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomSheetInfoButton() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "O que você deseja fazer",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  // color: Colors.red, // cor de fundo
                  color: AppColors.lightGreyColor30,
                  shape: BoxShape.circle, // deixa o container circular
                  border: BoxBorder.all(
                    color: AppColors.lightGreyColor20,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    R.images.svgPoliceman,
                  ),
                ),
              ),
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  // color: Colors.red, // cor de fundo
                  color: AppColors.lightGreyColor30,
                  shape: BoxShape.circle, // deixa o container circular
                  border: BoxBorder.all(
                    color: AppColors.lightGreyColor20,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    R.images.svgMapBell,
                  ),
                ),
              ),
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.lightGreyColor30,
                  shape: BoxShape.circle,
                  border: BoxBorder.all(
                    color: AppColors.lightGreyColor20,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    R.images.svgMapAddNewProd,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildPanel() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          height: 4,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16),
        //   child: TextField(
        //     decoration: InputDecoration(
        //       hintText: "Buscar ocorrência...",
        //       prefixIcon: const Icon(Icons.search),
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(12),
        //       ),
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // fundo do container externo
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                Icon(Icons.search, color: Colors.grey.shade600),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Buscar ocorrência...",
                      border: InputBorder.none, // sem borda
                      filled: false, // sem background
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    style: const TextStyle(fontSize: 16),
                    onSubmitted: (query) {
                      // TODO: aplicar filtro
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.mic, color: Colors.grey.shade600),
                  onPressed: () {
                    // TODO: integrar reconhecimento de voz
                  },
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: _roubos.length,
        //     itemBuilder: (context, index) {
        //       final r = _roubos[index];
        //       return ListTile(
        //         leading: const Icon(Icons.warning, color: Colors.red),
        //         title: Text(r.titulo),
        //         subtitle:
        //             Text("${_formatarDataHora(r.dataHora)} • ${r.descricao}"),
        //         onTap: () {
        //           _mapController.move(r.pos, 15.0);
        //         },
        //       );
        //     },
        //   ),
        // ),
        Expanded(
          child: ListView.builder(
            itemCount: _roubos.length,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemBuilder: (context, index) {
              final r = _roubos[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Ícone em destaque
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(Icons.warning,
                          color: Colors.red, size: 26),
                    ),

                    const SizedBox(width: 12),

                    // Texto
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Título
                          Text(
                            r.titulo,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),

                          const SizedBox(height: 4),

                          // Data/hora
                          Text(
                            _formatarDataHora(r.dataHora),
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.grey.shade600,
                                    ),
                          ),

                          const SizedBox(height: 6),

                          // Descrição
                          Text(
                            r.descricao,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _abrirMenuBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // permite controlar altura
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return const FractionallySizedBox(
          heightFactor: 0.8, // ocupa 90% da tela
          child: ProfilePage(),
        );
      },
    );
  }

  void _mostrarDetalhes(RouboMarker r) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(r.titulo,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(_formatarDataHora(r.dataHora)),
            const SizedBox(height: 8),
            Text(r.descricao),
          ],
        ),
      ),
    );
  }

  String _formatarDataHora(DateTime dt) {
    final dia =
        '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';
    final hora =
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    return '$dia às $hora';
  }
}

class RouboMarker {
  final String titulo;
  final DateTime dataHora;
  final String descricao;
  final LatLng pos;

  RouboMarker(this.titulo, this.dataHora, this.descricao, this.pos);
}
