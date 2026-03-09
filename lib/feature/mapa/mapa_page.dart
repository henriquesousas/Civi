import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/services/permissions/location/export_location.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/feature/mapa/reported_by.dart';
import 'package:deehelp/feature/mapa/widgets/horizontal_incident_card.dart';
import 'package:deehelp/feature/mapa/widgets/map_location_summary_card.dart';
import 'package:deehelp/feature/mapa/widgets/map_search.dart';
import 'package:deehelp/module/auth/external/di/authenticated_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class FakeIncident {
  final Point point;
  final IconData image;
  final Color pinBorder;

  FakeIncident(
      {required this.point, required this.image, required this.pinBorder});

  static List<FakeIncident> items() {
    return [
      FakeIncident(
        point: Point(coordinates: Position(-46.7905, -23.5338)),
        image: Icons.directions_car_filled_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7889, -23.5315)),
        image: Icons.smartphone_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7952, -23.5347)),
        image: Icons.two_wheeler_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7978, -23.5299)),
        image: Icons.flood_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7854, -23.5361)),
        image: Icons.visibility_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7822, -23.5304)),
        image: Icons.flood_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.8001, -23.5321)),
        image: Icons.directions_car_filled_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.8035, -23.5374)),
        image: Icons.directions_car_filled_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.8035, -23.5374)),
        image: Icons.motorcycle,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7768, -23.5289)),
        image: Icons.directions_car_filled_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7741, -23.5340)),
        image: Icons.motorcycle_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7867, -23.5257)),
        image: Icons.motorcycle_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7928, -23.5402)),
        image: Icons.directions_car_filled_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.8057, -23.5295)),
        image: Icons.motorcycle_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.8092, -23.5333)),
        image: Icons.phone_android_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7819, -23.5411)),
        image: Icons.directions_car_filled_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7727, -23.5378)),
        image: Icons.directions_car_filled_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7994, -23.5252)),
        image: Icons.directions_car_filled_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.8070, -23.5415)),
        image: Icons.directions_car_filled_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7840, -23.5440)),
        image: Icons.directions_car_filled_rounded,
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7708, -23.5309)),
        image: Icons.directions_car_filled_rounded,
        pinBorder: AppColors.primaryColor,
      ),
    ];
  }
}

class MapaPage extends ConsumerStatefulWidget {
  const MapaPage({super.key});

  @override
  ConsumerState<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends ConsumerState<MapaPage> {
  final _initialZoom = 13.8;
  bool _showIncidentCards = false;
  // bool _locationEnabled = false;
  CameraState? _previousCameraState;
  final List<PointAnnotation> _markers = [];
  PointAnnotation? _activeMarker;
  PointAnnotationManager? _pointManager;
  final PageController _incidentPageController =
      PageController(viewportFraction: 0.88);
  MapboxMap? _mapboxMap;
  static final Point _myLocation = Point(
    coordinates: Position(-46.7917, -23.5329),
  );

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authenticatedUserProvider);
    final currenLocation = ref.watch(currentLocationProvider);

    return Scaffold(
      body: Stack(
        children: [
          //Mapa
          MapWidget(
            key: const ValueKey('mapWidget'),
            styleUri: MapboxStyles.MAPBOX_STREETS,
            cameraOptions: CameraOptions(
              center: _myLocation,
              zoom: _initialZoom,
            ),
            onMapCreated: _onMapCreated,
          ),
          //Search
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: MapSearch(
                // hintText: 'Buscar incidentes ou locais',
                hintText: "👋 Digite uma placa ou IMEI de celular",
                avatarUrl: state?.photoUrl,
                userName: state?.name ?? '',
                notificationCount: 3,
                onTap: () {},
                onAvatarTap: () {},
                onNotificationTap: () {},
              ),
            ),
          ),
          //GPS
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            right: 16,
            bottom: _showIncidentCards ? 260.h : 100.h,
            child: FloatingActionButton(
              mini: false,
              backgroundColor: context.primaryColor,
              elevation: 8,
              onPressed: () => _goToMyLocation(currenLocation),
              child: const Icon(
                Icons.my_location_rounded,
                color: Colors.white,
              ),
            ),
          ),
          //Close incidents
          _clseButton(),
          //Grid incidentes
          AnimatedPositioned(
            duration: const Duration(milliseconds: 350),
            left: 16,
            right: 16,
            bottom: _showIncidentCards ? context.topPadding : -300,
            child: _horizontalIncidentCard(),
          ),
          // Location
          Positioned(
            left: 16,
            right: 16,
            bottom: -10,
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 300),
              offset: _showIncidentCards ? const Offset(0, 1) : Offset.zero,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: _showIncidentCards ? 0 : 1,
                child: const Positioned(
                  child: MapLocationSummaryCard(
                    title: "Osasco - SP",
                    alertsText: "4 alertas últimas 24 hrs",
                  ),
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
      bottom: _showIncidentCards ? 260.h : 100.h,
      left: 30,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: _showIncidentCards ? 1 : 0,
        // opacity: 1,
        child: IgnorePointer(
          ignoring: !_showIncidentCards,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
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
                });

