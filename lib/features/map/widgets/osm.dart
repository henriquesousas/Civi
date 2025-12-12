import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/ui/widgets/pin/ui_custom_pinv2.dart';
import 'package:deehelp/features/map/map_page.dart';
import 'package:deehelp/features/map/widgets/map_custom_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Osm extends StatelessWidget {
  final List<RouboMarker> item;
  final MapController controller;
  final LatLng initial;
  final double initialZoom;
  final Function(RouboMarker) press;
  const Osm({
    super.key,
    required this.controller,
    required this.initial,
    required this.item,
    required this.press,
    this.initialZoom = 13.0,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: controller,
      options: MapOptions(
        initialCenter: initial,
        initialZoom: initialZoom,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],
        ),
        //TODO: PIN AQUI
        MarkerLayer(
          markers: item
              .map(
                (r) => Marker(
                  point: r.pos,
                  width: 120,
                  height: 50,
                  child: GestureDetector(
                    // onTap: () => _mostrarDetalhes2(r, context),
                    onTap: () => press(r),
                    child: IntrinsicWidth(
                      child: MapCustomMarker(
                        label: "label",
                        icon: r.icone,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        // CircleLayer(
        //   circles: [
        //     CircleMarker(
        //         point: LatLng(-23.5107, -46.8764),
        //         color: Colors.blue
        //             .withOpacity(0.2), // preenchimento transparente
        //         borderStrokeWidth: 2,
        //         borderColor: Colors.blue,
        //         radius: 500, // raio em metros
        //         useRadiusInMeter: true),
        //   ],
        // ),
      ],
    );
  }
}
