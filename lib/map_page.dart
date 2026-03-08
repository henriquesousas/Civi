import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:deehelp/card_bottom.dart';
import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/mons_house.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

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
      // final pinImage = await createPinWithIcon(
      //   borderColor: AppColors.primaryColor,
      //   icon: Icons.motorcycle,
      //   backgroundColor: AppColors.primaryColor,
      //   iconColor: Colors.white,
      // );

      // final pinImage = await createPinWithIconV2(
      //   icon: incident.image,
      //   accentColor: incident.pinBorder,
      //   isSelected: true,
      // );

      final pinImage = await createPinWithIconV3(
        icon: incident.image,
        label: 'DND0171',
        context: context,
      );

      final marker = await _pointManager!.create(
        PointAnnotationOptions(
          geometry: incident.point,
          image: pinImage,
          iconSize: 1.5,
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

  Future<Uint8List> createPinWithIconV2({
    required IconData icon,
    required Color accentColor,
    bool isSelected = false,
  }) async {
    const double size = 90;
    const double iconSize = 32;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final center = Offset(size / 2, size / 2 - 6);
    final radius = isSelected ? 30.0 : 27.0;

    /// sombra
    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.25)
      ..maskFilter = const ui.MaskFilter.blur(ui.BlurStyle.normal, 12);

    canvas.drawCircle(center.translate(0, 3), radius, shadowPaint);

    /// corpo branco
    final fillPaint = Paint()..color = Colors.white;
    canvas.drawCircle(center, radius, fillPaint);

    /// borda
    final borderPaint = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = isSelected ? 4 : 3;

    canvas.drawCircle(center, radius, borderPaint);

    /// pequena ponta
    final path = Path()
      ..moveTo(center.dx - 8, center.dy + radius - 2)
      ..quadraticBezierTo(
        center.dx,
        center.dy + radius + 12,
        center.dx + 8,
        center.dy + radius - 2,
      )
      ..close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, borderPaint);

    /// ícone
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: iconSize,
          fontFamily: icon.fontFamily,
          package: icon.fontPackage,
          color: Colors.black,
        ),
      ),
    );

    textPainter.layout();

    final iconOffset = Offset(
      center.dx - textPainter.width / 2,
      center.dy - textPainter.height / 2,
    );

    textPainter.paint(canvas, iconOffset);

    /// glow selecionado
    if (isSelected) {
      final glowPaint = Paint()
        ..color = AppColors.grey.withOpacity(0.18)
        ..maskFilter = const ui.MaskFilter.blur(ui.BlurStyle.normal, 16);

      canvas.drawCircle(center, radius + 6, glowPaint);
    }

    final picture = recorder.endRecording();
    final img = await picture.toImage(size.toInt(), (size + 16).toInt());
    final data = await img.toByteData(format: ui.ImageByteFormat.png);

    return data!.buffer.asUint8List();
  }

  Future<Uint8List> createPinWithIconV3({
    required BuildContext context,
    required String label,
    required IconData icon,
  }) async {
    const double width = 128;
    const double height = 48;
    const double pointerHeight = 10;

    const double borderRadius = 24;
    const double borderWidth = 1.4;

    const double iconCircleSize = 40;
    const double iconSize = 22;
    const double iconLeft = 8;

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

      /// até inicio da seta
      ..lineTo(centerX + 14, height)

      /// seta arredondada
      // ..cubicTo(
      //   centerX + 6,
      //   height,
      //   centerX + 4,
      //   height + 6,
      //   centerX,
      //   height + pointerHeight,
      // )
      // ..cubicTo(
      //   centerX - 4,
      //   height + 6,
      //   centerX - 6,
      //   height,
      //   centerX - 12,
      //   height,
      // )
      ..cubicTo(
        centerX + 6,
        height,
        centerX + 4,
        height + 6,
        centerX + 2,
        height + pointerHeight - 1,
      )

      /// arco da ponta (deixa redondo)
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

      /// lado esquerdo inferior
      ..lineTo(borderRadius, height)
      ..quadraticBezierTo(0, height, 0, height - borderRadius)

      /// lado esquerdo
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

    /// fundo branco
    canvas.drawPath(
      path,
      Paint()..color = Colors.white,
    );

    /// borda cinza
    canvas.drawPath(
      path,
      Paint()
        ..color = AppColors.grey.withValues(alpha: 0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth
        ..isAntiAlias = true,
    );

    /// círculo vermelho
    final double iconTop = (height - iconCircleSize) / 2;

    canvas.drawCircle(
      Offset(
        iconLeft + iconCircleSize / 2,
        iconTop + iconCircleSize / 2,
      ),
      iconCircleSize / 2,
      Paint()..color = const Color(0xFFE53935),
    );

    /// ícone branco
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

    /// texto
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: label,
        style: context.appText.caption.copyWith(
          color: context.onSurface,
        ),
      ),
    )..layout(maxWidth: width - 60);

    textPainter.paint(
      canvas,
      Offset(
        56,
        (height - textPainter.height) / 2,
      ),
    );

    final picture = recorder.endRecording();
    final image = await picture.toImage(
      width.toInt(),
      (height + pointerHeight + 6).toInt(),
    );

    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    return bytes!.buffer.asUint8List();
  }
}
