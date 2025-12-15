import 'package:deehelp/core/ui/widgets/icon/ui_icon.dart';
import 'package:deehelp/core/components/ui_app_bar.dart';
import 'package:deehelp/core/ui/widgets/image/ui_my_network_image_widget.dart';
import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/assets/resources.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/ui/widgets/divider/ui_divider.dart';
import 'package:deehelp/core/ui/widgets/badge/ui_badge_widget.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custon_list_tile_card.dart';
import 'package:deehelp/features/map/widgets/map_bottom_content.dart';
import 'package:deehelp/features/map/widgets/map_card_user_location.dart';
import 'package:deehelp/features/map/widgets/map_search.dart';
import 'package:deehelp/features/map/widgets/map_custom_sliding_up.dart';
import 'package:deehelp/features/map/widgets/map_floating_button.dart';
import 'package:deehelp/features/map/widgets/map_top_menu_button.dart';
import 'package:deehelp/features/map/widgets/osm.dart';
import 'package:deehelp/features/map/widgets/sliding_occurrences_panel.dart';
import 'package:deehelp/features/my_products/domain/product_status.dart';
import 'package:deehelp/features/my_products/presentation/listing/components/status_badge_widget.dart';
import 'package:deehelp/features/occurrence/presentation/plate_number_widget.dart';
import 'package:deehelp/features/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../core/theme/dimens.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
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
          // Map (Open Street Map)
          Osm(
            controller: _mapController,
            initial: const LatLng(-23.5107, -46.8764),
            item: _roubos,
            press: (r) => _mostrarDetalhes2(r, context),
          ),

          // SlidingUp do search
          MapCustomSlidingUp(
            controller: _panelController,
            minHeight: 125.w,
            maxHeight: context.percentHeight(0.9),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            panel: SlidingOccurrencesPanel(
              occurrences: _roubos,
              panelPosition: _panelPosition,
            ),
            onPanelSlide: (position) {
              setState(() {
                _panelPosition = position;
                _menuController.value =
                    (1 - (_panelPosition / 0.80)).clamp(0.0, 1.0);
              });
            },
          ),

          //SlidingUp do Profile
          MapCustomSlidingUp(
            controller: _panelController,
            minHeight: 0,
            maxHeight: context.screenHeight,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            panel: ProfilePage(
              onBackButtonPress: () => _panelController.close(),
            ),
            onPanelSlide: (positon) {
              setState(() {
                _panelPosition = positon;
                if (_panelPosition >= 0.15) {
                  _menuController.reverse();
                } else {
                  _menuController.forward();
                }
              });
            },
          ),

          // Top menu button
          MapTopMenuButton(
            animationMenuController: _menuController,
            press: () => _panelController.open(),
          ),

          // Fab button localizacao
          MapFloatButton(
            bottom: 140.h,
            right: 16.w,
            offset: _panelPosition >= 0.01 ? const Offset(2.0, 0) : Offset.zero,
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.whiteColor,
            child: Icon(Icons.explore, size: 18.w),
            press: () =>
                _mapController.move(const LatLng(-23.5107, -46.8764), 13.0),
          ),

          // Fab button acoes rapidas
          // MapFloatButton(
          //   bottom: 140.h,
          //   right: 16.w,
          //   offset:
          //       _panelPosition >= 0.001 ? const Offset(2.0, 0) : Offset.zero,
          //   child: SvgPicture.asset(
          //     R.images.svgMapInfo,
          //     width: 28.w,
          //   ),
          //   press: () {
          //     showModalBottomSheet(
          //       context: context,
          //       shape: const RoundedRectangleBorder(
          //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          //       ),
          //       builder: (context) => _bottomSheetInfoButton(),
          //     );
          //   },
          // ),

          // Conteudo fixo em baixo da tela
          MapBottomContent(
            onNewBemPress: () => context.push(RouterConstant.myItems),
            onSinalizePress: () => {},
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
          //       child: const UIAppBar(title: "Appbar"),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  void _focusOnCircle() {
    final myLocation = LatLng(-23.5107, -46.8764);
    final bounds = LatLngBounds.fromPoints([
      LatLng(myLocation.latitude + 0.018, myLocation.longitude + 0.018),
      LatLng(myLocation.latitude - 0.018, myLocation.longitude - 0.018),
    ]);

    final cameraFit = CameraFit.bounds(
      bounds: bounds,
      padding: const EdgeInsets.all(50),
    );

    _mapController.fitCamera(cameraFit);
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
              Column(
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
                  Text(
                    "Policia",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGreyColor10,
                    ),
                  )
                ],
              ),
              Column(
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
                        R.images.svgMapBell,
                      ),
                    ),
                  ),
                  Text(
                    "Nova ocorrência",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGreyColor10,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
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
                  Text(
                    "Novo bem",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGreyColor10,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  void _focusOnMarker(LatLng position) {
    _mapController.move(position, 15); // 👈 move a câmera para o marker
  }

  // void _mostrarDetalhes(RouboMarker r) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //     ),
  //     builder: (context) {
  //       return SafeArea(
  //         child: Container(
  //           margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //           decoration: BoxDecoration(
  //             color: AppColors.whiteColor,
  //             borderRadius: BorderRadius.circular(16),
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.black.withOpacity(0.08),
  //                 blurRadius: 6,
  //                 offset: const Offset(0, 3),
  //               ),
  //             ],
  //           ),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               // Header com botão de fechar
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 12, right: 12),
  //                 child: Align(
  //                   alignment: Alignment.topRight,
  //                   child: UIIConAlpha(
  //                     iconData: Icons.close,
  //                     color: AppColors.darkGreyColor,
  //                   ),
  //                 ),
  //               ),

  //               // Conteúdo principal
  //               Padding(
  //                 padding:
  //                     const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  //                 child: Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     ClipRRect(
  //                       borderRadius: BorderRadius.circular(12),
  //                       child: Image.network(
  //                         "https://canalve.com.br/wp-content/uploads/2023/07/VW-ID.4-3.jpg",
  //                         height: 90,
  //                         width: 120,
  //                         fit: BoxFit.cover,
  //                       ),
  //                     ),
  //                     const SizedBox(width: 12),
  //                     Expanded(
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: const [
  //                           Text(
  //                             "Ontem",
  //                             style: TextStyle(
  //                               fontSize: 13,
  //                               color: Colors.grey,
  //                             ),
  //                           ),
  //                           SizedBox(height: 4),
  //                           Text(
  //                             "Honda Civic 2.0",
  //                             style: TextStyle(
  //                               fontSize: 18,
  //                               fontWeight: FontWeight.bold,
  //                               color: Colors.black87,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),

  //               const Divider(height: 1, color: AppColors.lightGreyColor30),

  //               // Descrição
  //               Padding(
  //                 padding: const EdgeInsets.all(20),
  //                 child: const Text(
  //                   "Ocorrência: veículo envolvido em incidente de trânsito. "
  //                   "Informações em validação interna.",
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                     color: Colors.black87,
  //                     height: 1.4,
  //                   ),
  //                 ),
  //               ),

  //               const Divider(height: 1, color: AppColors.lightGreyColor30),

  //               // Footer com botão
  //               ClipRRect(
  //                 borderRadius: const BorderRadius.vertical(
  //                   bottom: Radius.circular(16),
  //                 ),
  //                 child: Container(
  //                   padding: const EdgeInsets.all(20),
  //                   color: AppColors.whiteColor,
  //                   child: UIElevatedButton(
  //                     radius: 90,
  //                     text: "Ver detalhes",
  //                     press: () {},
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // String _formatarDataHora(DateTime dt) {
  //   final dia =
  //       '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';
  //   final hora =
  //       '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  //   return '$dia às $hora';
  // }
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

void _mostrarDetalhes2(RouboMarker roubo, BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    // backgroundColor: Colors.transparent,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    ),
    builder: (context) {
      return Container(
        // constraints: BoxConstraints(
        //   maxHeight: MediaQuery.of(context).size.height * 0.85,
        // ),
        margin: const EdgeInsets.all(10),
        // decoration: BoxDecoration(
        //   color: AppColors.whiteColor,
        //   borderRadius: BorderRadius.circular(24),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.black.withOpacity(0.15),
        //       blurRadius: 20,
        //       spreadRadius: 0,
        //       offset: const Offset(0, 4),
        //     ),
        //   ],
        // ),
        child: Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),
          appBar: UIAppBar(
            title: "Roubo a veículo",
            centerTitle: true,
            textStyle: context.appTextStyles.bodyTextStyle1.copyWith(
              fontWeight: FontWeight.w600,
            ),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close),
            ),
            // actions: [
            //   IconButton(
            //     onPressed: () {},
            //     icon: const Icon(Icons.help_outline),
            //   )
            // ],
          ),
          body: SingleChildScrollView(
            child: Column(
              spacing: 3,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header com indicador
                _buildHeader(context),
                _buildInfo(context),
                _buildDetails(context),
                _buidOwnSection(context),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: UIElevatedButton(
                    // radius: 8,
                    width: context.percentWidth(0.5),
                    text: "Confirmar",
                    press: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildHeader(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(4),
      border: const Border(
        bottom: BorderSide(
          color: AppColors.lightGreyColor30,
          width: 1.0,
        ),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 10,
            children: [
              const StatusBadgeWidget(status: ProductSatus.active),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGreyColor30),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "Vitima#123",
                    style: context.appTextStyles.caption2Style,
                  ))
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Ford Focus 2.0",
            style: context.appTextStyles.bodyTextStyle2.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: Dimens.size20.sp,
            ),
          ),
          Text(
            "Osasco - São Paulo, próximo Avenida João ventura dos Santos",
            style: context.appTextStyles.bodyTextStyle2.copyWith(
              color: AppColors.textColorBody,
              fontSize: Dimens.size14.sp,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildInfo(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(4),
      border: const Border(
        bottom: BorderSide(
          color: AppColors.lightGreyColor30,
          width: 1.0,
        ),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              SvgPicture.asset(
                R.images.svgStatementInactive,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  AppColors.textColorBody,
                  BlendMode.srcIn,
                ),
              ),
              Expanded(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting y. Lorem Ipsum has been the industry's standard, Lorem Ipsum is simply dummy text of the printing and typesetting y. Lorem Ipsum has been the industry's standard, ",
                  style: context.appTextStyles.bodyTextStyle2.copyWith(
                    color: AppColors.textColorBody,
                    fontSize: Dimens.size14.sp,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const UIMyNetworkImageWidget(
            imageUrl:
                "https://www.remaza.com.br/uploads/bc51be65-9c0a-415c-92bf-d41442c9bed7/fiat-strada-marcas-de-carros-remaza.png",
          ),
        ],
      ),
    ),
  );
}

Widget _buildDetails(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(4),
      // border: Border.all(
      //   color: AppColors.lightGreyColor20,
      // ),
      border: const Border(
        bottom: BorderSide(
          color: AppColors.lightGreyColor30,
          width: 1.0,
        ),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        spacing: 12,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5,
            children: [
              SvgPicture.asset(
                R.images.svgStatementInactive,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  AppColors.textColorBody,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                "Placa",
                style: context.appTextStyles.bodyTextStyle2.copyWith(
                  color: AppColors.textColorBody,
                  fontSize: Dimens.size14.sp,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "DND-0171",
                  style: context.appTextStyles.caption2Style.copyWith(
                    color: AppColors.primaryColorDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // const PlateNumberWidget(plateNumber: 'DND0171'),
            ],
          ),

          //Linha 2
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5,
            children: [
              SvgPicture.asset(
                R.svg.time,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  AppColors.textColorBody,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                "Hora aproximada",
                style: context.appTextStyles.bodyTextStyle2.copyWith(
                  color: AppColors.textColorBody,
                  fontSize: Dimens.size14.sp,
                ),
              ),
              const Spacer(),
              Text(
                "00:00",
                style: context.appTextStyles.caption2Style.copyWith(
                  color: AppColors.textColorBody,
                ),
              ),
            ],
          ),

          //Linha 3
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5,
            children: [
              SvgPicture.asset(
                R.svg.date,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  AppColors.textColorBody,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                "Data",
                style: context.appTextStyles.bodyTextStyle2.copyWith(
                  color: AppColors.textColorBody,
                  fontSize: Dimens.size14.sp,
                ),
              ),
              const Spacer(),
              Text(
                "15 de outubro de 2023",
                style: context.appTextStyles.caption2Style.copyWith(
                  color: AppColors.textColorBody,
                ),
              ),
            ],
          ),

          // Linha 4
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5,
            children: [
              SvgPicture.asset(
                R.images.svgCategory,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  AppColors.textColorBody,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                "Tipo",
                style: context.appTextStyles.bodyTextStyle2.copyWith(
                  color: AppColors.textColorBody,
                  fontSize: Dimens.size14.sp,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Carro",
                  style: context.appTextStyles.caption2Style.copyWith(
                    color: AppColors.primaryColorDark,
                    fontWeight: FontWeight.w500,
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

Widget _buidOwnSection(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.lightGreyColor,
      borderRadius: BorderRadius.circular(4),
      // border: const Border(
      //   bottom: BorderSide(
      //     color: AppColors.lightGreyColor30,
      //     width: 1.0,
      //   ),
      // ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5,
            children: [
              const Icon(
                Icons.visibility_outlined,
                color: AppColors.textColorBody,
              ),
              Text(
                "Visivel",
                style: context.appTextStyles.bodyTextStyle2.copyWith(
                  color: AppColors.textColorBody,
                  fontSize: Dimens.size14.sp,
                ),
              ),
              const Spacer(),
              TextToggleButtons(),
            ],
          ),

          //LInha 2
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5,
            children: [
              const Icon(
                Icons.delete_outlined,
                color: AppColors.errorColor,
              ),
              Text(
                "Remover",
                style: context.appTextStyles.bodyTextStyle2.copyWith(
                  color: AppColors.errorColorDark,
                  fontSize: Dimens.size14.sp,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                R.images.svgArrowFront,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  AppColors.textColorBody,
                  BlendMode.srcIn,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget _buildVehicleInfo(RouboMarker roubo) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Imagem do veículo com badge
        Stack(
          children: [
            Container(
              width: 110,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.lightGreyColor20,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  _getVehicleImage(roubo.tipoVeiculo),
                  width: 110,
                  height: 80,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                        strokeWidth: 2,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.lightGreyColor20,
                      child: Icon(
                        roubo.icone,
                        color: AppColors.lightGreyColor30,
                        size: 36,
                      ),
                    );
                  },
                ),
              ),
            ),
            if (roubo.placaVeiculo != null)
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    roubo.placaVeiculo!,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
          ],
        ),

        const SizedBox(width: 16),

        // Informações do veículo
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tipo e status
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color:
                          _getStatusColor(roubo.tipoVeiculo).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      _getVehicleTypeLabel(roubo.tipoVeiculo),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: _getStatusColor(roubo.tipoVeiculo),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.circle,
                    color: _getStatusColor(roubo.tipoVeiculo),
                    size: 8,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "Ativo",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Título
              Text(
                roubo.titulo,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkGreyColor,
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 8),

              // Data e hora
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 14,
                    color: AppColors.lightGreyColor30,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    _formatDateTime(roubo.dataHora),
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildDetailsSection(RouboMarker roubo) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Descrição",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.darkGreyColor,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.lightGreyColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            roubo.descricao,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.darkGreyColor,
              height: 1.5,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildAdditionalInfo(RouboMarker roubo) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Informações Adicionais",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.darkGreyColor,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildInfoItem(
              icon: Icons.person_outline,
              title: "Tipo",
              value: _getVehicleTypeLabel(roubo.tipoVeiculo),
            ),
            const SizedBox(width: 20),
            _buildInfoItem(
              icon: Icons.local_police_outlined,
              title: "Status",
              value: "Registrado",
            ),
          ],
        ),
        // const SizedBox(height: 12),
        // _buildInfoItem(
        //   icon: Icons.assignment_outlined,
        //   title: "Protocolo",
        //   value: "INC - 456",
        // ),
      ],
    ),
  );
}

Widget _buildLocationSection(RouboMarker roubo) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Localização",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.darkGreyColor,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.lightGreyColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColors.primaryColor,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "R. das Flores, 123 - Centro",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "São Paulo - SP",
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.navigate_next,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildActionButtons(RouboMarker roubo) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Row(
          children: [
            // Expanded(
            //   child: OutlinedButton(
            //     onPressed: () {},
            //     style: OutlinedButton.styleFrom(
            //       padding: const EdgeInsets.symmetric(vertical: 14),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //       side: BorderSide(color: AppColors.lightGreyColor20),
            //     ),
            //     child: Text(
            //       "Fechar",
            //       style: TextStyle(
            //         fontSize: 15,
            //         fontWeight: FontWeight.w600,
            //         color: AppColors.darkGreyColor,
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: AppColors.primaryColor,
                ),
                child: const Text(
                  "Ver Detalhes",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
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

String _getVehicleImage(TipoVeiculo tipo) {
  switch (tipo) {
    case TipoVeiculo.motocicleta:
      return "https://images.unsplash.com/photo-1558981806-ec527fa84c39?w=400&h=300&fit=crop";
    case TipoVeiculo.veiculoLeve:
      return "https://images.unsplash.com/photo-1549399542-7e3f8b79c341?w-400&h-300&fit-crop";
    case TipoVeiculo.veiculoPesado:
      return "https://images.unsplash.com/photo-1575361204480-aadea25e6e68?w-400&h-300&fit-crop";
    default:
      return "https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?w-400&h-300&fit-crop";
  }
}

Color _getStatusColor(TipoVeiculo tipo) {
  switch (tipo) {
    case TipoVeiculo.motocicleta:
      return Colors.orange;
    case TipoVeiculo.veiculoLeve:
      return Colors.blue;
    case TipoVeiculo.veiculoPesado:
      return Colors.red;
    default:
      return Colors.grey;
  }
}

String _getVehicleTypeLabel(TipoVeiculo tipo) {
  switch (tipo) {
    case TipoVeiculo.motocicleta:
      return "MOTOCICLETA";
    case TipoVeiculo.veiculoLeve:
      return "VEÍCULO LEVE";
    case TipoVeiculo.veiculoPesado:
      return "VEÍCULO PESADO";
    default:
      return "OUTRO";
  }
}

String _formatDateTime(DateTime dateTime) {
  return "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year} • ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
}

Widget _buildInfoItem({
  required IconData icon,
  required String title,
  required String value,
}) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor30,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.lightGreyColor30),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.darkGreyColor,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class TextToggleButtons extends StatefulWidget {
  @override
  _TextToggleButtonsState createState() => _TextToggleButtonsState();
}

class _TextToggleButtonsState extends State<TextToggleButtons> {
  List<bool> _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: _isSelected,
      borderRadius: BorderRadius.circular(8),
      selectedColor: AppColors.whiteColor,
      selectedBorderColor: AppColors.primaryColorDark,
      fillColor: AppColors.primaryColorDark,
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < _isSelected.length; i++) {
            _isSelected[i] = i == index;
          }
        });
      },
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Sim'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Näo'),
        ),
      ],
    );
  }
}
