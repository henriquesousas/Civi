import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/features/home/occurrence_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../core/theme/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  static const String fakeMoto1 = "assets/images/fakeMoto1.jpg";
  static const String fakeCarro1 = "assets/images/fakeCarro1.jpg";
  static const String fakeCarro2 = "assets/images/fakeCarro2.jpg";
  static const String fakeCarro3 = "assets/images/fakeGolBranco.jpg";
  static const String fakeCarro4 = "assets/images/fakeCarro4.jpg";
  static const String description = "assets/images/description.png";

  late AnimationController _animationController;
  late AnimationController _mapController;
  late AnimationController _cardController;

  // Animations
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _mapAnimation;
  late Animation<double> _cardAnimation;

  // Map related variables
  final MapController _flutterMapController = MapController();
  LatLng _currentLocation = const LatLng(
    37.7749,
    -122.4194,
  ); // Default: San Francisco
  LatLng? _destinationLocation = const LatLng(37.8049, -122.4094);
  bool _isLoadingLocation = true;

  // UI state
  bool _isMapExpanded = false;
  String _selectedVehicleType = 'Standard';

  final String _userName = "Alex";
  final List<String> _recentDestinations = [
    'Downtown Mall',
    'Central Park',
    'Airport Terminal 1',
    'Business District',
    'Downtown Mall',
    'Central Park',
    'Airport Terminal 1',
    'Business District',
    'Downtown Mall',
    'Central Park',
    'Airport Terminal 1',
    'Business District',
  ];

  final List<OccurrenceLocation> _nearbyDrivers = [
    OccurrenceLocation(
      id: 'driver_1',
      position: LatLng(37.7839, -122.4194),
      bearing: 45,
      image: fakeCarro3,
      date: 'Hoje',
      rating: 4.8,
      plateNumber: 'ABC-123',
      icon: Icons.drive_eta,
    ),
    OccurrenceLocation(
      id: 'driver_2',
      position: const LatLng(37.7659, -122.4194),
      bearing: 180,
      image: fakeCarro2,
      date: 'Ontem',
      rating: 4.9,
      plateNumber: 'XYZ-789',
      isVerified: false,
      icon: Icons.drive_eta,
    ),
    OccurrenceLocation(
      id: 'driver_3',
      position: const LatLng(37.7749, -122.4084),
      bearing: 270,
      image: fakeCarro1,
      date: 'Há 3 dias',
      rating: 4.7,
      plateNumber: 'DEF-456',
      icon: Icons.drive_eta,
    ),
    OccurrenceLocation(
      id: 'driver_4',
      position: LatLng(37.7749, -122.4304),
      bearing: 270,
      image: fakeCarro4,
      date: 'Há 1 anos',
      rating: 4.7,
      plateNumber: 'DEF-456',
      isVerified: false,
      icon: Icons.local_shipping,
    ),
    OccurrenceLocation(
      id: 'driver_5',
      position: LatLng(37.7558, -122.4375),
      bearing: 270,
      image: fakeMoto1,
      date: 'Hoje',
      rating: 4.7,
      plateNumber: 'DEF-456',
      icon: Icons.electric_moped,
    ),
    OccurrenceLocation(
      id: 'driver_6',
      position: LatLng(37.7839, -122.4304),
      bearing: 270,
      image: fakeCarro4,
      date: 'Há 6 meses',
      rating: 4.7,
      plateNumber: 'DEF-456',
      icon: Icons.phone_android,
    ),
    OccurrenceLocation(
      id: 'driver_7',
      position: LatLng(37.7581, -122.4399),
      bearing: 270,
      image: fakeMoto1,
      date: 'Ontem',
      rating: 4.7,
      plateNumber: 'DEF-456',
      icon: Icons.local_shipping,
    ),
    OccurrenceLocation(
      id: 'driver_8',
      position: LatLng(37.7839, -122.4084),
      bearing: 270,
      image: fakeMoto1,
      date: 'Há 10 anos',
      rating: 4.7,
      plateNumber: 'DEF-456',
      isVerified: false,
      icon: Icons.directions_bike_outlined,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
    // _loadUserLocation();
  }

  void _initializeAnimations() {
    // Main animation controller for overall screen fade-in
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Map expansion/collapse animation controller
    _mapController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Card entrance animation controller
    _cardController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    // Fade animation for overall screen
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    // Slide animation for content overlay
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOutBack),
      ),
    );

    // Map expansion animation
    _mapAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _mapController, curve: Curves.easeInOut));

    // Card scale animation
    _cardAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _cardController, curve: Curves.easeOutBack),
    );
  }

  void _startAnimations() {
    // Start main animation immediately
    _animationController.forward();

    // Delay card animation for staggered effect
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _cardController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _mapController.dispose();
    _cardController.dispose();
    // _pickupController.dispose();
    // _destinationController.dispose();
    _flutterMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // appBar: PrimaryAppBar(title: "Home"),
      body: Stack(
        children: [
          _buildMapSection(),
          // _buildContentOverlay(),
          _buildMapControls(context),
          _buildCard(),
        ],
      ),
    );
  }

  Widget _buildMapSection() {
    return AnimatedBuilder(
      animation: _mapController,
      builder: (context, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          height: context.screenHeight,
          child: FlutterMap(
            mapController: _flutterMapController,
            options: MapOptions(
              initialCenter: _currentLocation,
              initialZoom: 14.0,
              maxZoom: 18.0,
              minZoom: 10.0,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all,
              ),
              onTap: (tapPosition, point) {
                print(point.latitude);
                print(point.longitude);
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'br.com.atomos.yousafe',
                maxZoom: 18,
              ),
              MarkerLayer(
                markers: [
                  // Current location marker
                  Marker(
                    point: _currentLocation,
                    width: 70,
                    height: 70,
                    child: _buildLocationMarker(
                      color: AppColors.primaryColor,
                      icon: Icons.my_location,
                      label: 'Você',
                    ),
                  ),

                  // Destination marker
                  if (_destinationLocation != null)
                    Marker(
                      point: _destinationLocation!,
                      width: 70,
                      height: 70,
                      child: _buildLocationMarker(
                        color: AppColors.errorColor,
                        icon: Icons.location_on,
                        label: 'Destino',
                      ),
                    ),

                  // Driver markers
                  ..._nearbyDrivers
                      .map(
                        (driver) => Marker(
                          point: driver.position,
                          width: 35,
                          height: 35,
                          child: _buildDriverMarker(driver),
                        ),
                      )
                      .toList(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLocationMarker({
    required Color color,
    required IconData icon,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                offset: const Offset(0, 4),
                blurRadius: 12,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        SizedBox(height: 4),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 2),
                blurRadius: 8,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Text(
            label,
            // style: context.getTextStyle.small.copyWith(
            //   color: AppColorsV2.textPrimary,
            //   fontWeight: FontWeight.w600,
            // ),
          ),
        ),
      ],
    );
  }

  Widget _buildDriverMarker(OccurrenceLocation driver) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.3),
            offset: const Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Icon(
        driver.icon,
        color: Colors.white,
        size: 16,
      ),
    );
  }

  Widget _buildMapControlButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: AppColors.textTertiary,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildMapControls(BuildContext context) {
    return Positioned(
      // top: SizeConfig.safeAreaTop + SizeConfig.getLayoutSpacing(16),
      top: context.topPadding + 16,
      right: 16,
      child: Column(
        children: [
          _buildMapControlButton(
            icon: _isMapExpanded
                ? Icons.fullscreen_exit
                : Icons.filter_list_sharp,
            // onPressed: _toggleMapView,
            onPressed: () {},
          ),
          SizedBox(height: 8),
          _buildMapControlButton(
            icon: Icons.my_location,
            onPressed: _centerOnCurrentLocation,
          ),
          SizedBox(height: 8),
          _buildMapControlButton(
            icon: Icons.layers,
            onPressed: () {
              // TODO: Switch map layers
              HapticFeedback.lightImpact();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContentOverlay() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: DraggableScrollableSheet(
              initialChildSize: _isMapExpanded ? 0.35 : 0.65,
              minChildSize: 0.3,
              maxChildSize: 0.9,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, -4),
                        blurRadius: 20,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Handle
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),

                      // Content
                      // _buildWelcomeSection(),
                      // AQUI LISTA DE TEXT
                      // Expanded(
                      //   child: ListView.builder(
                      //     controller: scrollController,
                      //     padding: const EdgeInsets.only(
                      //       // bottom: 100,
                      //       left: 24,
                      //       right: 24,
                      //     ),
                      //     itemCount: 500,
                      //     itemBuilder: (context, index) {
                      //       return Padding(
                      //         padding: const EdgeInsets.symmetric(vertical: 8),
                      //         child: Text(
                      //           "Texto número ${index + 1}",
                      //           style: const TextStyle(
                      //               fontSize: 16, color: Colors.black87),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      Expanded(
                        child: ListView(
                          controller: scrollController,
                          padding: EdgeInsets.all(24),
                          children: [
                            _buildWelcomeSection(),

                            //COLOCAR LISTVIEW de Text
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: List.generate(
                            //     200,
                            //     (index) => Padding(
                            //       padding:
                            //           const EdgeInsets.symmetric(vertical: 8),
                            //       child: Text(
                            //         "Texto número ${index + 1}",
                            //         style: const TextStyle(
                            //             fontSize: 16, color: Colors.black87),
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            // SizedBox(height: 20),
                            // _buildLocationInputSection(),
                            // SizedBox(height: SizeConfig.getLayoutSpacing(24)),
                            // _buildVehicleTypeSection(),
                            // SizedBox(height: SizeConfig.getLayoutSpacing(24)),
                            // _buildRecentDestinationsSection(),

                            // SizedBox(
                            //   height: SizeConfig.getLayoutSpacing(100),
                            // ), // Bottom padding
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildWelcomeSection() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bom dia Paulo',
                // style: context.getTextStyle.regular.copyWith(
                //   color: AppColorsV2.textPrimary,
                //   fontWeight: FontWeight.bold,
                //   fontSize: context.responsiveText(0.06),
                // ),
              ),
              SizedBox(height: 4),
              Text(
                'Avenida Jão Ventura dos santos 3060, Osasco - SP',
                // style: context.getTextStyle.smallMedium.copyWith(
                //   color: AppColorsV2.textSecondary,
                //   fontWeight: FontWeight.w500,
                // ),
              ),
            ],
          ),
        ),
        SizedBox(width: 30),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            Icons.pin_drop_rounded,
            color: Colors.white,
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildRecentDestinationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.history,
              color: AppColors.textSecondary,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              'Ocorrências nesta região',
              // style: context.getTextStyle.smallMedium.copyWith(
              //   color: AppColorsV2.textPrimary,
              //   fontWeight: FontWeight.w600,
              // ),
            ),
          ],
        ),
        SizedBox(height: 12),
        ...(_recentDestinations.map(
          (destination) => _buildRecentDestinationItem(destination),
        )).toList(),
      ],
    );
  }

  Widget _buildCard() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: context.percentHeight(0.15),
      child: SizedBox(
        // width: context.screenWidth,
        height: context.percentHeight(0.24),
        // child: GridView.builder(
        //   scrollDirection: Axis.horizontal,
        //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 1,
        //     mainAxisSpacing: 10, // espaço entre itens na horizontal
        //     crossAxisSpacing: 10, // espaço entre linhas (se houver)
        //     childAspectRatio: 0.45, // largura/altura de cada item
        //   ),
        //   itemCount: _nearbyDrivers.length,
        //   itemBuilder: (context, index) {
        //     final occurrence = _nearbyDrivers[index];
        //     return Container(
        //       decoration: BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.circular(12),
        //         border: Border.all(color: AppColors.borderDark),
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.black.withOpacity(0.31),
        //             offset: const Offset(0, 3),
        //             blurRadius: 2,
        //             spreadRadius: 0,
        //           ),
        //         ],
        //       ),
        //       padding: const EdgeInsets.all(10),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Row(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               ClipRRect(
        //                 borderRadius: BorderRadius.circular(12),
        //                 child: Image.asset(
        //                   occurrence.image,
        //                   width: 80,
        //                   height: 80,
        //                   fit: BoxFit.cover,
        //                 ),
        //               ),
        //               const SizedBox(width: 8),
        //               Expanded(
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Row(
        //                       children: [
        //                         Text(
        //                           occurrence.date ?? "",
        //                           style: context.getTextStyle.small.copyWith(
        //                             fontWeight: FontWeight.w600,
        //                           ),
        //                         ),
        //                         const SizedBox(width: 4),
        //                         Text(
        //                           "12:45",
        //                           style: context.getTextStyle.small.copyWith(
        //                             color: AppColors.textSecondary,
        //                             fontSize: 11,
        //                           ),
        //                         ),
        //                         const Spacer(),
        //                         // UIVerificationFlag(isVerified: true),
        //                         Container(
        //                           padding: const EdgeInsets.symmetric(
        //                               horizontal: 8, vertical: 4),
        //                           decoration: BoxDecoration(
        //                             color: occurrence.isVerified
        //                                 ? AppColors.success.withOpacity(0.1)
        //                                 : AppColors.error.withOpacity(0.1),
        //                             borderRadius: BorderRadius.circular(8),
        //                           ),
        //                           child: Text(
        //                             occurrence.isVerified
        //                                 ? "Verificado"
        //                                 : "Não verificado",
        //                             style: context.getTextStyle.small.copyWith(
        //                               color: occurrence.isVerified
        //                                   ? AppColors.success
        //                                   : AppColors.error,
        //                               fontWeight: FontWeight.w600,
        //                               fontSize: 9,
        //                             ),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                     const SizedBox(height: 5),
        //                     Text(
        //                       "Avenida rua teste 1500 Osasco - São Paulo",
        //                       style: context.getTextStyle.small.copyWith(
        //                         fontWeight: FontWeight.w400,
        //                         color: AppColors.textSecondary,
        //                         fontSize: 11,
        //                       ),
        //                     ),
        //                     const SizedBox(height: 10),
        //                     Row(
        //                       spacing: 5,
        //                       children: [
        //                         Icon(
        //                           Icons.directions_car,
        //                           color: AppColors.textSecondary,
        //                           size: 16,
        //                         ),
        //                         Text(
        //                           "Gol G3",
        //                           style: context.getTextStyle.small.copyWith(
        //                             fontWeight: FontWeight.normal,
        //                             color: AppColors.textSecondary,
        //                             fontSize: 11,
        //                           ),
        //                         ),
        //                         Text(
        //                           "DND0171",
        //                           style: context.getTextStyle.small.copyWith(
        //                             fontWeight: FontWeight.normal,
        //                             color: AppColors.textSecondary,
        //                             fontSize: 11,
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                     const SizedBox(height: 10),
        //                     Container(
        //                       padding: const EdgeInsets.symmetric(
        //                           horizontal: 8, vertical: 4),
        //                       decoration: BoxDecoration(
        //                         color: occurrence.isVerified
        //                             ? AppColors.success.withOpacity(0.1)
        //                             : AppColors.error.withOpacity(0.1),
        //                         borderRadius: BorderRadius.circular(8),
        //                       ),
        //                       child: Text(
        //                         occurrence.isVerified
        //                             ? "Verificado"
        //                             : "Não verificado",
        //                         style: context.getTextStyle.small.copyWith(
        //                           color: occurrence.isVerified
        //                               ? AppColors.success
        //                               : AppColors.error,
        //                           fontWeight: FontWeight.w600,
        //                           fontSize: 9,
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               )
        //             ],
        //           ),
        //         ],
        //       ),
        //     );
        //   },
        // ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _nearbyDrivers.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final occurrence = _nearbyDrivers[index];
              return GestureDetector(
                onTap: () => context.push(RouterConstant.productDetail),
                child: Container(
                  width: 190,
                  margin: const EdgeInsets.only(right: 12),
                  // decoration: BoxDecoration(
                  //   color: AppColors.secondaryColor,
                  //   borderRadius:
                  //       BorderRadius.circular(SizeConfig.borderRadius14),
                  // ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.textTertiary),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.31),
                        offset: const Offset(0, 1),
                        blurRadius: 1,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(14),
                        ),
                        child: Image.asset(
                          occurrence.image,
                          width: context.screenWidth,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              spacing: 5,
                              children: [
                                Text(
                                  occurrence.date ?? "",
                                  // style: context.getTextStyle.small.copyWith(
                                  //   fontWeight: FontWeight.w600,
                                  // ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "12:45",
                                  // style: context.getTextStyle.small.copyWith(
                                  //     fontWeight: FontWeight.normal,
                                  //     color: AppColorsV2.textSecondary,
                                  //     fontSize: 11),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Rua João do meriti 1245, Osasco- São Paulo",
                              // style: context.getTextStyle.small.copyWith(
                              //   fontSize: 10,
                              //   color: AppColorsV2.textSecondary,
                              // ),
                              // overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              spacing: 5,
                              children: [
                                Icon(
                                  Icons.directions_car,
                                  color: AppColors.textSecondary,
                                  size: 16,
                                ),
                                Text(
                                  "Gol G3",
                                  // style: context.getTextStyle.small.copyWith(
                                  //   fontWeight: FontWeight.normal,
                                  //   color: AppColorsV2.textSecondary,
                                  //   fontSize: 11,
                                  // ),
                                ),
                                Text(
                                  "DND0171",
                                  // style: context.getTextStyle.small.copyWith(
                                  //   fontWeight: FontWeight.normal,
                                  //   color: AppColorsV2.textSecondary,
                                  //   fontSize: 11,
                                  // ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: occurrence.isVerified
                                    ? AppColors.greyColor.withOpacity(0.1)
                                    : Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                occurrence.isVerified
                                    ? "Verificado"
                                    : "Não verificado",
                                // style: context.getTextStyle.small.copyWith(
                                //   color: occurrence.isVerified
                                //       ? AppColorsV2.success
                                //       : Colors.grey,
                                //   fontWeight: FontWeight.w600,
                                //   fontSize: 9,
                                // ),
                              ),
                            ),
                            // const SizedBox(height: 8),
                            // Align(
                            //   alignment: Alignment.centerRight,
                            //   child: Icon(
                            //     Icons.arrow_forward_ios,
                            //     size: 12,
                            //     color: AppColors.textSecondary,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRecentDestinationItem(String destination) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            // _destinationController.text = destination;
            // In a real app, you would geocode this address to get coordinates
            // For demo purposes, we'll set a sample destination location
            _destinationLocation = LatLng(
              _currentLocation.latitude +
                  (0.01 * (1 + _recentDestinations.indexOf(destination))),
              _currentLocation.longitude +
                  (0.01 * (1 + _recentDestinations.indexOf(destination))),
            );
          });
          HapticFeedback.lightImpact();
        },
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.textSecondary),
          ),
          child: Row(
            children: [
              Icon(
                Icons.schedule,
                color: AppColors.textSecondary,
                size: 18,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  destination,
                  // style: context.getTextStyle.smallMedium.copyWith(
                  //   color: AppColorsV2.textPrimary,
                  // ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: AppColors.textSecondary,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _centerOnCurrentLocation() {
    HapticFeedback.lightImpact();
    _flutterMapController.move(_currentLocation, 16.0);
  }
}
