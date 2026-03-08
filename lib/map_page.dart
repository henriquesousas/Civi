import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:deehelp/card_bottom.dart';
import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/mons_house.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class FakeIncident {
  final Point point;
  final String image;
  final Color pinBorder;

  FakeIncident(
      {required this.point, required this.image, required this.pinBorder});

  static List<FakeIncident> items() {
    return [
      FakeIncident(
        point: Point(coordinates: Position(-46.7905, -23.5338)),
        image: "assets/images/car_rouberry_v2.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7889, -23.5315)),
        image: "assets/images/car_rouberry_v2.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7952, -23.5347)),
        image: "assets/images/car_rouberry_v2.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7978, -23.5299)),
        image: "assets/images/car_rouberry.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7854, -23.5361)),
        image: "assets/images/car_rouberry_v3.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7822, -23.5304)),
        image: "assets/images/car_rouberry_v3.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.8001, -23.5321)),
        image: "assets/images/car_rouberry_v3.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.8035, -23.5374)),
        image: "assets/images/car_rouberry_v3.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.8035, -23.5374)),
        image: "assets/images/car_rouberry_v3.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7768, -23.5289)),
        image: "assets/images/car_rouberry_v3.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7741, -23.5340)),
        image: "assets/images/car_rouberry_v3.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7867, -23.5257)),
        image: "assets/images/car_rouberry_v3.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7928, -23.5402)),
        image: "assets/images/car_rouberry_v2.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.8057, -23.5295)),
        image: "assets/images/car_rouberry_v3.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.8092, -23.5333)),
        image: "assets/images/car_rouberry_v2.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7819, -23.5411)),
        image: "assets/images/car_rouberry_v2.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7727, -23.5378)),
        image: "assets/images/car_rouberry.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7994, -23.5252)),
        image: "assets/images/car_rouberry_v3.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.8070, -23.5415)),
        image: "assets/images/car_rouberry_v3.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7840, -23.5440)),
        image: "assets/images/car_rouberry_v3.png",
        pinBorder: AppColors.primaryColor,
      ),
      FakeIncident(
        point: Point(coordinates: Position(-46.7708, -23.5309)),
        image: "assets/images/car_rouberry_v3.png",
        pinBorder: AppColors.primaryColor,
      ),
    ];
  }
}

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool _showIncidentCards = false;
  List<PointAnnotation> _markers = [];

  PointAnnotation? _activeMarker;
  CameraState? _previousCameraState;
  final PageController _incidentPageController =
      PageController(viewportFraction: 0.85);
  MapboxMap? _mapboxMap;
  PointAnnotationManager? _pointManager;

  /// Sua localização base
  static final Point _myLocation = Point(
    coordinates: Position(-46.7917, -23.5329),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapWidget(
            key: const ValueKey('mapWidget'),
            styleUri: MapboxStyles.MAPBOX_STREETS,
            cameraOptions: CameraOptions(
              center: _myLocation,
              zoom: 13.8,
            ),
            onMapCreated: _onMapCreated,
          ),

          _clseButton(),

          //Grid incidents
          AnimatedPositioned(
            duration: const Duration(milliseconds: 350),
            left: 16,
            right: 16,
            bottom: _showIncidentCards ? context.topPadding + 10 : -200,
            child: _horizontalIncidentCard(),
          ),

          // Moms'House
          Positioned(
            left: 16,
            right: 16,
            bottom: 92,
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 300),
              offset: _showIncidentCards ? const Offset(0, 1) : Offset.zero,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: _showIncidentCards ? 0 : 1,
                child: const Positioned(
                  left: 16,
                  right: 16,
                  bottom: 92,
                  child: LocationSummaryCard(
                    title: "Mom's House",
                    alertsText: "4 alerts past 24 hr",
                  ),
                ),
              ),
            ),
          ),

          // Bottom Sheet
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 300),
              offset: _showIncidentCards ? const Offset(0, 1) : Offset.zero,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: _showIncidentCards ? 0 : 1,
                child: const Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: HomeBottomSheetNav(
                    currentIndex: 0,
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
      top: MediaQuery.of(context).padding.top + 12,
      right: 16,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: _showIncidentCards ? 1 : 0,
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
    return SizedBox(
      height: 170,
      child: PageView.builder(
        controller: _incidentPageController,
        itemCount: FakeIncident.items().length,
        onPageChanged: (index) {
          _onIncidentCardChanged(index);
        },
        itemBuilder: (context, index) {
          return MeetupMiniCard(
            organizer: 'Datadog User Group $index',
            title: 'Meetup São Paulo',
            subtitle: 'qui., mar. 20 • 18:30\npor Datadog User Gro...',
            groupAvatarUrl: 'https://i.pravatar.cc/100?img=11',
            coverImageUrl:
                'https://images.unsplash.com/photo-1511578314322-379afb476865?w=400',
            participants: 93,
            participantAvatarUrls: [
              'https://i.pravatar.cc/100?img=1',
              'https://i.pravatar.cc/100?img=2',
              'https://i.pravatar.cc/100?img=3',
            ],
          );
        },
      ),
    );
  }

  Future<void> _onMapCreated(MapboxMap mapboxMap) async {
    _mapboxMap = mapboxMap;

    _pointManager =
        await _mapboxMap!.annotations.createPointAnnotationManager();

    // Nao mostra a barra de zoom ao topo da Scalebar
    _mapboxMap?.scaleBar.updateSettings(
      ScaleBarSettings(
        enabled: false,
      ),
    );

    /// Listener de CLICK no marker
    _pointManager?.tapEvents(
      onTap: (ev) async {
        debugPrint("Pint ${ev.geometry.coordinates.lat}");
        _highlightMarker(ev);
        _previousCameraState = await _mapboxMap?.getCameraState();
        final coords = ev.geometry.coordinates;

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

    final incidents = FakeIncident.items();

    _markers.clear();

    for (final incident in incidents) {
      // final pinImage = await createPinWithContainer(incident.image);
      final pinImage = await createPinWithIcon(
        borderColor: AppColors.primaryColor,
        icon: Icons.motorcycle,
        backgroundColor: AppColors.primaryColor,
        iconColor: Colors.white,
      );

      final marker = await _pointManager!.create(
        PointAnnotationOptions(
          geometry: incident.point,
          image: pinImage,
          iconSize: 1.2,
          iconAnchor: IconAnchor.BOTTOM,
        ),
      );

      if (marker != null) {
        _markers.add(marker);
      }
    }

    /// Cria a imagem UMA vez e reutiliza em todos os markers
    // final Uint8List pinImage = await createPinWithEmoji();
    // final Uint8List pinImage = await createPinWithContainer("");
    // final options = FakeIncident.items().map((point) {
    //   return PointAnnotationOptions(
    //     geometry: point.point,
    //     image: pinImage,
    //     iconSize: 1.2,
    //     iconAnchor: IconAnchor.BOTTOM,
    //   );
    // }).toList();

    // final created = await _pointManager!.createMulti(options);
    // _markers = created.whereType<PointAnnotation>().toList();
  }

  Future<void> _zoomToMarker(Position coords) async {
    await _mapboxMap?.flyTo(
      CameraOptions(
        center: Point(
          coordinates: Position(
            coords.lng,
            coords.lat + 0.0015,
          ),
        ),
        zoom: 16.5,
      ),
      MapAnimationOptions(duration: 1000),
    );
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

  Future<void> _highlightMarker(PointAnnotation marker) async {
    // /// volta todos para tamanho normal
    for (final m in _markers) {
      m.iconSize = 1.0;
    }

    /// aumenta o selecionado
    marker.iconSize = 1.6;

    _activeMarker = marker;

    for (final marker in _markers) {
      await _pointManager?.update(marker);
    }
    // if (_activeMarker != null) {
    //   _activeMarker!.iconSize = 1.0;
    //   await _pointManager?.update(_activeMarker!);
    // }

    // marker.iconSize = 1.6;
    // await _pointManager?.update(marker);

    // _activeMarker = marker;
  }

  Future<Uint8List> createPinWithContainer(String assetPath) async {
    debugPrint(assetPath);
    const double size = 90;
    const double strokeWidth = 4;
    const double radius = 90;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final fillPaint = Paint()..color = Colors.white;

    final borderPaint = Paint()
      // ..color = const Color(0xFF2B5BEE)
      // ..color = AppColors.danger //fire
      // ..color = AppColors.primaryColor //flooding
      ..color = AppColors.primaryColor //car
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

  Future<Uint8List> createPinWithEmoji() async {
    const double size = 90;
    const double strokeWidth = 4;
    const double radius = 90;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final fillPaint = Paint()..color = Colors.white;

    final borderPaint = Paint()
      ..color = AppColors.danger2
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..isAntiAlias = true;

    final fillRRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(0, 0, size, size),
      const Radius.circular(radius),
    );

    final borderInset = strokeWidth / 2;

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

    final textPainter = TextPainter(
      text: const TextSpan(
        text: '🔥',
        style: TextStyle(
          fontSize: 52,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    final offset = Offset(
      (size - textPainter.width) / 2,
      (size - textPainter.height) / 2,
    );

    textPainter.paint(canvas, offset);

    final picture = recorder.endRecording();
    final img = await picture.toImage(size.toInt(), size.toInt());
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }

  Future<Uint8List> createPinWithIcon({
    required IconData icon,
    required Color borderColor,
    Color backgroundColor = Colors.white,
    Color iconColor = Colors.black,
  }) async {
    const double size = 60;
    const double strokeWidth = 4;
    const double radius = 90;
    const double iconSize = 34;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final fillPaint = Paint()..color = backgroundColor;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..isAntiAlias = true;

    final fillRRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(0, 0, size, size),
      const Radius.circular(radius),
    );

    final double borderInset = strokeWidth / 2;

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

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: iconSize,
          fontFamily: icon.fontFamily,
          package: icon.fontPackage,
          color: iconColor,
        ),
      ),
    );

    textPainter.layout();

    final iconOffset = Offset(
      (size - textPainter.width) / 2,
      (size - textPainter.height) / 2,
    );

    textPainter.paint(canvas, iconOffset);

    final picture = recorder.endRecording();
    final img = await picture.toImage(size.toInt(), size.toInt());
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }
}
