import 'dart:ui' as ui;
import 'package:deehelp/old_features/map/presentation/map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class TestPage1000 extends StatefulWidget {
  const TestPage1000({super.key});

  @override
  State<TestPage1000> createState() => _TestPage1000State();
}

enum ItemType { car, moto, phone }

class Incident {
  final String id;
  final ItemType type;
  final String itemName;
  final String? plate; // vehicle
  final String? photoUrl; // vehicle
  final LatLng position;
  final String occurredAt; // "há 2 dias"
  final String postedAt; // "postado há 3h"
  final String groupKey; // simula "região / cluster"

  const Incident({
    required this.id,
    required this.type,
    required this.itemName,
    this.plate,
    this.photoUrl,
    required this.position,
    required this.occurredAt,
    required this.postedAt,
    required this.groupKey,
  });

  bool get isVehicle => type == ItemType.car || type == ItemType.moto;
}

class _TestPage1000State extends State<TestPage1000>
    with TickerProviderStateMixin {
  // Identity
  static const _bg = Color(0xFFF5F7FD);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _blue = Color(0xFF2157F8);

  final MapController mapController = MapController();

  // Sheet (incidents)
  late final AnimationController sheetCtrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 260),
  );
  late final Animation<Offset> sheetSlide = Tween<Offset>(
    begin: const Offset(0, 1.05),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: sheetCtrl, curve: Curves.easeOutCubic));

  // Panel (filters)
  late final AnimationController filterCtrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 240),
  );
  late final Animation<Offset> filterSlide = Tween<Offset>(
    begin: const Offset(0, 1.05),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: filterCtrl, curve: Curves.easeOutCubic));

  // Fake "user location"
  final LatLng userLocation = const LatLng(-23.55052, -46.633308);

  // Top region label (demo)
  String regionLabel = 'Centro • São Paulo/SP';
  LatLng lastCenter = const LatLng(-23.55052, -46.633308);

  // Filters state
  bool useRadius = true;
  double radiusMeters = 1500;
  final double minRadius = 300;
  final double maxRadius = 5000;

  // Selected group for incidents list
  String? selectedGroupKey;

  // ✅ LINKS estáveis (ou use imagens locais)
  // Se algum falhar, temos fallback via errorBuilder.
  late final List<Incident> incidents = [
    Incident(
      id: 'INC-101',
      type: ItemType.moto,
      itemName: 'CG Titan 160',
      plate: 'ABC1D23',
      photoUrl:
          'https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=1200&q=60',
      position: const LatLng(-23.5512, -46.6342),
      occurredAt: 'há 2 dias',
      postedAt: 'postado há 3h',
      groupKey: 'centro_1',
    ),
    Incident(
      id: 'INC-102',
      type: ItemType.car,
      itemName: 'HB20 1.0',
      plate: 'FRT9K11',
      photoUrl:
          'https://images.unsplash.com/photo-1525609004556-c46c7d6cf023?auto=format&fit=crop&w=1200&q=60',
      position: const LatLng(-23.5510, -46.6336),
      occurredAt: 'ontem',
      postedAt: 'postado há 8h',
      groupKey: 'centro_1',
    ),
    Incident(
      id: 'INC-103',
      type: ItemType.phone,
      itemName: 'iPhone 13',
      position: const LatLng(-23.5498, -46.6325),
      occurredAt: 'há 3 dias',
      postedAt: 'postado há 1 dia',
      groupKey: 'centro_2',
    ),
    Incident(
      id: 'INC-104',
      type: ItemType.phone,
      itemName: 'Samsung S22',
      position: const LatLng(-23.5492, -46.6348),
      occurredAt: 'hoje',
      postedAt: 'postado há 30min',
      groupKey: 'centro_2',
    ),
  ];

  List<Incident> get selectedIncidents {
    if (selectedGroupKey == null) return const [];
    return incidents.where((e) => e.groupKey == selectedGroupKey).toList();
  }

  @override
  void initState() {
    super.initState();
    // Filters start visible
    filterCtrl.value = 1;
  }

  @override
  void dispose() {
    sheetCtrl.dispose();
    filterCtrl.dispose();
    super.dispose();
  }

  void _updateRegionLabelFromCenter(LatLng center) {
    final lat = center.latitude.toStringAsFixed(4);
    final lng = center.longitude.toStringAsFixed(4);
    setState(() => regionLabel = 'Região atual • ($lat, $lng)');
  }

  void _showIncidentSheetForGroup(String groupKey) {
    setState(() => selectedGroupKey = groupKey);

    // hide filters
    if (filterCtrl.value > 0.001) filterCtrl.reverse();

    // show incidents
    sheetCtrl.forward();
  }

  void _showFiltersPanel() {
    // hide incidents
    if (sheetCtrl.value > 0.001) sheetCtrl.reverse();

    // show filters
    if (filterCtrl.value < 0.999) filterCtrl.forward();
  }

  void _onMapPositionChanged(MapCamera pos, bool hasGesture) {
    if (!hasGesture) return;
    final center = pos.center;
    if (center == null) return;

    lastCenter = center;
    _updateRegionLabelFromCenter(center);

    // moving map => hide incidents and show filters
    _showFiltersPanel();
  }

  @override
  Widget build(BuildContext context) {
    final centerForRadius = lastCenter;

    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: _ink),
        title: const Text(
          'Mapa de ocorrências',
          style: TextStyle(color: _ink, fontWeight: FontWeight.w700),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: userLocation,
              initialZoom: 15,
              onPositionChanged: _onMapPositionChanged,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all,
              ),
              onTap: (_, __) => _showFiltersPanel(),
            ),
            children: [
              TileLayer(
                // urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                // urlTemplate:
                //     'https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=kckSM42Sg4cVXpXD2WOu',
                // userAgentPackageName: 'com.kotto.app',
                //MAPBOX
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoicHNvYXJlczI2MDEiLCJhIjoiY21pbnlkanJuMjBlNzNlcHc5NDBoeWJvdCJ9.-9sIXSToKx-OfzGflYEiYw',
                // userAgentPackageName: 'com.kotto.app',
                // urlTemplate:
                //     'https://api.mapbox.com/styles/v1/mapbox/navigation-day-v1/tiles/512/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicHNvYXJlczI2MDEiLCJhIjoiY21pbnlkanJuMjBlNzNlcHc5NDBoeWJvdCJ9.-9sIXSToKx-OfzGflYEiYw',
                userAgentPackageName: 'com.kotto.app',
                tileDimension: 512,
                zoomOffset: -1,
                maxZoom: 20,
                minZoom: 3,
                // retinaMode: true,

                // tileDisplay: TileDisplay.fadeIn(),
                // urlTemplate:
                //     'https://api.mapbox.com/styles/v1/mapbox/streets-v12/tiles/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicHNvYXJlczI2MDEiLCJhIjoiY21pbnlkanJuMjBlNzNlcHc5NDBoeWJvdCJ9.-9sIXSToKx-OfzGflYEiYw',
                // userAgentPackageName: 'com.kotto.app',
                // urlTemplate:
                //     'https://api.mapbox.com/styles/v1/mapbox/streets-v12/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoicHNvYXJlczI2MDEiLCJhIjoiY21pbnlkanJuMjBlNzNlcHc5NDBoeWJvdCJ9.-9sIXSToKx-OfzGflYEiYw',
                // userAgentPackageName: 'com.kotto.app',
                // urlTemplate:

                //     'https://api.mapbox.com/styles/v1/mapbox/navigation-day-v1/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoicHNvYXJlczI2MDEiLCJhIjoiY21pbnlkanJuMjBlNzNlcHc5NDBoeWJvdCJ9.-9sIXSToKx-OfzGflYEiYw',
                // userAgentPackageName: 'com.kotto.app',
                // urlTemplate:
                //     'https://api.mapbox.com/styles/v1/mapbox/streets-v12/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoicHNvYXJlczI2MDEiLCJhIjoiY21pbnlkanJuMjBlNzNlcHc5NDBoeWJvdCJ9.-9sIXSToKx-OfzGflYEiYw',
                // userAgentPackageName: 'com.kotto.app',
                //OSM
                // urlTemplate:
                //     'https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=kckSM42Sg4cVXpXD2WOu',
                // userAgentPackageName: 'com.kotto.app',
                // urlTemplate:
                //     'https://api.maptiler.com/maps/basic/{z}/{x}/{y}.png?key=kckSM42Sg4cVXpXD2WOu',
                // userAgentPackageName: 'com.kotto.app',
                // urlTemplate:
                //     'https://tiles.stadiamaps.com/tiles/alidade_smooth/{z}/{x}/{y}.png?api_key=kckSM42Sg4cVXpXD2WOu',
                // userAgentPackageName: 'com.kotto.app',

                // urlTemplate:
                //     'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png',
                // subdomains: const ['a', 'b', 'c', 'd'],
                // urlTemplate:
                //     'https://tiles.stadiamaps.com/tiles/stamen_toner_lite/{z}/{x}/{y}.png',
                // urlTemplate:
                //     'https://maps.wikimedia.org/osm-intl/{z}/{x}/{y}.png',
                // userAgentPackageName: 'br.com.atomos.deehelp',
              ),

              // ✅ Radius overlay
              if (useRadius)
                CircleLayer(
                  circles: [
                    CircleMarker(
                      point: centerForRadius,
                      radius: radiusMeters,
                      useRadiusInMeter: true,
                      color: _blue.withOpacity(0.10),
                      borderColor: _blue.withOpacity(0.35),
                      borderStrokeWidth: 2,
                    ),
                  ],
                ),

              // ✅ Markers
              MarkerLayer(
                markers: incidents.map((e) {
                  return Marker(
                    point: e.position,
                    width: e.isVehicle ? 92 : 54,
                    height: e.isVehicle ? 72 : 64,
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: () => _showIncidentSheetForGroup(e.groupKey),
                      child: e.isVehicle
                          ? _PlateMarker(plate: e.plate ?? '---')
                          : const _PhoneMarker(),
                    ),
                  );
                }).toList(),
              ),

              // ✅ User marker
              MarkerLayer(
                markers: [
                  Marker(
                    point: userLocation,
                    width: 18,
                    height: 18,
                    child: Container(
                      decoration: BoxDecoration(
                        color: _blue,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.12),
                            blurRadius: 10,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // ✅ Top card: current region + mode
          Positioned(
            top: 12,
            left: 12,
            right: 12,
            child: _RegionTopCard(
              regionLabel: regionLabel,
              modeLabel: useRadius
                  ? 'Raio: ${_formatRadius(radiusMeters)}'
                  : 'Modo: Região visível',
            ),
          ),

          // ✅ Bottom incidents sheet (animated) — ONLY cards
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: sheetSlide,
              child: selectedGroupKey == null
                  ? const SizedBox.shrink()
                  : _IncidentsBottomSheet(incidents: selectedIncidents),
            ),
          ),

          // ✅ Bottom filters panel (animated) — vertical options
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: filterSlide,
              child: _FiltersPanel(
                useRadius: useRadius,
                radiusMeters: radiusMeters,
                minRadius: minRadius,
                maxRadius: maxRadius,
                onToggleMode: (v) => setState(() => useRadius = v),
                onRadiusChanged: (v) => setState(() => radiusMeters = v),
                onApply: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        useRadius
                            ? 'Aplicado: raio ${_formatRadius(radiusMeters)}'
                            : 'Aplicado: região visível no mapa',
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _blue,
        onPressed: () {
          mapController.move(userLocation, 15);
          _showFiltersPanel();
        },
        child: const Icon(Icons.my_location, color: Colors.white),
      ),
    );
  }

  static String _formatRadius(double meters) {
    if (meters < 1000) return '${meters.toInt()} m';
    final km = meters / 1000;
    return '${km.toStringAsFixed(km < 10 ? 1 : 0)} km';
  }
}

