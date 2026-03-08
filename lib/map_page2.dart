import 'dart:typed_data' show Uint8List, ByteData;
import 'dart:ui' as ui;

import 'package:deehelp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapPage2 extends StatefulWidget {
  const MapPage2({super.key});

  @override
  State<MapPage2> createState() => _MapPage2State();
}

class _MapPage2State extends State<MapPage2> {
  MapboxMap? _mapboxMap;
  PointAnnotationManager? _pointManager;
  @override
  Widget build(BuildContext context) {
    final occurrences = [
      const MapOccurrenceCardModel(
        title: 'Roubo de veículo',
        metaLabel: 'ontem às 13:50 • 1.5 km de você',
        confirmations: 7,
        imageUrl:
            'https://images.unsplash.com/photo-1503376780353-7e6692767b70',
        avatars: [
          'https://i.pravatar.cc/100?img=1',
          'https://i.pravatar.cc/100?img=2',
          'https://i.pravatar.cc/100?img=3',
        ],
      ),
      const MapOccurrenceCardModel(
        title: 'Roubo de veículo',
        metaLabel: 'ontem às 13:50 • 1.5 km de você',
        confirmations: 7,
        imageUrl:
            'https://images.unsplash.com/photo-1503376780353-7e6692767b70',
        avatars: [
          'https://i.pravatar.cc/100?img=1',
          'https://i.pravatar.cc/100?img=2',
          'https://i.pravatar.cc/100?img=3',
        ],
      )
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: Stack(
        children: [
          /// MAPA
          Positioned.fill(
            child: Container(
              color: const Color(0xFFE8EDF5),
              child: MapWidget(
                key: const ValueKey('mapWidget'),
                styleUri: MapboxStyles.MAPBOX_STREETS,
                cameraOptions: CameraOptions(
                  center: Point(
                    coordinates: Position(-46.7917, -23.5329),
                  ),
                  zoom: 14,
                ),
                onMapCreated: _onMapCreated,
              ),
            ),
          ),

          /// LISTA DE CARDS INFERIOR
          Positioned(
            left: 0,
            right: 0,
            bottom: 82,
            child: SizedBox(
              height: 178,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: occurrences.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, index) {
                  return OccurrenceBottomCard(
                    item: occurrences[index],
                    onTap: () {},
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onMapCreated(MapboxMap mapboxMap) async {
    _mapboxMap = mapboxMap;

    _pointManager =
        await _mapboxMap!.annotations.createPointAnnotationManager();

    // final ByteData data = await rootBundle.load('assets/images/pin.png');
    // final Uint8List bytes = data.buffer.asUint8List();

    // final image = await createPinImage();
    final image = await createPinWithContainer();

    await _pointManager!.create(
      PointAnnotationOptions(
        geometry: Point(
          coordinates: Position(-46.7917, -23.5329),
        ),
        // image: bytes,
        image: image,
        iconSize: 1,
        iconAnchor: IconAnchor.BOTTOM,
      ),
    );
  }

  Future<Uint8List> createPinWithContainer() async {
    const double size = 120;
    const double strokeWidth = 3;
    const double radius = 90;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final fillPaint = Paint()..color = Colors.white;

    final borderPaint = Paint()
      // ..color = const Color(0xFF2B5BEE)
      ..color = AppColors.danger //fire
      // ..color = AppColors.primaryColor //flooding
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

    final ByteData data = await rootBundle.load('assets/images/fire.png');
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
}

class MapOccurrenceCardModel {
  final String title;
  final String metaLabel;
  final int confirmations;
  final String imageUrl;
  final List<String> avatars;

  const MapOccurrenceCardModel({
    required this.title,
    required this.metaLabel,
    required this.confirmations,
    required this.imageUrl,
    required this.avatars,
  });
}

class OccurrenceBottomCard extends StatelessWidget {
  final MapOccurrenceCardModel item;
  final VoidCallback onTap;

  const OccurrenceBottomCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        elevation: 8,
        shadowColor: const Color(0x18000000),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: SizedBox(
                    width: 84,
                    height: 96,
                    child: Image.network(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return Container(
                          color: const Color(0xFFF1F5F9),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.image_outlined,
                            color: Color(0xFF94A3B8),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 96,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF111827),
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            height: 1.15,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item.metaLabel,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            _AvatarStack(avatars: item.avatars),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                '${item.confirmations} pessoas confirmaram',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xFF111827),
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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

class _AvatarStack extends StatelessWidget {
  final List<String> avatars;

  const _AvatarStack({required this.avatars});

  @override
  Widget build(BuildContext context) {
    final display = avatars.take(4).toList();

    return SizedBox(
      height: 28,
      width: 28 + (display.length - 1) * 18,
      child: Stack(
        children: [
          for (int i = 0; i < display.length; i++)
            Positioned(
              left: i * 18,
              child: CircleAvatar(
                radius: 14,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage(display[i]),
                ),
              ),
            )
        ],
      ),
    );
  }
}
