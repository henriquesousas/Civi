import 'package:deehelp/features/incident/domain/incident.dart';
import 'package:deehelp/features/map/widgets/map_custom_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

class Osm extends StatelessWidget {
  final List<Incident> item;
  final MapController controller;
  final LatLng initial;
  final double initialZoom;
  final Function(Incident) press;
  final VoidCallback onMapEventMove;
  final AnimatedMapController animatedMapController;
  const Osm({
    super.key,
    required this.controller,
    required this.initial,
    required this.item,
    required this.press,
    required this.onMapEventMove,
    required this.animatedMapController,
    this.initialZoom = 13.0,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: animatedMapController.mapController,
      options: MapOptions(
        initialCenter: initial,
        initialZoom: initialZoom,
        onMapEvent: (event) {
          if (event is MapEventMoveStart) {
            onMapEventMove();
          }
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],
        ),
        // CircleLayer(
        //   circles: [
        //     CircleMarker(
        //         point: LatLng(-23.5107, -46.8764),
        //         color:
        //             Colors.blue.withOpacity(0.2), // preenchimento transparente
        //         borderStrokeWidth: 2,
        //         borderColor: Colors.blue,
        //         radius: 800, // raio em metros
        //         useRadiusInMeter: true),
        //   ],
        // ),
        //TODO: PIN AQUI
        MarkerLayer(
          markers: item
              .map(
                (r) => Marker(
                  point: LatLng(r.local!.latitue!, r.local!.longitude!),
                  width: 180.w,
                  height: 90.h,
                  child: GestureDetector(
                    // onTap: () => _mostrarDetalhes2(r, context),
                    onTap: () => press(r),
                    child: const IntrinsicWidth(
                      child: MapCustomMarker(
                        label: "label",
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