/* ---------------- TOP REGION CARD ---------------- */

class _RegionTopCard extends StatelessWidget {
  final String regionLabel;
  final String modeLabel;

  const _RegionTopCard({
    required this.regionLabel,
    required this.modeLabel,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _blue = Color(0xFF2157F8);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.93),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE6EAF6)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _blue.withOpacity(0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.place_outlined, color: _blue, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  regionLabel,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: _ink,
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  modeLabel,
                  style: const TextStyle(
                    color: _muted,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
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

/* ---------------- FILTER PANEL (NO OVERFLOW) ---------------- */

class _FiltersPanel extends StatelessWidget {
  final bool useRadius;
  final double radiusMeters;
  final double minRadius;
  final double maxRadius;
  final ValueChanged<bool> onToggleMode;
  final ValueChanged<double> onRadiusChanged;
  final VoidCallback onApply;

  const _FiltersPanel({
    required this.useRadius,
    required this.radiusMeters,
    required this.minRadius,
    required this.maxRadius,
    required this.onToggleMode,
    required this.onRadiusChanged,
    required this.onApply,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _blue = Color(0xFF2157F8);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    // ✅ altura maior e com scroll interno para nunca estourar
    final height = (h * 0.28).clamp(210.0, 260.0);

    return SafeArea(
      top: false,
      child: Container(
        height: height,
        margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: const Color(0xFFE6EAF6)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x142B5BEE),
              blurRadius: 18,
              offset: Offset(0, 12),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filtros',
                style: TextStyle(
                  color: _ink,
                  fontWeight: FontWeight.w900,
                  fontSize: 14.5,
                ),
              ),
              const SizedBox(height: 10),

              // ✅ content scroll para evitar overflow
              // Expanded(
              //   child: SingleChildScrollView(
              //     physics: const BouncingScrollPhysics(),
              //     child: Column(
              //       children: [
              //         _OptionCard(
              //           selected: useRadius,
              //           icon: Icons.radar_outlined,
              //           title: 'Raio local personalizado',
              //           subtitle:
              //               'Mostre-me apenas roubos dentro de uma distância específica.',
              //           footer: useRadius
              //               ? Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     const SizedBox(height: 10),
              //                     Text(
              //                       'Raio: ${_formatRadius(radiusMeters)}',
              //                       style: const TextStyle(
              //                         color: _ink,
              //                         fontWeight: FontWeight.w900,
              //                         fontSize: 12.5,
              //                       ),
              //                     ),
              //                     SliderTheme(
              //                       data: SliderTheme.of(context).copyWith(
              //                         activeTrackColor: _blue,
              //                         inactiveTrackColor:
              //                             _blue.withOpacity(0.18),
              //                         thumbColor: _blue,
              //                         overlayColor: _blue.withOpacity(0.12),
              //                         trackHeight: 3,
              //                       ),
              //                       child: Slider(
              //                         value: radiusMeters,
              //                         min: minRadius,
              //                         max: maxRadius,
              //                         onChanged: onRadiusChanged,
              //                       ),
              //                     ),
              //                   ],
              //                 )
              //               : null,
              //           onTap: () => onToggleMode(true),
              //         ),
              //         const SizedBox(height: 12),
              //         _OptionCard(
              //           selected: !useRadius,
              //           icon: Icons.map_outlined,
              //           title: 'Filtrar por região',
              //           subtitle:
              //               'Use a área visível no mapa para listar ocorrências.',
              //           footer: !useRadius
              //               ? const Padding(
              //                   padding: EdgeInsets.only(top: 10),
              //                   child: Text(
              //                     'Dica: mova e dê zoom no mapa para ajustar.',
              //                     style: TextStyle(
              //                       color: Color(0xFF8A96C8),
              //                       fontWeight: FontWeight.w700,
              //                       fontSize: 12,
              //                     ),
              //                   ),
              //                 )
              //               : null,
              //           onTap: () => onToggleMode(false),
              //         ),
              //         const SizedBox(height: 12),
              //       ],
              //     ),
              //   ),
              // ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      _FilterChoiceCard(
                        selected: useRadius,
                        icon: Icons.radar_outlined,
                        title: 'Raio local personalizado',
                        subtitle:
                            'Use quando quiser ver roubos apenas dentro de uma distância.',
                        onTap: () => onToggleMode(true),
                        child: useRadius
                            ? _RadiusSlider(
                                value: radiusMeters,
                                min: minRadius,
                                max: maxRadius,
                                onChanged: onRadiusChanged,
                              )
                            : null,
                      ),
                      const SizedBox(height: 12),
                      _FilterChoiceCard(
                        selected: !useRadius,
                        icon: Icons.map_outlined,
                        title: 'Filtrar por região visível',
                        subtitle:
                            'Mostra ocorrências na área atual do mapa (zoom e arraste para ajustar).',
                        onTap: () => onToggleMode(false),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: onApply,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _blue,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Aplicar filtros',
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

  static String _formatRadius(double meters) {
    if (meters < 1000) return '${meters.toInt()} m';
    final km = meters / 1000;
    return '${km.toStringAsFixed(km < 10 ? 1 : 0)} km';
  }
}

class _OptionCard extends StatelessWidget {
  final bool selected;
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? footer;
  final VoidCallback onTap;

  const _OptionCard({
    required this.selected,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.footer,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _blue = Color(0xFF2157F8);

  @override
  Widget build(BuildContext context) {
    // ✅ NÃO usa Expanded aqui (era a causa do overflow)
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: selected ? _blue.withOpacity(0.08) : const Color(0xFFF5F7FD),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: selected ? _blue.withOpacity(0.25) : const Color(0xFFE6EAF6),
            width: 1.2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: selected
                          ? _blue.withOpacity(0.14)
                          : _ink.withOpacity(0.07),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: selected ? _blue : _ink, size: 18),
                  ),
                  const Spacer(),
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selected ? _blue : const Color(0xFFCCD3EA),
                        width: 2,
                      ),
                    ),
                    child: selected
                        ? Center(
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: _blue,
                                shape: BoxShape.circle,
                              ),
                            ),
                          )
                        : null,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  color: _ink,
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(
                  color: _muted,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  height: 1.2,
                ),
              ),
              if (footer != null) ...[
                const SizedBox(height: 10),
                footer!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/* ---------------- INCIDENTS SHEET (only cards) ---------------- */

class _IncidentsBottomSheet extends StatelessWidget {
  final List<Incident> incidents;

  const _IncidentsBottomSheet({required this.incidents});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final height = h * 0.24;

    return SafeArea(
      top: false,
      child: Container(
        height: height,
        margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: const Color(0xFFE6EAF6)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x142B5BEE),
              blurRadius: 18,
              offset: Offset(0, 12),
            ),
          ],
        ),
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
          scrollDirection: Axis.horizontal,
          itemCount: incidents.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (_, i) => _IncidentCard(incident: incidents[i]),
        ),
      ),
    );
  }
}

