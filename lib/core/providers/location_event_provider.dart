import 'package:deehelp/core/services/location/events/location_service_event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationServiceEventProvider =
    StateProvider<LocationServiceEvent?>((_) => null);
