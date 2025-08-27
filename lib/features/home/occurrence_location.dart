import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class OccurrenceLocation {
  final String id;
  final LatLng position;
  final double bearing;
  final String image;
  final IconData icon;
  final String? date;
  final double? rating;
  final String? plateNumber;
  bool isVerified;

  OccurrenceLocation({
    required this.id,
    required this.position,
    required this.bearing,
    required this.image,
    required this.date,
    required this.rating,
    required this.plateNumber,
    required this.icon,
    this.isVerified = true,
  });

  // OccurrenceLocation(
  //   this.id,
  //   this.position,
  //   this.bearing,
  //   this.vehicleType,
  //   this.driverName,
  //   this.rating,
  //   this.plateNumber,
  // );
}
