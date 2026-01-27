// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';

// class LocationProvider extends ChangeNotifier {
//   bool? _hasPermission;

//   bool? get hasPermission => _hasPermission;

//   Future<void> checkPermission() async {
//     final status = await Permission.location.status;

//     _hasPermission = status.isGranted;
//     notifyListeners();
//   }

//   Future<void> requestPermission() async {
//     final status = await Permission.location.request();
//     _hasPermission = status.isGranted;
//     notifyListeners();
//   }
// }