class _IncidentCard extends StatelessWidget {
  final Incident incident;
  const _IncidentCard({required this.incident});

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _bg = Color(0xFFF5F7FD);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE6EAF6)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: 74,
                height: 74,
                color: _bg,
                child: incident.isVehicle && incident.photoUrl != null
                    ? Image.network(
                        incident.photoUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Center(
                          child: Icon(Icons.directions_car_filled_outlined,
                              color: Color(0xFF2157F8), size: 26),
                        ),
                      )
                    : const Center(
                        child: Icon(Icons.phone_iphone,
                            color: Color(0xFF2157F8), size: 26),
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
                          incident.itemName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: _ink,
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      if (incident.isVehicle && incident.plate != null) ...[
                        const SizedBox(width: 8),
                        _MiniPlatePill(plate: incident.plate!),
                      ],
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Ocorrido: ${incident.occurredAt}',
                    style: const TextStyle(
                      color: _muted,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    incident.postedAt,
                    style: const TextStyle(
                      color: _muted,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.5,
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Abrir detalhes...')),
                        );
                      },
                      icon: const Icon(Icons.chevron_right, size: 18),
                      label: const Text(
                        'Ver detalhes',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF2157F8),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MiniPlatePill extends StatelessWidget {
  final String plate;
  const _MiniPlatePill({required this.plate});

  static const _ink = Color(0xFF1F2A44);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FD),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE6EAF6)),
      ),
      child: Text(
        plate.toUpperCase(),
        style: const TextStyle(
          color: _ink,
          fontWeight: FontWeight.w900,
          fontSize: 11,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

/* ---------------- MARKERS ---------------- */

class _PlateMarker extends StatelessWidget {
  final String plate;
  const _PlateMarker({required this.plate});

  static const _ink = Color(0xFF1F2A44);
  static const _blue = Color(0xFF2157F8);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE6EAF6)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x142B5BEE),
                blurRadius: 14,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Text(
            plate.toUpperCase(),
            style: const TextStyle(
              color: _ink,
              fontWeight: FontWeight.w900,
              fontSize: 12.5,
              letterSpacing: 0.6,
            ),
          ),
        ),
        const SizedBox(height: 6),
        CustomPaint(
          size: const Size(16, 10),
          painter: _TrianglePainter(color: _blue),
        ),
      ],
    );
  }
}

