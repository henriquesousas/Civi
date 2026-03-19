import 'dart:async';
import 'dart:ui' as ui;

import 'package:deehelp/core/extension/date_extension.dart';
import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/providers/supabase_provider.dart';
import 'package:deehelp/core/services/network/network_info_provider.dart';
import 'package:deehelp/core/services/network/netwotk_alert_controller.dart';
import 'package:deehelp/core/services/permissions/location/export_location.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/utils/enum_utils.dart';
import 'package:deehelp/core/utils/url_launcher_utils.dart';
import 'package:deehelp/feature/home/home_viewmodel_provider.dart';
import 'package:deehelp/feature/home/v2/widgets/waze_alert.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/feature/mapa/widgets/horizontal_incident_card.dart';
import 'package:deehelp/feature/mapa/widgets/map_bottom_sheet.dart';
import 'package:deehelp/feature/mapa/widgets/map_floating_toolbar.dart';
import 'package:deehelp/feature/search/search_page_v2.dart';
import 'package:deehelp/feature/search/search_router.dart';
import 'package:deehelp/module/auth/external/di/authenticated_user_provider.dart';
import 'package:deehelp/module/incident/domain/enum/incident_status.dart';
import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' hide Visibility;
import 'package:permission_handler/permission_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// class FakeIncident {
//   final Point point;
//   final IconData image;
//   final String imageAssets;
//   final Color pinBorder;

//   FakeIncident(
//       {required this.point,
//       required this.image,
//       required this.pinBorder,
//       required this.imageAssets});

//   static List<FakeIncident> generateFakeIncidents() {
//     final random = Random();

//     const double minLat = -23.70;
//     const double maxLat = -23.45;

//     const double minLng = -46.80;
//     const double maxLng = -46.40;

//     final icons = [
//       Icons.directions_car_filled_rounded,
//       Icons.smartphone_rounded,
//       Icons.two_wheeler_rounded,
//     ];

//     final imageAssets = [
//       "assets/images/motorcycle_pin_v9.png",
//       "assets/images/car_rouberry_v4.png",
//       "assets/images/phone_pin_v2.png",
//     ];

//     return List.generate(100, (index) {
//       final lat = minLat + random.nextDouble() * (maxLat - minLat);
//       final lng = minLng + random.nextDouble() * (maxLng - minLng);

//       return FakeIncident(
//         point: Point(
//           coordinates: Position(lng, lat),
//         ),
//         image: icons[random.nextInt(icons.length)],
//         imageAssets: imageAssets[random.nextInt(imageAssets.length)],
//         pinBorder: AppColors.primaryColor,
//       );
//     });
//   }

// static List<FakeIncident> itemss() {
//   return [
//     FakeIncident(
//       point: Point(coordinates: Position(-46.7905, -23.5338)),
//       image: Icons.directions_car_filled_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.7889, -23.5315)),
//       image: Icons.smartphone_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.7952, -23.5347)),
//       image: Icons.two_wheeler_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.7978, -23.5299)),
//       image: Icons.flood_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.7854, -23.5361)),
//       image: Icons.visibility_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.7822, -23.5304)),
//       image: Icons.flood_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.8001, -23.5321)),
//       image: Icons.directions_car_filled_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.8035, -23.5374)),
//       image: Icons.directions_car_filled_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.8035, -23.5374)),
//       image: Icons.motorcycle,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.7768, -23.5289)),
//       image: Icons.directions_car_filled_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.7741, -23.5340)),
//       image: Icons.motorcycle_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.7867, -23.5257)),
//       image: Icons.motorcycle_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.7928, -23.5402)),
//       image: Icons.directions_car_filled_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.8057, -23.5295)),
//       image: Icons.motorcycle_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.8092, -23.5333)),
//       image: Icons.phone_android_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.7819, -23.5411)),
//       image: Icons.directions_car_filled_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.7727, -23.5378)),
//       image: Icons.directions_car_filled_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.7994, -23.5252)),
//       image: Icons.directions_car_filled_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.8070, -23.5415)),
//       image: Icons.directions_car_filled_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.7840, -23.5440)),
//       image: Icons.directions_car_filled_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//     FakeIncident(
//       point: Point(coordinates: Position(-46.7708, -23.5309)),
//       image: Icons.directions_car_filled_rounded,
//       pinBorder: AppColors.primaryColor,
//     ),
//   ];
// }
// }

enum GPSHeight {
  normal,
  min,
  hight,
}

class MapaPage extends ConsumerStatefulWidget {
  const MapaPage({super.key});

