import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class OsmMap extends StatelessWidget {
  final double initialZoom;
  final MapController controller;
  final LatLng currentLocation;
  final Marker markerCurrentUser;
  final Function(MapCamera, bool) onPositionChanged;
  const OsmMap(
      {super.key,
      this.initialZoom = 18.0,
      required this.controller,
      required this.currentLocation,
      required this.onPositionChanged,
      required this.markerCurrentUser});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: controller,
      options: MapOptions(
        initialCenter: currentLocation,
        initialZoom: initialZoom,
        maxZoom: 18.0,
        minZoom: 10.0,
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all,
        ),
        onPositionChanged: (camera, hasGesture) =>
            onPositionChanged(camera, hasGesture),
      ),
      children: [
        TileLayer(
          // urlTemplate: _isSatelliteView
          //     ? 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}'
          //     : 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

          // urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          urlTemplate:
              'https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}',
          userAgentPackageName: 'br.com.atomos.yousafe',
          maxZoom: 18,
        ),
        MarkerLayer(
          markers: [
            markerCurrentUser,
            // _buildUserMarker(
            //   point: _currentLocation,
            //   icon: Icons.person_pin_circle,
            //   color: AppColors.primaryColor,
            //   label: 'Você',
            // ),
            // ..._buildOccurrences(),
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
}