class _PhoneMarker extends StatelessWidget {
  const _PhoneMarker();
  static const _blue = Color(0xFF2157F8);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE6EAF6)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x142B5BEE),
                blurRadius: 14,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(Icons.phone_iphone, color: _blue, size: 22),
        ),
        const SizedBox(height: 6),
        CustomPaint(
          size: const Size(16, 10),
          painter: _TrianglePainter(color: _blue),
        ),
      ],
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;
  const _TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = ui.Path()
      ..moveTo(size.width / 2, size.height)
      ..lineTo(0, 0)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _FilterChoiceCard extends StatelessWidget {
  final bool selected;
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Widget? child;

  const _FilterChoiceCard({
    required this.selected,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.child,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _blue = Color(0xFF2157F8);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
        decoration: BoxDecoration(
          color: selected ? _blue.withOpacity(0.08) : const Color(0xFFF5F7FD),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: selected ? _blue.withOpacity(0.28) : const Color(0xFFE6EAF6),
            width: 1.2,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: selected
                        ? _blue.withOpacity(0.14)
                        : _ink.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(icon, color: selected ? _blue : _ink, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
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
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: _muted,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.2,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                _RadioDot(selected: selected),
              ],
            ),
            if (child != null) ...[
              const SizedBox(height: 12),
              child!,
            ],
          ],
        ),
      ),
    );
  }
}

