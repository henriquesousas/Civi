import 'package:deehelp/core/components/icon/ui_icon.dart';
import 'package:deehelp/core/components/profile_image_with_upload_button_widget.dart';
import 'package:deehelp/core/components/ui_my_assets_image_widget.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/core/theme/dimens.dart';
import 'package:deehelp/features/home/widgets/button_info.dart';
import 'package:deehelp/features/home/widgets/button_menu_top.dart';
import 'package:deehelp/features/home/widgets/marker_current_use.dart';
import 'package:deehelp/features/home/widgets/osm_map.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../core/components/ui_my_network_image_widget.dart';
import '../../core/resources/resources.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  // Controllers
  late AnimationController _animationController;
  late AnimationController _mapController;
  final MapController _flutterMapController = MapController();
  final TextEditingController _searchController = TextEditingController();

  final LatLng _centerLocation = const LatLng(-23.550520, -46.633308);
  double _panelHeight = 200;
  bool _isPanelDragging = false;
  double _panelPosition = 0.3; // Posição in

  // Animations
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _mapAnimation;

  // Map data
  LatLng _currentLocation = const LatLng(37.7749, -122.4194);
  LatLng? _destinationLocation = const LatLng(37.8049, -122.4094);
  List<LatLng> _routePoints = [];

  // UI states
  bool _isMapExpanded = false;
  bool _isSearchVisible = false;
  bool _isTrafficVisible = true;
  bool _isSatelliteView = false;
  double _zoomLevel = 14.0;

  // Mock data
  // Mock data
  final List<String> _recentSearches = [
    'Downtown Mall',
    'Central Park',
    'Airport Terminal 1',
    'Business District',
  ];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
    _setupMockRoute();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _mapController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),
    );
  }

  void _startAnimations() {
    _animationController.forward();
  }

  void _setupMockRoute() {
    // Simulate a route from current location to destination
    _routePoints = [
      _currentLocation,
      const LatLng(37.7800, -122.4180),
      const LatLng(37.7850, -122.4160),
      const LatLng(37.7900, -122.4140),
      const LatLng(37.7950, -122.4120),
      _destinationLocation!,
    ];
  }

  @override
  void dispose() {
    _animationController.dispose();
    _mapController.dispose();
    _flutterMapController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          OsmMap(
            controller: _flutterMapController,
            currentLocation: _currentLocation,
            onPositionChanged: (camera, hasGesture) {
              if (hasGesture) {
                setState(() {
                  _zoomLevel = camera.zoom;
                });
              }
            },
            markerCurrentUser: marker(
              context: context,
              point: _currentLocation,
            ),
          ),
          const ButtonMenuTop(),
          const ButtonInfo()
        ],
      ),
    );
  }

  // void _handlePanelDragUpdate(DragUpdateDetails details) {
  //   setState(() {
  //     _isPanelDragging = true;

  //     // Calcular nova posição do panel
  //     final dragAmount = details.delta.dy / MediaQuery.of(context).size.height;
  //     _panelPosition -= dragAmount;

  //     // Limitar entre 0.15 (quase fechado) e 0.8 (quase aberto)
  //     if (_panelPosition < 0.15) _panelPosition = 0.15;
  //     if (_panelPosition > 0.8) _panelPosition = 0.8;
  //   });
  // }

  // void _handlePanelDragEnd(DragEndDetails details) {
  //   setState(() {
  //     _isPanelDragging = false;

  //     // Snap para posições específicas
  //     if (_panelPosition < 0.4) {
  //       // Snap para baixo (fechado)
  //       _panelPosition = 0.15;
  //     } else if (_panelPosition < 0.6) {
  //       // Snap para meio
  //       _panelPosition = 0.5;
  //     } else {
  //       // Snap para cima (aberto)
  //       _panelPosition = 0.8;
  //     }
  //   });
  // }

  // Widget _buildTopButtonMenu() {
  //   return Positioned(
  //     top: MediaQuery.of(context).padding.top + 16,
  //     left: 10,
  //     child: const UIICon(
  //       radius: 10,
  //       bgColor: AppColors.whiteColor,
  //       icon: Icon(
  //         Icons.menu,
  //         size: 32,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildProfile() {
    return Positioned(
      top: MediaQuery.of(context).padding.top,
      right: MediaQuery.of(context).padding.right + 16,
      child: ProfileImageWithUploadButtonWidget(
        radius: 100,
        width: 40,
        height: 40,
        imageUrl: FirebaseAuth.instance.currentUser?.photoURL ?? '',
        imageAlt: "avatar",
      ),
      // child: const UIICon(
      //   radius: 10,
      //   bgColor: AppColors.whiteColor,
      //   icon: Icon(
      //     Icons.menu,
      //     size: 32,
      //   ),
      // ),
    );
  }

  Widget _buildMapSection() {
    return FlutterMap(
      mapController: _flutterMapController,
      options: MapOptions(
        initialCenter: _currentLocation,
        initialZoom: _zoomLevel,
        maxZoom: 18.0,
        minZoom: 10.0,
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all,
        ),
        onPositionChanged: (position, hasGesture) {
          if (hasGesture) {
            setState(() {
              _zoomLevel = position.zoom!;
            });
          }
        },
      ),
      children: [
        TileLayer(
          // urlTemplate: _isSatelliteView
          //     ? 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}'
          //     : 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'br.com.atomos.yousafe',
          maxZoom: 18,
        ),
        MarkerLayer(
          markers: [
            marker(
              context: context,
              point: _currentLocation,
            ),
            ..._buildOccurrences(),
            // ..._buildPOIMarkers(),
          ],
        ),
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () => debugPrint('OpenStreetMap tapped'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTopBar() {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      right: 16,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Menu Button
                    _buildIconButton(
                      icon: Icons.menu,
                      onPressed: () => _toggleMenu(),
                    ),

                    // Search Bar
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _isSearchVisible = true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.grey[600],
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Para onde vamos?',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Notifications
                    _buildIconButton(
                      icon: Icons.notifications_none,
                      badgeCount: 3,
                      onPressed: () => _showNotifications(),
                    ),

                    // Profile
                    _buildProfileButton(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRightSideControls() {
    return Positioned(
      right: 16,
      top: MediaQuery.of(context).padding.top + 88,
      child: Column(
        children: [
          // Map Layers Toggle
          _buildFloatingButton(
            icon: _isSatelliteView ? Icons.map : Icons.satellite,
            label: _isSatelliteView ? 'Mapa' : 'Satélite',
            onPressed: _toggleMapView,
          ),
          const SizedBox(height: 12),

          // Traffic Toggle
          _buildFloatingButton(
            icon: _isTrafficVisible ? Icons.traffic : Icons.traffic_outlined,
            label: 'Trânsito',
            onPressed: _toggleTraffic,
            isActive: _isTrafficVisible,
          ),
          const SizedBox(height: 12),

          // Locate Me
          _buildFloatingButton(
            icon: Icons.my_location,
            label: 'Localizar',
            onPressed: _centerOnCurrentLocation,
          ),
          const SizedBox(height: 12),

          // Zoom In
          _buildFloatingButton(
            icon: Icons.add,
            label: 'Zoom',
            onPressed: _zoomIn,
          ),
          const SizedBox(height: 12),

          // Zoom Out
          _buildFloatingButton(
            icon: Icons.remove,
            label: 'Zoom',
            onPressed: _zoomOut,
          ),
          const SizedBox(height: 12),

          // Report Incident
          _buildFloatingButton(
            icon: Icons.report,
            label: 'Reportar',
            onPressed: _reportIncident,
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 30,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home_filled,
                label: 'Início',
                isActive: true,
                onTap: () {},
              ),
              _buildNavItem(
                icon: Icons.explore,
                label: 'Explorar',
                onTap: () {},
              ),
              _buildNavItem(
                icon: Icons.navigation,
                label: 'Navegar',
                onTap: () => _startNavigation(),
              ),
              _buildNavItem(
                icon: Icons.history,
                label: 'Histórico',
                onTap: () {},
              ),
              _buildNavItem(
                icon: Icons.more_horiz,
                label: 'Mais',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoPanel() {
    return Positioned(
      left: 16,
      top: MediaQuery.of(context).padding.top + 88,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: Container(
              width: 140,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Speed
                  Text(
                    '65',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700],
                    ),
                  ),
                  Text(
                    'km/h',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  const Divider(height: 16),

                  // ETA
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.access_time,
                          size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        '25 min',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Distance
                  Text(
                    '12.5 km',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchOverlay() {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: SafeArea(
          child: Column(
            children: [
              // Search Header
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => setState(() => _isSearchVisible = false),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: 'Buscar destino...',
                          border: InputBorder.none,
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () => _searchController.clear(),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Search Results
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    children: [
                      // Recent Searches
                      if (_recentSearches.isNotEmpty)
                        _buildSearchSection(
                          title: 'Buscas recentes',
                          items: _recentSearches,
                          icon: Icons.history,
                        ),

                      // Favorites
                      _buildSearchSection(
                        title: 'Favoritos',
                        items: ['Casa', 'Trabalho', 'Academia'],
                        icon: Icons.star_border,
                      ),

                      // Popular Places
                      _buildSearchSection(
                        title: 'Locais populares',
                        items: ['Shopping', 'Aeroporto', 'Centro'],
                        icon: Icons.place,
                      ),
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

  Widget _buildSearchSection({
    required String title,
    required List<String> items,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
        ...items.map((item) => ListTile(
              leading: Icon(icon, color: Colors.grey[600]),
              title: Text(item),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
              onTap: () => _selectDestination(item),
            )),
      ],
    );
  }

  // Marker _buildUserMarker({
  //   required LatLng point,
  //   required IconData icon,
  //   required Color color,
  //   required String label,
  // }) {
  //   return Marker(
  //     point: point,
  //     width: 80,
  //     height: 80,
  //     child: Column(
  //       spacing: 2,
  //       children: [
  //         Container(
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(100),
  //           ),
  //           child: Container(
  //             padding: const EdgeInsets.all(2),
  //             decoration: BoxDecoration(
  //               color: AppColors.whiteColor,
  //               borderRadius: BorderRadius.circular(100),
  //             ),
  //             child: UIMyNetworkImageWidget(
  //               width: 50,
  //               height: 50,
  //               radius: 100,
  //               // imageUrl: FirebaseAuth.instance.currentUser?.photoURL ?? '',
  //               imageUrl:
  //                   "https://www.meionews.com/uploads/imagens/2024/11/17/carro-roubado-de-comitiva-do-g20-e-achado-em-favela-no-rio-de-janeiro-922b8399-7578-4726-b6c7-de616d8ebb49.jpg" ??
  //                       '',
  //             ),
  //             // child: const Icon(
  //             //   Icons.person_pin_circle,
  //             //   color: Colors.white,
  //             // ),
  //           ),
  //         ),
  //         Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(8),
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.black.withValues(alpha: 0.1),
  //                 offset: const Offset(0, 2),
  //                 blurRadius: 8,
  //                 spreadRadius: 0,
  //               ),
  //             ],
  //           ),
  //           child: Text(
  //             label,
  //             style: context.appTextStyles.caption1Style.copyWith(
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Marker _buildDestinationMarker() {
    return Marker(
      point: _destinationLocation!,
      width: 70,
      height: 70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: const Icon(Icons.location_on, color: Colors.white, size: 20),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Destino',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Marker> _buildOccurrences() {
    return [
      Marker(
        point: const LatLng(37.7800, -122.4180),
        width: 90,
        height: 90,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: 0.9),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Center(
                child: Icon(Icons.motorcycle, size: 22, color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    offset: const Offset(0, 2),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Text(
                "DND-0171",
                style: context.appTextStyles.caption1Style.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
      // Add more traffic markers as needed
    ];
  }

//  Gasolina
  List<Marker> _buildPOIMarkers() {
    return [
      Marker(
        point: const LatLng(37.7850, -122.4160),
        width: 50,
        height: 50,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withValues(alpha: 0.3),
                blurRadius: 8,
              ),
            ],
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.local_gas_station, color: Colors.white, size: 16),
              SizedBox(height: 2),
              Text(
                'R\$ 5,89',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  Widget _buildIconButton({
    required IconData icon,
    int badgeCount = 0,
    required VoidCallback onPressed,
  }) {
    return Stack(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[100],
          ),
          child: IconButton(
            icon: Icon(icon, size: 20),
            onPressed: onPressed,
            splashRadius: 20,
          ),
        ),
        if (badgeCount > 0)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              child: Text(
                badgeCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildProfileButton() {
    return GestureDetector(
      onTap: () => _showProfile(),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.blue, width: 2),
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/images/profile_placeholder.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    Color color = Colors.blue,
    bool isActive = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: isActive ? color : Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: isActive ? null : Border.all(color: Colors.grey[200]!),
          ),
          child: IconButton(
            icon: Icon(
              icon,
              size: 20,
              color: isActive ? Colors.white : color,
            ),
            onPressed: onPressed,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    bool isActive = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color:
                  isActive ? Colors.blue.withOpacity(0.1) : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isActive ? Colors.blue : Colors.grey[600],
              size: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? Colors.blue : Colors.grey[600],
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  // Action Methods
  void _toggleMenu() {
    HapticFeedback.lightImpact();
    // TODO: Open drawer or side menu
  }

  void _toggleMapView() {
    setState(() {
      _isSatelliteView = !_isSatelliteView;
    });
    HapticFeedback.lightImpact();
  }

  void _toggleTraffic() {
    setState(() {
      _isTrafficVisible = !_isTrafficVisible;
    });
    HapticFeedback.lightImpact();
  }

  void _centerOnCurrentLocation() {
    _flutterMapController.move(_currentLocation, 16.0);
    HapticFeedback.lightImpact();
  }

  void _zoomIn() {
    setState(() {
      _zoomLevel = (_zoomLevel + 1).clamp(10.0, 18.0);
    });
    _flutterMapController.move(_currentLocation, _zoomLevel);
    HapticFeedback.lightImpact();
  }

  void _zoomOut() {
    setState(() {
      _zoomLevel = (_zoomLevel - 1).clamp(10.0, 18.0);
    });
    _flutterMapController.move(_currentLocation, _zoomLevel);
    HapticFeedback.lightImpact();
  }

  void _reportIncident() {
    // TODO: Show incident reporting dialog
    HapticFeedback.lightImpact();
  }

  void _showNotifications() {
    // TODO: Show notifications panel
    HapticFeedback.lightImpact();
  }

  void _showProfile() {
    // TODO: Navigate to profile
    HapticFeedback.lightImpact();
  }

  void _startNavigation() {
    // TODO: Start navigation to destination
    HapticFeedback.lightImpact();
  }

  void _selectDestination(String destination) {
    setState(() {
      _isSearchVisible = false;
      // TODO: Set destination and calculate route
    });
    HapticFeedback.lightImpact();
  }

  // Widget _buildSlidingPanel() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: const BorderRadius.only(
  //         topLeft: Radius.circular(24),
  //         topRight: Radius.circular(24),
  //       ),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.2),
  //           blurRadius: 20,
  //           spreadRadius: 0,
  //           offset: const Offset(0, -5),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       children: [
  //         // Handle do panel
  //         Padding(
  //           padding: const EdgeInsets.only(top: 16),
  //           child: Center(
  //             child: Container(
  //               width: 40,
  //               height: 4,
  //               decoration: BoxDecoration(
  //                 color: Colors.grey[300],
  //                 borderRadius: BorderRadius.circular(2),
  //               ),
  //             ),
  //           ),
  //         ),

  //         // Conteúdo do panel
  //         Expanded(
  //           child: ListView(
  //             padding: const EdgeInsets.all(20),
  //             children: [
  //               const SizedBox(height: 16),

  //               // Título
  //               const Text(
  //                 'Localização',
  //                 style: TextStyle(
  //                   fontSize: 28,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.black87,
  //                 ),
  //               ),

  //               const SizedBox(height: 8),

  //               // Descrição
  //               Text(
  //                 'Área Central de São Paulo',
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   color: Colors.grey[600],
  //                 ),
  //               ),

  //               const SizedBox(height: 32),

  //               // Informações
  //               _buildInfoItem(
  //                 icon: Icons.location_pin,
  //                 title: 'Coordenadas',
  //                 subtitle: '-23.5505° S, -46.6333° W',
  //               ),

  //               _buildInfoItem(
  //                 icon: Icons.zoom_in,
  //                 title: 'Zoom atual',
  //                 subtitle:
  //                     '${_mapController.camera.zoom?.toStringAsFixed(1) ?? '13.0'}x',
  //               ),

  //               _buildInfoItem(
  //                 icon: Icons.map,
  //                 title: 'Tipo de mapa',
  //                 subtitle: 'OpenStreetMap',
  //               ),

  //               const SizedBox(height: 32),

  //               // Ações
  //               _buildActionButton(
  //                 icon: Icons.my_location,
  //                 label: 'Centralizar',
  //                 onPressed: _centerMap,
  //               ),

  //               _buildActionButton(
  //                 icon: Icons.fullscreen,
  //                 label: 'Expandir mapa',
  //                 onPressed: _expandMap,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildInfoItem({
  //   required IconData icon,
  //   required String title,
  //   required String subtitle,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 12),
  //     child: Row(
  //       children: [
  //         Container(
  //           width: 40,
  //           height: 40,
  //           decoration: BoxDecoration(
  //             color: Colors.blue.withOpacity(0.1),
  //             borderRadius: BorderRadius.circular(12),
  //           ),
  //           child: Icon(
  //             icon,
  //             color: Colors.blue,
  //             size: 20,
  //           ),
  //         ),
  //         const SizedBox(width: 16),
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 title,
  //                 style: const TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w500,
  //                   color: Colors.black87,
  //                 ),
  //               ),
  //               const SizedBox(height: 4),
  //               Text(
  //                 subtitle,
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                   color: Colors.grey[600],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildActionButton({
  //   required IconData icon,
  //   required String label,
  //   required VoidCallback onPressed,
  // }) {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 12),
  //     decoration: BoxDecoration(
  //       color: Colors.blue,
  //       borderRadius: BorderRadius.circular(12),
  //     ),
  //     child: Material(
  //       color: Colors.transparent,
  //       child: InkWell(
  //         onTap: onPressed,
  //         borderRadius: BorderRadius.circular(12),
  //         child: Padding(
  //           padding: const EdgeInsets.all(16),
  //           child: Row(
  //             children: [
  //               Icon(
  //                 icon,
  //                 color: Colors.white,
  //                 size: 20,
  //               ),
  //               const SizedBox(width: 16),
  //               Text(
  //                 label,
  //                 style: const TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //               const Spacer(),
  //               const Icon(
  //                 Icons.chevron_right,
  //                 color: Colors.white,
  //                 size: 20,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