                if (_previousCameraState != null) {
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

  Widget _horizontalIncidentCard() {
    final height = context.percentHeight(0.10).clamp(205.0, 245.0);
    return SizedBox(
      height: height,
      child: PageView.builder(
        clipBehavior: Clip.none,
        controller: _incidentPageController,
        itemCount: FakeIncident.items().length,
        onPageChanged: (index) {
          _onIncidentCardChanged(index);
        },
        itemBuilder: (context, index) {
          return HorizontalIncidentCard(
            incidentType: 'Roubo',
            title: 'Fox vermelho 2013',
            locationLabel: 'Centro, Osasco',
            timeLabel: 'hoje, 18:30',
            distanceLabel: '1,2 km de você',
            reportedBy: ReportedBy.community,
            coverImageUrl:
                'https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=400',
            confirmations: 93,
            participantAvatarUrls: const [
              'https://i.pravatar.cc/100?img=1',
              'https://i.pravatar.cc/100?img=2',
              'https://i.pravatar.cc/100?img=3',
            ],
            onTap: () {},
            onShareTap: () {},
            onBookmarkTap: () {},
          );
        },
      ),
    );
  }

  Future<void> _onMapCreated(MapboxMap mapboxMap) async {
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

    _pointManager =
        await _mapboxMap!.annotations.createPointAnnotationManager();

    _showScallableZoom(false);
    _onMarkeClick();

    final incidents = FakeIncident.items();
    _markers.clear();
    for (final incident in incidents) {
      final pinImage = await createPinWithIconV4(
        icon: incident.image,
        label: 'DND0171',
        isSelected: true,
      );

      final marker = await _pointManager!.create(
        PointAnnotationOptions(
          geometry: incident.point,
          image: pinImage,
          iconSize: 1.5,
          iconAnchor: IconAnchor.BOTTOM,
        ),
      );
      _markers.add(marker);
      // if (marker != null) {
      //   _markers.add(marker);
      // }
    }
  }

  Future<void> _showScallableZoom(bool v) async {
    _mapboxMap?.scaleBar.updateSettings(
      ScaleBarSettings(
        enabled: v,
      ),
    );
  }

  Future<Uint8List> createPinWithIconV4({
    required String label,
    required IconData icon,
    bool isSelected = true,
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

  Future<void> _onMarkeClick() async {
    _pointManager?.tapEvents(
      onTap: (pointAnnotation) async {
        _highlightMarker(pointAnnotation);
        _previousCameraState = await _mapboxMap?.getCameraState();
        final coords = pointAnnotation.geometry.coordinates;

        final index = FakeIncident.items().indexWhere(
          (p) => p.point.coordinates == coords,
        );

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
        zoom: 16.5,
        pitch: 0,
      ),
      MapAnimationOptions(
        duration: 1200,
      ),
    );
  }

  Future<void> _highlightMarker(PointAnnotation marker) async {
    // /// volta todos para tamanho normal
    // for (final m in _markers) {
    //   m.iconSize = 1.5;
    // }

    /// aumenta o selecionado
    // marker.iconSize = 2;

    _activeMarker = marker;
    for (final marker in _markers) {
      await _pointManager?.update(marker);
    }

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
