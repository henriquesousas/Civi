import 'package:deehelp/core/components/icon/ui_icon_alpha.dart';
import 'package:deehelp/core/components/ui_app_bar.dart';
import 'package:deehelp/core/resources/resources.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/widgets/search/ui_search_field.dart';
import 'package:deehelp/core/widgets/text-field/ui_text_field_rounded.dart';
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

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final MapController _mapController = MapController();
  final PanelController _panelController = PanelController();

  late AnimationController _menuController;
  // late Animation<double> _fadeAnimation;
  // late Animation<double> _scaleAnimation;
  //APPBAR
  late AnimationController _appBarController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  double _panelPosition = 0.0; // 0 = fechado, 1 = aberto
  @override
  void initState() {
    super.initState();
    _menuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: 1.0,
    );

    //APPBAr
    _appBarController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      value: 0.0,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1), // 👈 começa acima da tela
      end: Offset.zero, // 👈 posição normal
    ).animate(
        CurvedAnimation(parent: _appBarController, curve: Curves.easeInOut));

    _fadeAnimation = CurvedAnimation(
      parent: _appBarController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _appBarController.dispose();
    _menuController.dispose();
    super.dispose();
  }

  final List<RouboMarker> _roubos = [
    RouboMarker(
      titulo: "Roubo de celular",
      dataHora: DateTime(2025, 12, 1, 18, 20),
      descricao: "Vítima abordada próximo ao ponto de ônibus",
      pos: const LatLng(-23.5045, -46.8750),
    ),
    RouboMarker(
      titulo: "Roubo de bicicleta",
      dataHora: DateTime(2025, 12, 3, 7, 45),
      descricao: "Ocorrência em ciclovia durante a manhã",
      pos: const LatLng(-23.5160, -46.8825),
    ),
    RouboMarker(
      titulo: "Roubo a pedestre",
      dataHora: DateTime(2025, 12, 4, 22, 10),
      descricao: "Dois indivíduos em moto, sem feridos",
      pos: const LatLng(-23.5120, -46.8690),
      placaVeiculo: "XYZ-9A34",
      tipoVeiculo: TipoVeiculo.motocicleta,
    ),
    RouboMarker(
      titulo: "Roubo de carro",
      dataHora: DateTime(2025, 12, 5, 20, 30),
      descricao: "Veículo levado em estacionamento",
      pos: const LatLng(-23.5150, -46.8700),
      placaVeiculo: "ABC-1D23",
      tipoVeiculo: TipoVeiculo.veiculoLeve,
    ),
    RouboMarker(
      titulo: "Tentativa de assalto",
      dataHora: DateTime(2025, 12, 6, 15, 10),
      descricao: "Suspeitos fugiram sem levar nada",
      pos: const LatLng(-23.5180, -46.8720),
      placaVeiculo: "DEF-4G56",
      tipoVeiculo: TipoVeiculo.motocicleta,
    ),
    RouboMarker(
      titulo: "Roubo de carteira",
      dataHora: DateTime(2025, 12, 1, 9, 15),
      descricao: "Vítima no terminal de ônibus",
      pos: const LatLng(-23.5200, -46.8770),
    ),
    RouboMarker(
      titulo: "Roubo de bolsa",
      dataHora: DateTime(2025, 12, 2, 21, 30),
      descricao: "Em frente ao shopping center",
      pos: const LatLng(-23.5080, -46.8790),
    ),
    RouboMarker(
      titulo: "Roubo de motocicleta",
      dataHora: DateTime(2025, 12, 3, 23, 45),
      descricao: "Moto roubada em semáforo",
      pos: const LatLng(-23.5130, -46.8680),
      // placaVeiculo: "MNO-7P89",
      tipoVeiculo: TipoVeiculo.motocicleta,
    ),
    RouboMarker(
      titulo: "Arrastão",
      dataHora: DateTime(2025, 12, 4, 19, 20),
      descricao: "Grupo em carro abordou pedestres",
      pos: const LatLng(-23.5090, -46.8730),
      placaVeiculo: "GHI-2J45",
      tipoVeiculo: TipoVeiculo.veiculoLeve,
    ),
    RouboMarker(
      titulo: "Roubo de caminhão",
      dataHora: DateTime(2025, 12, 10, 14, 30),
      descricao: "Carga de alimentos roubada",
      pos: const LatLng(-23.5115, -46.8765),
      placaVeiculo: "QRS-8T12",
      tipoVeiculo: TipoVeiculo.veiculoPesado,
    ),
    RouboMarker(
      titulo: "Roubo de furgão",
      dataHora: DateTime(2025, 12, 12, 8, 45),
      descricao: "Veículo de entrega roubado",
      pos: const LatLng(-23.5140, -46.8790),
      placaVeiculo: "UVW-3X67",
      tipoVeiculo: TipoVeiculo.veiculoLeve,
    ),
    RouboMarker(
      titulo: "Roubo de ônibus escolar",
      dataHora: DateTime(2025, 12, 15, 16, 20),
      descricao: "Veículo escolar roubado durante a noite",
      pos: const LatLng(-23.5170, -46.8740),
      placaVeiculo: "KLM-0N90",
      tipoVeiculo: TipoVeiculo.veiculoPesado,
    ),
    RouboMarker(
      titulo: "Roubo de van",
      dataHora: DateTime(2025, 12, 18, 22, 10),
      descricao: "Van de transporte roubada",
      pos: const LatLng(-23.5095, -46.8805),
      placaVeiculo: "BCD-5E78",
      tipoVeiculo: TipoVeiculo.veiculoLeve,
    ),
    RouboMarker(
      titulo: "Roubo de carreta",
      dataHora: DateTime(2025, 12, 20, 3, 15),
      descricao: "Carreta com carga de eletrônicos",
      pos: const LatLng(-23.5125, -46.8775),
      placaVeiculo: "FGH-6I91",
      tipoVeiculo: TipoVeiculo.veiculoPesado,
    ),
    RouboMarker(
      titulo: "Roubo de scooter",
      dataHora: DateTime(2025, 12, 22, 11, 40),
      descricao: "Scooter elétrica roubada",
      pos: const LatLng(-23.5155, -46.8755),
      placaVeiculo: "JKL-7M23",
      tipoVeiculo: TipoVeiculo.motocicleta,
    ),
    RouboMarker(
      titulo: "Roubo de utilitário",
      dataHora: DateTime(2025, 12, 25, 19, 30),
      descricao: "Pick-up roubada em postos de gasolina",
      pos: const LatLng(-23.5100, -46.8780),
      placaVeiculo: "NOP-8Q34",
      tipoVeiculo: TipoVeiculo.veiculoLeve,
    ),
    RouboMarker(
      titulo: "Roubo de caminhão betoneira",
      dataHora: DateTime(2025, 12, 28, 6, 50),
      descricao: "Veículo de construção civil",
      pos: const LatLng(-23.5130, -46.8810),
      placaVeiculo: "RST-9U45",
      tipoVeiculo: TipoVeiculo.veiculoPesado,
    ),
    RouboMarker(
      titulo: "Roubo de moto de alta cilindrada",
      dataHora: DateTime(2025, 12, 30, 21, 15),
      descricao: "Moto esportiva roubada",
      pos: const LatLng(-23.5160, -46.8760),
      placaVeiculo: "VWX-0Y56",
      tipoVeiculo: TipoVeiculo.motocicleta,
    ),
    RouboMarker(
      titulo: "Roubo de carro de luxo",
      dataHora: DateTime(2026, 1, 2, 13, 25),
      descricao: "Veículo de alto valor roubado",
      pos: const LatLng(-23.5085, -46.8735),
      placaVeiculo: "YZA-1B67",
      tipoVeiculo: TipoVeiculo.veiculoLeve,
    ),
    RouboMarker(
      titulo: "Roubo de caminhão frigorífico",
      dataHora: DateTime(2026, 1, 5, 4, 40),
      descricao: "Carga de alimentos congelados",
      pos: const LatLng(-23.5110, -46.8795),
      placaVeiculo: "CDE-2F78",
      tipoVeiculo: TipoVeiculo.veiculoPesado,
    ),
    RouboMarker(
      titulo: "Roubo de equipamentos de ginástica laboral",
      dataHora: DateTime(2026, 1, 19, 17, 50),
      descricao: "Clínica de fisioterapia",
      pos: const LatLng(-23.5085, -46.8775),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //SlidingUp do search
          SlidingUpPanel(
            // defaultPanelState: PanelState.OPEN,
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
                          width: r.placaVeiculo != null ? 90 : 0,
                          height: 35,
                          child: GestureDetector(
                            onTap: () => _mostrarDetalhes(r),
                            child: WazeStyleMarker(
                              label: r.placaVeiculo ?? '',
                              icon: r.icone,
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
                // dispara animação quando painel >= 70%
                if (_panelPosition >= 0.15) {
                  _menuController.reverse();
                } else {
                  _menuController.forward();
                }

                // if (_panelPosition >= 0.7) {
                //   _appBarController.forward(); // aparece
                // } else {
                //   _appBarController.reverse(); // some
                // }
              });
            },
          ),

          //SlidingUp do Profile
          SlidingUpPanel(
            defaultPanelState: PanelState.CLOSED,
            controller: _panelController,
            minHeight: 0,
            isDraggable: true,
            maxHeight: MediaQuery.of(context).size.height,
            // maxHeight: MediaQuery.of(context).size.height -
            //     MediaQuery.of(context).padding.top -
            //     MediaQuery.of(context).padding.bottom,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            panel: ProfilePage(),
            // body: ProfilePage(),
            onPanelSlide: (pos) {
              setState(() {
                _panelPosition = pos;
                if (_panelPosition >= 0.15) {
                  _menuController.reverse();
                } else {
                  _menuController.forward();
                }
                // if (_panelPosition >= 0.7) {
                //   _appBarController.forward(); // aparece
                // } else {
                //   _appBarController.reverse(); // some
                // }
              });
            },
          ),

          // Menu Fab
          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            left: 12,
            child: FadeTransition(
              opacity: _menuController,
              child: ScaleTransition(
                scale: _menuController,
                child: FloatingActionButton(
                  heroTag: 'menu_fab',
                  elevation: 3,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  child: const Icon(Icons.menu, size: 30),
                  onPressed: () {
                    // _abrirMenuBottomSheet(context);
                    _panelController.open();
                    // WidgetsBinding.instance.addPostFrameCallback((_) {
                    //   _panelController.open();
                    // });
                  },
                ),
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

          // My Location FAB
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

          //APPbar
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   right: 0,
          //   child: SlideTransition(
          //     position: _slideAnimation,
          //     child: FadeTransition(
          //       opacity: _fadeAnimation,
          //       child: UIAppBar(title: "Appbar"),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildMarker() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          // 👈 aqui adiciona a borda cinza
          color: Colors.grey.shade400, // ou Colors.grey
          width: 1.5,
        ),
      ),
      child: Row(
        spacing: 2,
        children: [
          const SizedBox(width: 2),
          // Container(
          //   decoration: BoxDecoration(
          //     color: AppColors.primaryColor,
          //     shape: BoxShape.circle,
          //     border: Border.all(
          //       color: AppColors.primaryColor,
          //       width: 2,
          //     ),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.black.withOpacity(0.1),
          //         blurRadius: 4,
          //         offset: const Offset(0, 2),
          //       ),
          //     ],
          //   ),
          //   child: const Center(
          //     child: Icon(
          //       Icons.motorcycle,
          //       color: Colors.white,
          //       size: 18,
          //     ),
          //   ),
          // ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryColorDark, // 👈 borda branca
                width: 4, // 👈 2 pixels
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.1),
              //     blurRadius: 4,
              //     offset: const Offset(0, 2),
              //   ),
              // ],
            ),
            child: Center(
              child: Icon(
                Icons.motorcycle,
                color: AppColors.whiteColor,
                size: 22,
              ),
            ),
          ),

          const Text(
            "DND-0171",
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
              color: Colors.black,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.lightGreyColor,
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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 12),
                // Icon(Icons.search, color: Colors.grey.shade600),
                SvgPicture.asset(
                  R.images.svgSearch,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    AppColors.greyColor,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 8),
                // Expanded(
                //   child: TextField(
                //     decoration: const InputDecoration(
                //       hintText: "Buscar ocorrência...",
                //       border: InputBorder.none, // sem borda
                //       filled: false, // sem background
                //       isDense: true,
                //       contentPadding: EdgeInsets.symmetric(vertical: 14),
                //     ),
                //     style: const TextStyle(fontSize: 16),
                //     onSubmitted: (query) {
                //       // TODO: aplicar filtro
                //     },
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text("Buscar ocorrência..."),
                ),
                Spacer(),
                // IconButton(
                //   icon: Icon(Icons.mic, color: Colors.grey.shade600),
                //   onPressed: () {
                //     // TODO: integrar reconhecimento de voz
                //   },
                // ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SvgPicture.asset(
                    R.images.svgMapMic,
                    width: 24,
                    // colorFilter: ColorFilter.mode(
                    //   AppColors.greyColor,
                    //   BlendMode.srcIn,
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16),
        //   child: UISearchButton(
        //     onPressed: () {},
        //   ),
        //   // child: UITextFieldRounded(
        //   //   isRequired: true,
        //   //   showLabelText: false,
        //   //   labelText: "Marca",
        //   //   hintText: "Marca",
        //   //   readOnly: true,
        //   //   textInputAction: TextInputAction.next,
        //   //   keyboardType: TextInputType.text,
        //   //   fillColor: AppColors.lightGreyColor,
        //   //   suffixIcon: Icon(Icons.mic, color: Colors.grey.shade600),
        //   //   prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
        //   //   focusBorderColor: null,
        //   //   onTap: () => (),
        //   //   // controller: TextEditingController(
        //   //   //   text: state.brand,
        //   //   // ),
        //   // ),
        // ),
        const SizedBox(height: 12),
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

