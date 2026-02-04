import 'package:deehelp/core/services/location/current_location.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final oldCurrentLocationProvider = StateProvider<CurrentLocation?>((ref) {
  return null;
});
