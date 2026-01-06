import 'package:deehelp/features/incident/domain/entity/incident.dart';
import 'package:deehelp/features/map/widgets/map_custom_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

class Osm extends StatefulWidget {
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
  State<Osm> createState() => _OsmState();
}

class _OsmState extends State<Osm> {
  double _getRadius(double zoom) {
    // const baseRadius = 1000;
    // return baseRadius / (zoom / 10);

    const baseRadius = 1000; // 1 km
    return baseRadius * (zoom / 10);
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: widget.animatedMapController.mapController,
      options: MapOptions(
        initialCenter: widget.initial,
        initialZoom: widget.initialZoom,
        onMapEvent: (event) {
          if (event is MapEventMoveStart) {
            widget.onMapEventMove();
          }
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],
        ),
        CircleLayer(
          circles: [
            CircleMarker(
              point: widget.initial,
              color: Colors.red.withValues(alpha: 0.2),
              borderStrokeWidth: 2,
              borderColor: Colors.red,
              radius: _getRadius(widget.initialZoom), // raio em mesros
              useRadiusInMeter: true,
            ),
          ],
        ),
        //TODO: PIN AQUI
        MarkerLayer(
          markers: widget.item
              .map(
                (r) => Marker(
                  point: LatLng(r.local!.latitue!, r.local!.longitude!),
                  width: 180.w,
                  height: 90.h,
                  child: GestureDetector(
                    // onTap: () => _mostrarDetalhes2(r, context),
                    onTap: () => widget.press(r),
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
