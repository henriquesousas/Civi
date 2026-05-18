import 'package:flutter/material.dart';

class VehicleMedia {
  final String id;
  final String name; // "VW Fox"
  final List<VehiclePhoto> photos;

  const VehicleMedia(
      {required this.id, required this.name, required this.photos});
}

class VehiclePhoto {
  final String url;
  final String label; // "Frente", "Verso", "Amassado"...

  const VehiclePhoto({required this.url, required this.label});
}

class MediaTab extends StatelessWidget {
  const MediaTab({super.key, required this.vehicles});

  final List<VehicleMedia> vehicles;

  @override
  Widget build(BuildContext context) {
    if (vehicles.isEmpty) {
      return const Center(
        child: Text('Nenhuma mídia ainda',
            style: TextStyle(color: Colors.white38)),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: vehicles.length,
          separatorBuilder: (_, __) => const Divider(height: 1, thickness: 0.5),
          itemBuilder: (context, i) => _VehicleSection(vehicle: vehicles[i]),
        ),
      ),
    );
  }
}

class _VehicleSection extends StatefulWidget {
  const _VehicleSection({required this.vehicle});
  final VehicleMedia vehicle;

  @override
  State<_VehicleSection> createState() => _VehicleSectionState();
}

class _VehicleSectionState extends State<_VehicleSection> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Text(
                  widget.vehicle.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 13),
                ),
                const SizedBox(width: 6),
                Text(
                  '${widget.vehicle.photos.length} fotos',
                  style: TextStyle(
                      fontSize: 12, color: Colors.white.withOpacity(0.4)),
                ),
                const Spacer(),
                AnimatedRotation(
                  turns: _expanded ? 0 : -0.25,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(Icons.keyboard_arrow_down,
                      size: 18, color: Colors.white38),
                ),
              ],
            ),
          ),
        ),

        // Grid
        if (_expanded)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemCount: widget.vehicle.photos.length,
            itemBuilder: (context, i) {
              final photo = widget.vehicle.photos[i];
              return GestureDetector(
                // onTap: () => _openViewer(context, photo),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(photo.url, fit: BoxFit.cover),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 3),
                        color: Colors.black54,
                        child: Text(
                          photo.label,
                          style: const TextStyle(
                              fontSize: 10, color: Colors.white70),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
      ],
    );
  }
}