  @override
  ConsumerState<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends ConsumerState<MapaPage> {
  // final _initialZoom = 13.8;
  final _initialZoom = 16.0;
  bool _showIncidentCards = false;
  bool _isCardOpened = false;
  GPSHeight _gpsHeight = GPSHeight.normal;
  ScrollController controller = ScrollController();
  RealtimeChannel? reportsChannel;
  CurrentLocation? currenLocation;
  CameraState? _previousCameraState;
  final List<PointAnnotation> _markers = [];
  PointAnnotation? _activeMarker;
  PointAnnotationManager? _pointManager;
  final PageController _incidentPageController =
      PageController(viewportFraction: 0.88);
  MapboxMap? _mapboxMap;
  final Point _myLocation = Point(
    coordinates: Position(-46.7917, -23.5329),
  );
  // late final NetworkInfo _networkInfo;
  // // final ConnectionBannerController _bannerController =
  // //     ConnectionBannerController();
  // StreamSubscription<bool>? _connectionSubscription;
  // bool _isOffline = false;

  late final NetworkListener _networkListener;
  NetworkReconnectListener? _networkReconnectListener;

  double get _getGpsHeight {
    switch (_gpsHeight) {
      case GPSHeight.normal:
        return 100.h;
      case GPSHeight.min:
        return 280.h;
      default:
        return 240.h;
    }
  }

  void startListeningReports() {
    final supabase = ref.read(supabaseClientProvider);
    reportsChannel = supabase
        .channel('public:reports')
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'report',
          callback: (payload) {
            // nao mostrar se é o meu id
            //so mostrar se estiver "status" -> "active"

            final authenticatedUser = ref.read(authenticatedUserProvider);
            final myLocation = ref.read(currentLocationProvider);

            if (authenticatedUser == null) return;
            if (myLocation == null) return;

            final data = payload.newRecord;

            final status =
                EnumUtils.fromString(IncidentStatus.values, data['status']);
            final userId = data['user_id'];

            if (status != IncidentStatus.active) {
              return;
            }

            if (userId == authenticatedUser.id) {
              return;
            }

            final time = DateTime.parse(data['occurred_at']).timeAgo();
            final label = EnumUtils.fromString(ItemType.values, data['kind'])
                .labelRouberry;
            final city = data['city'];
            final lat = (data['lat'] as num?)?.toDouble();
            final long = (data['long'] as num?)?.toDouble();
            String? distance;

            if (lat != null || long != null) {
              distance = DistanceUtils.formatDistance(
                startLatitude: myLocation.latitude,
                startLongitude: myLocation.longitude,
                endLatitude: lat!,
                endLongitude: long!,
              );
            }

            WazeAlertController.instance.show(
              WazeAlertState(
                title: '$label agora',
                // subtitle: '$time • $city • 1,8 km de você'),
                subtitle: distance != null
                    ? '$time • $city • $distance  de você'
                    : '$time • $city',
              ),
            );

            // Aqui você pode:
            // - atualizar lista
            // - mostrar marcador no mapa
            // - disparar alerta local
            // - chamar setState / notifier / provider
          },
        )
        .subscribe();
  }

  void stopListeningReports() {
    final supabase = ref.read(supabaseClientProvider);
    if (reportsChannel != null) {
      supabase.removeChannel(reportsChannel!);
      reportsChannel = null;
    }
  }

  @override
  void initState() {
    //Ouve quando interne muda
    final networkInfo = ref.read(networkInfoProvider);
    _networkListener = NetworkListener(networkInfo);
    _networkListener.start();

    //Ouve quando internet volta
    _networkReconnectListener = NetworkReconnectListener(networkInfo);
    _networkReconnectListener?.start(
      onReconnect: () async {
        _loadData();
      },
      onDisconnect: () async {},
    );
    _loadData();
    super.initState();
    startListeningReports();
  }