enum TipoVeiculo {
  motocicleta,
  veiculoLeve,
  veiculoPesado,
  outro,
}

class RouboMarker {
  final String titulo;
  final DateTime dataHora;
  final String descricao;
  final LatLng pos;
  final String? placaVeiculo;
  final TipoVeiculo tipoVeiculo;
  final IconData icone;

  RouboMarker({
    required this.titulo,
    required this.dataHora,
    required this.descricao,
    required this.pos,
    this.placaVeiculo,
    this.tipoVeiculo = TipoVeiculo.outro,
  }) : icone = _getIconByVehicleType(tipoVeiculo);

  static IconData _getIconByVehicleType(TipoVeiculo tipo) {
    switch (tipo) {
      case TipoVeiculo.motocicleta:
        return Icons.motorcycle;
      case TipoVeiculo.veiculoLeve:
        return Icons.directions_car;
      case TipoVeiculo.veiculoPesado:
        return Icons.local_shipping;
      case TipoVeiculo.outro:
        return Icons.warning;
    }
  }
}

class CustomMarker extends StatelessWidget {
  final String label;
  final IconData icon;

  const CustomMarker({
    Key? key,
    required this.label,
    this.icon = Icons.motorcycle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white, // fundo branco
        borderRadius: BorderRadius.circular(90),
        border: Border.all(
          color: Colors.grey.shade400, // 👈 borda cinza estilo Waze
          width: 2.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Ícone circular
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade400, // 👈 borda cinza no círculo também
                width: 2,
              ),
            ),
            child: Icon(
              icon,
              color: Colors.blue, // ícone azul
              size: 18,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class WazeStyleMarker extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;

  const WazeStyleMarker({
    super.key,
    required this.label,
    this.icon = Icons.motorcycle,
    this.iconColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade400, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _IconCircle(icon: icon, iconColor: iconColor),
            const SizedBox(width: 1),
            Text(
              label,
              style: const TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IconCircle extends StatelessWidget {
  final IconData icon;
  final Color iconColor;

  const _IconCircle({required this.icon, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: AppColors.primaryColor, width: 4),
      ),
      child: Icon(icon, color: AppColors.primaryColor, size: 16),
    );
  }
}

class UISearchButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String hintText;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;

  const UISearchButton({
    super.key,
    required this.onPressed,
    this.hintText = 'Pesquisar...',
    this.backgroundColor,
    this.iconColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultBackgroundColor = backgroundColor ?? Colors.grey.shade50;
    final defaultIconColor = iconColor ?? theme.primaryColor;
    final defaultBorderColor = borderColor ?? Colors.grey.shade300;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(90),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: defaultBackgroundColor,
              borderRadius: BorderRadius.circular(90),
              border: Border.all(
                color: defaultBorderColor,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: defaultIconColor,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    hintText,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



 // TODO: Vai aparecer em determinado momento
          // Positioned(
          //   bottom: 150, // ajuste conforme altura do seu SlidingUpPanel
          //   left: 0,
          //   right: 0,
          //   child: Center(
          //     child: Container(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(20),
          //         border: Border.all(color: Colors.grey.shade300),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.black.withOpacity(0.1),
          //             blurRadius: 6,
          //             offset: const Offset(0, 3),
          //           ),
          //         ],
          //       ),
          //       child: Text(
          //         "Total de ocorrências: 12", // variável dinâmica
          //         style: const TextStyle(
          //           fontSize: 14,
          //           fontWeight: FontWeight.w500,
          //           color: Colors.black87,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