class _RadioDot extends StatelessWidget {
  final bool selected;
  const _RadioDot({required this.selected});

  static const _blue = Color(0xFF2157F8);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? _blue.withOpacity(0.12) : Colors.transparent,
        border: Border.all(
          color: selected ? _blue : const Color(0xFFCCD3EA),
          width: 2,
        ),
      ),
      child: selected
          ? Center(
              child: Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  color: _blue,
                  shape: BoxShape.circle,
                ),
              ),
            )
          : null,
    );
  }
}

class _RadiusSlider extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  const _RadiusSlider({
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _blue = Color(0xFF2157F8);

  String get _label {
    if (value < 1000) return '${value.toInt()} m';
    final km = value / 1000;
    return '${km.toStringAsFixed(km < 10 ? 1 : 0)} km';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE6EAF6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Raio selecionado',
                style: TextStyle(
                  color: _muted,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              Text(
                _label,
                style: const TextStyle(
                  color: _ink,
                  fontWeight: FontWeight.w900,
                  fontSize: 12.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: _blue,
              inactiveTrackColor: _blue.withOpacity(0.18),
              thumbColor: _blue,
              overlayColor: _blue.withOpacity(0.12),
              trackHeight: 3,
            ),
            child: Slider(
              value: value,
              min: min,
              max: max,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
