import 'package:deehelp/v2/feature/map/presentation/widgets/draggable_content.dart';
import 'package:deehelp/v2/feature/map/presentation/widgets/incident_item.dart';
import 'package:deehelp/v2/feature/map/presentation/widgets/map_topbar.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapboxMap? _mapboxMap;

  Future<void> _applyMapStyle() async {
    if (_mapboxMap == null) return;

    await _mapboxMap!.style.setStyleImportConfigProperty(
      'basemap',
      'lightPreset',
      'night',
    );

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
  }

  @override
  Widget build(BuildContext context) {
    final incidents = IncidentItem.incidents;
    return Scaffold(
      body: Stack(
        children: [
          MapWidget(
            key: const ValueKey('mapWidget'),
            styleUri: MapboxStyles.STANDARD,
            // styleUri: MapboxStyles.MAPBOX_STREETS,
            androidHostingMode: AndroidPlatformViewHostingMode.HC,
            cameraOptions: CameraOptions(
              center: Point(coordinates: Position(-46.7917, -23.5329)),
              zoom: 16.0,
              pitch: 65,
              bearing: -30,
            ),
            // textureView: true,
            onMapCreated: (mapboxMap) {
              _mapboxMap = mapboxMap;
            },
            onStyleLoadedListener: (styleLoadedEventData) async {
              await _applyMapStyle();
            },
            onMapLoadErrorListener: (event) {},
          ),
          const MapTopbar(),
          DraggableScrollableSheet(
            initialChildSize: 0.26,
            minChildSize: 0.18,
            maxChildSize: 0.82,
            builder: (context, scrollController) {
              return DraggableContent(
                scrollController: scrollController,
                incidents: incidents,
              );
            },
          ),
        ],
      ),
    );
  }
}