  void _loadData() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final currenLocation = ref.watch(currentLocationProvider);
        //  final region = '${currenLocation?.city} • ${currenLocation?.state}';
        ref
            .read(homeViewmodelProvider.notifier)
            .getRecentIncidents(currenLocation);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewmodelProvider);
    final state = ref.watch(authenticatedUserProvider);
    currenLocation = ref.watch(currentLocationProvider);
    // final fakeIncidents = FakeIncident.generateFakeIncidents();

    if (currenLocation != null) {
      // _myLocation.coordinates =
      //     Position(currenLocation.latitude, currenLocation.longitude);

      _goToMyLocation(currenLocation);
    }

    ref.listen(
      homeViewmodelProvider,
      (previous, state) {
        if (state.hasValue) {
          _createMarker(state.value!);
        }
      },
    );

    return Scaffold(
      body: Stack(
        children: [
          //Mapa
          MapWidget(
            key: const ValueKey('mapWidget'),
            styleUri: MapboxStyles.DARK,
            cameraOptions: CameraOptions(
              center: _myLocation,
              zoom: _initialZoom,
              pitch: 65,
              bearing: -30,
            ),

            textureView: true,
            onMapCreated: (mapboxMap) => _onMapCreated(mapboxMap, []),
            // onMapCreated: _onMapCreated(),
          ),

          //Radar loading
          Visibility(
            visible: homeState.isLoading,
            child: Positioned(
              top: 0,
              left: context.percentWidth(0.3),
              right: context.percentWidth(0.3),
              bottom: 0,
              // child: RadarPulse(),
              child: IgnorePointer(
                child: Lottie.asset(
                  "assets/lottie/radar.json",
                  width: context.percentWidth(0.3),
                  height: context.percentWidth(0.3),
                ),
              ),
            ),
          ),

          MapTopToolbar(
            avatarUrl: state?.photoUrl,
            // onProfileTap: () {},
            onSearchTap: () => context.push(SearchRouter.search),
            onSettingsTap: () {},
          ),
          //GPS
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            right: 10,
            // bottom: _showIncidentCards ? 240.h : 100.h,
            bottom: _getGpsHeight,
            child: Column(
              spacing: 10,
              children: [
                // MapSideActionButton(
                //   assetPath: "assets/images/settingsv2.png",
                //   // icon: Icons.settings_outlined,
                //   onTap: () {},
                // ),
                FloatingActionButton(
                  mini: false,
                  // backgroundColor: context.primaryColor,
                  backgroundColor:
                      context.secondaryColor.withValues(alpha: 0.1),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                  onPressed: () => _goToMyLocation(currenLocation),
                  // onPressed: () {
                  //   debugPrint('Lat ${currenLocation!.latitude}');
                  //   debugPrint('Long ${currenLocation!.longitude}');

                  //   final dis = DistanceUtils.formatDistance(
                  //     startLatitude: -23.4928262,
                  //     startLongitude: -46.8055845,

                  //     // startLatitude: -23.492540969444104,
                  //     // startLongitude: -46.80559304905333,
                  //     endLatitude: -23.4927413,
                  //     endLongitude: -46.8055424,
                  //   );

                  //   debugPrint(dis);
                  // },
                  child: const Icon(
                    Icons.navigation,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          //Close incidents
          _clseButton(),
          //Grid incidentes
          homeState.maybeMap(
            data: (data) {
              if (data.value.isEmpty) {
                // return const Expanded(child: EmptyIncidentsState());
                return SizedBox.shrink();
              }

              return AnimatedPositioned(
                duration: const Duration(milliseconds: 350),
                left: 16,
                right: 16,
                bottom: _showIncidentCards ? 1 : -300,
                child: _horizontalIncidentCard(data.value),
              );
            },
            loading: (loading) {
              return const SizedBox.shrink();
            },
            orElse: () {
              return const SizedBox.shrink();
            },
          ),
          // AnimatedPositioned(
          //   duration: const Duration(milliseconds: 350),
          //   left: 16,
          //   right: 16,
          //   bottom: _showIncidentCards ? 1 : -300,
          //   child: _horizontalIncidentCard(fakeIncidents),
          // ),
          // Location
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            // bottom: context.bottomPadding + 5,
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 300),
              offset: _showIncidentCards ? const Offset(0, 1) : Offset.zero,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: _showIncidentCards ? 0 : 1,
                child: Positioned(
                  child: MapLayersBottomSheet2(
                    city: currenLocation?.city ?? "Buscando ocorrências...",
                    address: currenLocation == null
                        ? "Aguarde..."
                        : '${currenLocation?.address}',
                    initiallyExpanded: _showIncidentCards,
                    onTapHeader: (opened) {
                      _isCardOpened = opened;
                      if (opened) {
                        setState(() {
                          _gpsHeight = GPSHeight.min;
                        });
                      } else {
                        setState(() {
                          _gpsHeight = GPSHeight.normal;
                        });
                      }
                    },
                  ),
                  // child: ExpandableIncidentCard(
                  //   startOpened: _showIncidentCards,
                  //   title: 'Osasco - SP',
                  //   subtitle:
                  //       'Trabessa Francisco Alves da Silva,2, Baronesa, Osasco',
                  //   onViewIncidents: () {
                  //     debugPrint('Ver incidentes');
                  //   },
                  //   onRegisterIncident: () {
                  //     debugPrint('Registrar incidente');
                  //     showModalBottomSheet(
                  //       context: context,
                  //       backgroundColor: Colors.transparent,
                  //       barrierColor: Colors.black54,
                  //       isScrollControlled: true,
                  //       builder: (_) => const MapLayersBottomSheet(),
                  //     );
                  //   },
                  //   onExpand: (opened) {
                  //     _isCardOpened = opened;
                  //     if (opened) {
                  //       setState(() {
                  //         _gpsHeight = GPSHeight.min;
                  //       });
                  //     } else {
                  //       setState(() {
                  //         _gpsHeight = GPSHeight.normal;
                  //       });
                  //     }
                  //   },
                  // ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _clseButton() {
    return Positioned(
      // bottom: _showIncidentCards ? 220.h : 100.h,
      bottom: _getGpsHeight,
      left: 30,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: _showIncidentCards ? 1 : 0,
        // opacity: 1,
        child: IgnorePointer(
          ignoring: !_showIncidentCards,
          child: Container(
            decoration: BoxDecoration(
              // color: Colors.white,
              color: context.secondaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                )
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () async {
                setState(() {
                  _showIncidentCards = false;
                  if (!_isCardOpened) {
                    _gpsHeight = GPSHeight.normal;
                  } else {
                    _gpsHeight = GPSHeight.min;
                  }
                });

                if (_previousCameraState != null) {
                  if (_activeMarker != null) {
                    _activeMarker!.iconSize = 1.2;
                    await _pointManager?.update(_activeMarker!);
                  }
                  await _mapboxMap?.flyTo(
                    CameraOptions(
                      center: _previousCameraState!.center,
                      zoom: _previousCameraState!.zoom,
                      bearing: _previousCameraState!.bearing,
                      pitch: _previousCameraState!.pitch,
                    ),
                    MapAnimationOptions(duration: 900),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _horizontalIncidentCard(List<IncidentOutput> incidents) {
    final screenHeight = MediaQuery.of(context).size.height;
    final height = (screenHeight * 0.27).clamp(220.0, 270.0);

    // final height = context.percentHeight(0.15).clamp(205.0, 245.0);
    return SizedBox(
      height: height,
      child: PageView.builder(
        clipBehavior: Clip.none,
        controller: _incidentPageController,
        itemCount: incidents.length,
        onPageChanged: (index) {
          _onIncidentCardChanged(index);
        },
        itemBuilder: (context, index) {
          final incident = incidents[index];

          return HorizontalIncidentCard(
            incidentType: 'Roubo',
            title: incident.product.name,

            // locationLabel: 'Centro, Osasco',
            // timeLabel: 'hoje, 18:30',
            // distanceLabel: '1,2 km de você',
            howTo: incident.howTo,
            locationLabel: _getLocale(incident),
            timeLabel: incident.occurredAt.timeAgo(),
            distanceLabel: _getDistance(incident),
            isPlatformGenerated: incident.isPlatformGenerated,
            coverImageUrl: incident.product.images.isNotEmpty
                ? incident.product.images.first.value
                : null,
            onTap: () {},
            onShareTap: () => UrlLauncherUtils.shareIncident(
                context, incident.alertId, incident.occurredAt),
            onBookmarkTap: () {},
          );
        },
      ),
    );
  }

  String _getLocale(IncidentOutput incident) {
    if (incident.local == null) return "Não informado";
    return '${incident.local!.city}, ${incident.local!.state}';
  }

  String _getDistance(IncidentOutput incident) {
    if (currenLocation == null) return '';
    if (incident.local == null) return '';

    return DistanceUtils.formatDistance(
      startLatitude: currenLocation!.latitude,
      startLongitude: currenLocation!.longitude,
      endLatitude: incident.local!.latitue!,
      endLongitude: incident.local!.longitude!,
    );
  }

  Future<void> _onMapCreated(
    MapboxMap mapboxMap,
    List<IncidentOutput> incidents,
  ) async {
    _mapboxMap = mapboxMap;

    final status = await Permission.locationWhenInUse.request();

    if (status.isGranted) {
      await _mapboxMap!.location.updateSettings(
        LocationComponentSettings(
          enabled: true,
          pulsingEnabled: true,
          showAccuracyRing: true,
          puckBearingEnabled: true,
          puckBearing: PuckBearing.HEADING,
        ),
      );
    }

    await _mapboxMap?.gestures.updateSettings(
      GesturesSettings(
        pitchEnabled: true,
      ),
    );

    await _mapboxMap?.location.updateSettings(
      LocationComponentSettings(
        enabled: true,
        pulsingEnabled: true,
      ),
    );

    //botao de rotacao
    if (mounted) {
      await _mapboxMap!.compass.updateSettings(
        CompassSettings(
          enabled: true,
          marginTop: context.topPadding * 3,
          marginRight: 16,
        ),
      );
    }

    await _mapboxMap!.style.setStyleImportConfigProperty(
      'basemap',
      'lightPreset',
      'day',
    );

    // opcionais, para deixar o mapa mais limpo
    await _mapboxMap!.style.setStyleImportConfigProperty(
      'basemap',
      'showPointOfInterestLabels',
      false,
    );

    await _mapboxMap!.style.setStyleImportConfigProperty(
      'basemap',
      'showTransitLabels',
      true,
    );

    await _mapboxMap!.style.setStyleImportConfigProperty(
      'basemap',
      'showPedestrianRoads',
      true,
    );

    _pointManager =
        await _mapboxMap!.annotations.createPointAnnotationManager();

    _showScallableZoom(false);
    _onMarkeClick(incidents);

    // final incidents = FakeIncident.items();
    // _markers.clear();
    // for (final incident in incidents) {
    //   // final pinImage = await createPinWithText(
    //   //   icon: incident.image,
    //   //   label: 'DND0171',
    //   //   isSelected: false,
    //   // );
    //   // final pinImage = await createPinWithIconV4(
    //   //   icon: incident.image,
    //   //   badgeText: 'DND0171',
    //   //   isSelected: false,
    //   // );

    //   //car_rouberry_v4

    //   // final pinImage = await createPinWithAsset(incident.imageAssets);

    //   if (incident.local?.longitude != null &&
    //       incident.local?.latitue != null) {
    //     final pinImage =
    //         await createPinWithAsset("assets/images/motorcycle_pin_v9.png");

    //     final marker = await _pointManager!.create(
    //       PointAnnotationOptions(
    //         geometry: Point(
    //           coordinates: Position(
    //             incident.local!.longitude!,
    //             incident.local!.latitue!,
    //           ),
    //         ),
    //         image: pinImage,
    //         iconSize: 1.2,
    //         iconAnchor: IconAnchor.BOTTOM,
    //       ),
    //     );
    //     _markers.add(marker);
    //   }
    // }
  }

  Future<void> _createMarker(List<IncidentOutput> incidents) async {
    _markers.clear();
    for (final incident in incidents) {
      if (incident.local?.longitude != null &&
          incident.local?.latitue != null) {
        final pinImage = await createPinWithAsset(
          EnumUtils.fromString(ItemType.values, incident.product.type).assets,
        );

        final marker = await _pointManager!.create(
          PointAnnotationOptions(
            geometry: Point(
              coordinates: Position(
                incident.local!.longitude!,
                incident.local!.latitue!,
              ),
            ),
            image: pinImage,
            iconSize: 1.2,
            iconAnchor: IconAnchor.BOTTOM,
          ),
        );
        _markers.add(marker);
      }
    }
  }

  Future<void> _showScallableZoom(bool v) async {
    _mapboxMap?.scaleBar.updateSettings(
      ScaleBarSettings(
        enabled: v,
      ),
    );
  }

  Future<Uint8List> createPinWithText({
    required String label,
    required IconData icon,
    bool isSelected = false,
  }) async {
    final double height = context.percentHeight(0.055);
    // final double height = 35.h;
    const double pointerHeight = 10;

    const double borderRadius = 24;
    const double borderWidth = 1.4;

    final double iconCircleSize = context.percentHeight(0.045);
    // final double iconCircleSize = 28.w;
    final double iconSize = 21.w;
    const double iconLeft = 8;

    final double textLeft = 50.w;
    const double textRightPadding = 16;

    /// mede texto
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: label,
        style: context.appText.caption.copyWith(
          color: context.onSurface,
        ),
      ),
    )..layout();

    /// largura dinâmica
    double width;

    if (isSelected) {
      width = textLeft + textPainter.width + textRightPadding;
    } else {
      width = iconCircleSize + 16;
    }

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final double centerX = width / 2;

    final path = Path()
      ..moveTo(borderRadius, 0)

      /// topo
      ..lineTo(width - borderRadius, 0)
      ..quadraticBezierTo(width, 0, width, borderRadius)

      /// lado direito
      ..lineTo(width, height - borderRadius)
      ..quadraticBezierTo(width, height, width - borderRadius, height)

      /// seta
      ..lineTo(centerX + 14, height)
      ..cubicTo(
        centerX + 6,
        height,
        centerX + 4,
        height + 6,
        centerX + 2,
        height + pointerHeight - 1,
      )
      ..quadraticBezierTo(
        centerX,
        height + pointerHeight + 1.5,
        centerX - 2,
        height + pointerHeight - 1,
      )
      ..cubicTo(
        centerX - 4,
        height + 6,
        centerX - 6,
        height,
        centerX - 12,
        height,
      )

      /// lado esquerdo
      ..lineTo(borderRadius, height)
      ..quadraticBezierTo(0, height, 0, height - borderRadius)
      ..lineTo(0, borderRadius)
      ..quadraticBezierTo(0, 0, borderRadius, 0)
      ..close();

    /// shadow
    canvas.save();
    canvas.translate(0, 2);
    canvas.drawPath(
      path,
      Paint()
        ..color = const Color(0x22000000)
        ..maskFilter = const ui.MaskFilter.blur(ui.BlurStyle.normal, 6),
    );
    canvas.restore();

    /// fundo
    canvas.drawPath(path, Paint()..color = Colors.white);

    /// borda
    canvas.drawPath(
      path,
      Paint()
        ..color = AppColors.grey.withValues(alpha: 0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth
        ..isAntiAlias = true,
    );

    /// círculo do ícone
    final double iconTop = (height - iconCircleSize) / 2;

    canvas.drawCircle(
      Offset(
        iconLeft + iconCircleSize / 2,
        iconTop + iconCircleSize / 2,
      ),
      iconCircleSize / 2,
      Paint()..color = const Color(0xFFE53935),
    );

    /// ícone
    final iconPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: iconSize,
          fontFamily: icon.fontFamily,
          package: icon.fontPackage,
          color: Colors.white,
        ),
      ),
    )..layout();

    iconPainter.paint(
      canvas,
      Offset(
        iconLeft + (iconCircleSize - iconPainter.width) / 2,
        iconTop + (iconCircleSize - iconPainter.height) / 2,
      ),
    );

    /// label
    if (isSelected) {
      textPainter.paint(
        canvas,
        Offset(
          textLeft,
          (height - textPainter.height) / 2,
        ),
      );
    }

    final picture = recorder.endRecording();
    final image = await picture.toImage(
      width.toInt(),
      (height + pointerHeight + 6).toInt(),
    );

    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    return bytes!.buffer.asUint8List();
  }

  Future<Uint8List> createPinWithIconV4({
    required IconData icon,
    required String badgeText,
    bool isSelected = false,
  }) async {
    final double height = context.percentHeight(0.055);
    const double pointerHeight = 10;

    const double borderRadius = 22;
    const double borderWidth = 1.4;

    final double iconCircleSize = context.percentHeight(0.045);
    final double iconSize = 21.w;

    const double horizontalPadding = 8;
    final double width = iconCircleSize + (horizontalPadding * 2);

    /// badge
    final badgePainter = TextPainter(
      textDirection: TextDirection.ltr,
      maxLines: 1,
      text: TextSpan(
        text: badgeText.toUpperCase(),
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFFE53935),
          // color: Colors.black,
          letterSpacing: 0.3,
        ),
      ),
    )..layout();

    const double badgeHorizontalPadding = 10;
    const double badgeHeight = 20;
    final double badgeWidth = badgePainter.width + (badgeHorizontalPadding * 2);

    const double badgeTopSpacing = 2;
    const double gapBetweenBadgeAndCard = 6;

    final double totalHeight = badgeTopSpacing +
        badgeHeight +
        gapBetweenBadgeAndCard +
        height +
        pointerHeight +
        6;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final double cardTop =
        badgeTopSpacing + badgeHeight + gapBetweenBadgeAndCard;
    final double centerX = width / 2;

    /// path do card branco com seta
    final path = Path()
      ..moveTo(borderRadius, cardTop)

      /// topo
      ..lineTo(width - borderRadius, cardTop)
      ..quadraticBezierTo(width, cardTop, width, cardTop + borderRadius)

      /// lado direito
      ..lineTo(width, cardTop + height - borderRadius)
      ..quadraticBezierTo(
        width,
        cardTop + height,
        width - borderRadius,
        cardTop + height,
      )

      /// seta inferior
      ..lineTo(centerX + 14, cardTop + height)
      ..cubicTo(
        centerX + 6,
        cardTop + height,
        centerX + 4,
        cardTop + height + 6,
        centerX + 2,
        cardTop + height + pointerHeight - 1,
      )
      ..quadraticBezierTo(
        centerX,
        cardTop + height + pointerHeight + 1.5,
        centerX - 2,
        cardTop + height + pointerHeight - 1,
      )
      ..cubicTo(
        centerX - 4,
        cardTop + height + 6,
        centerX - 6,
        cardTop + height,
        centerX - 12,
        cardTop + height,
      )

      /// lado esquerdo
      ..lineTo(borderRadius, cardTop + height)
      ..quadraticBezierTo(
          0, cardTop + height, 0, cardTop + height - borderRadius)
      ..lineTo(0, cardTop + borderRadius)
      ..quadraticBezierTo(0, cardTop, borderRadius, cardTop)
      ..close();

    /// sombra do card
    canvas.save();
    canvas.translate(0, 2);
    canvas.drawPath(
      path,
      Paint()
        ..color = const Color(0x22000000)
        ..maskFilter = const ui.MaskFilter.blur(ui.BlurStyle.normal, 6),
    );
    canvas.restore();

    /// fundo do card
    canvas.drawPath(path, Paint()..color = Colors.white);

    /// borda do card
    canvas.drawPath(
      path,
      Paint()
        ..color = AppColors.grey.withValues(alpha: 0.28)
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth
        ..isAntiAlias = true,
    );

    /// badge flutuante acima
    final double badgeLeft = (width - badgeWidth) / 2;
    final Rect badgeRect = Rect.fromLTWH(
      badgeLeft,
      badgeTopSpacing,
      badgeWidth,
      badgeHeight,
    );

    final badgeRRect = RRect.fromRectAndRadius(
      badgeRect,
      const Radius.circular(999),
    );

    /// sombra badge
    canvas.save();
    canvas.translate(0, 1.5);
    canvas.drawRRect(
      badgeRRect,
      Paint()
        ..color = const Color(0x16000000)
        ..maskFilter = const ui.MaskFilter.blur(ui.BlurStyle.normal, 4),
    );
    canvas.restore();

    /// fundo badge
    canvas.drawRRect(
      badgeRRect,
      Paint()..color = const Color(0xFFFFEBEE),
      // Paint()..color = Colors.black87,
    );

    /// borda badge
    canvas.drawRRect(
      badgeRRect,
      Paint()
        // ..color = const Color(0xFFE53935).withValues(alpha: 0.22)
        ..color = Colors.black.withValues(alpha: 0.22)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );

    badgePainter.paint(
      canvas,
      Offset(
        badgeLeft + badgeHorizontalPadding,
        badgeTopSpacing + (badgeHeight - badgePainter.height) / 2,
      ),
    );

    /// círculo do ícone dentro do card
    final double iconTop = cardTop + (height - iconCircleSize) / 2;
    final double iconLeft = (width - iconCircleSize) / 2;

    canvas.drawCircle(
      Offset(
        iconLeft + iconCircleSize / 2,
        iconTop + iconCircleSize / 2,
      ),
      iconCircleSize / 2,
      Paint()..color = const Color(0xFFE53935),
    );

    /// ícone
    final iconPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: iconSize,
          fontFamily: icon.fontFamily,
          package: icon.fontPackage,
          color: Colors.white,
        ),
      ),
    )..layout();

    iconPainter.paint(
      canvas,
      Offset(
        iconLeft + (iconCircleSize - iconPainter.width) / 2,
        iconTop + (iconCircleSize - iconPainter.height) / 2,
      ),
    );

    /// destaque quando selecionado
    if (isSelected) {
      canvas.drawPath(
        path,
        Paint()
          ..color = const Color(0xFFE53935).withValues(alpha: 0.06)
          ..style = PaintingStyle.fill,
      );
    }

    final picture = recorder.endRecording();
    final image = await picture.toImage(
      width.toInt(),
      totalHeight.toInt(),
    );

    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    return bytes!.buffer.asUint8List();
  }

  Future<Uint8List> createPinWithAsset(String assetPath) async {
    debugPrint(assetPath);
    const double size = 70;
    const double strokeWidth = 4;
    const double radius = 90;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    // final fillPaint = Paint()..color = Colors.white;
    final fillPaint = Paint()..color = Colors.black;

    final borderPaint = Paint()
      // ..color = const Color(0xFF2B5BEE)
      ..color = AppColors.danger //fire
      // ..color = Colors.white //fire
      // ..color = AppColors.primaryColor //flooding
      // ..color = AppColors.primaryColor //car
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..isAntiAlias = true;

    final fillRRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(0, 0, size, size),
      const Radius.circular(radius),
    );

    double borderInset = strokeWidth / 2;

    final borderRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        borderInset,
        borderInset,
        size - strokeWidth,
        size - strokeWidth,
      ),
      Radius.circular(radius - borderInset),
    );

    canvas.drawRRect(fillRRect, fillPaint);
    canvas.drawRRect(borderRRect, borderPaint);

    final ByteData data = await rootBundle.load(assetPath);
    final Uint8List bytes = data.buffer.asUint8List();

    final codec = await ui.instantiateImageCodec(bytes, targetWidth: 56);
    final frame = await codec.getNextFrame();
    final image = frame.image;

    final offset = Offset(
      (size - image.width) / 2,
      (size - image.height) / 2,
    );

    canvas.drawImage(image, offset, Paint());

    final picture = recorder.endRecording();
    final img = await picture.toImage(size.toInt(), size.toInt());
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }

  Future<void> _onMarkeClick(List<IncidentOutput> incidents) async {
    _pointManager?.tapEvents(
      onTap: (pointAnnotation) async {
        _previousCameraState = await _mapboxMap?.getCameraState();
        final coords = pointAnnotation.geometry.coordinates;

        final index = incidents.indexWhere(
          (p) =>
              p.local?.latitue == coords.lat &&
              p.local?.longitude == coords.lng,
        );

        _highlightMarker(pointAnnotation);

        if (index != -1) {
          _incidentPageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
        }

        _zoomToMarker(coords);
        setState(() {
          _showIncidentCards = true;
          _gpsHeight = GPSHeight.hight;
        });
      },
    );
  }

  Future<void> _zoomToMarker(Position coords) async {
    final double cardHeight = 200.h; // altura do card
    final double screenHeight = 800.h; // altura da tela aproximada

    final double offsetRatio = cardHeight / screenHeight;

    await _mapboxMap?.flyTo(
      CameraOptions(
        center: Point(
          coordinates: Position(
            coords.lng,
            // coords.lat + 0.0015,
            coords.lat + (0.003 * offsetRatio),
          ),
        ),
        zoom: 16.5,
      ),
      MapAnimationOptions(duration: 1000),
    );
    // await _mapboxMap?.flyTo(
    //   CameraOptions(
    //     center: Point(
    //       coordinates: Position(coords.lng, coords.lat),
    //     ),
    //     zoom: 16.5,
    //     padding: MbxEdgeInsets(
    //       top: 80,
    //       left: 0,
    //       right: 0,
    //       bottom: 300, // altura do card
    //     ),
    //   ),
    //   MapAnimationOptions(duration: 1000),
    // );
  }

  Future<void> _goToMyLocation(CurrentLocation? location) async {
    if (location == null) return;

    await _mapboxMap?.flyTo(
      CameraOptions(
        center: Point(
          coordinates: Position(location.longitude, location.latitude),
        ),
        zoom: _initialZoom,
        // pitch: 0,
      ),
      MapAnimationOptions(
        duration: 1200,
      ),
    );
  }

  Future<void> _highlightMarker(PointAnnotation pointAnnotation) async {
    // /// volta todos para tamanho normal
    // for (final m in _markers) {
    //   m.iconSize = 1.5;
    // }

    /// aumenta o selecionado
    // marker.iconSize = 2;

    _activeMarker = pointAnnotation;
    // await _pointManager?.update(pointAnnotation);
    // for (final marker in _markers) {
    //   await _pointManager?.update(marker);
    // }

    if (_activeMarker != null) {
      _activeMarker!.iconSize = 1.8;
      await _pointManager?.update(_activeMarker!);
    }
  }

  void _onIncidentCardChanged(int index) {
    // final point = _incidentPoints[index].coordinates;

    // _mapboxMap?.flyTo(
    //   CameraOptions(
    //     center: Point(
    //       coordinates: Position(
    //         point.lng,
    //         point.lat + 0.0015,
    //       ),
    //     ),
    //     zoom: 16.5,
    //   ),
    //   MapAnimationOptions(duration: 900),
    // );
    final marker = _markers[index];

    _highlightMarker(marker);

    final coords = marker.geometry.coordinates;

    _zoomToMarker(coords);
  }
}
