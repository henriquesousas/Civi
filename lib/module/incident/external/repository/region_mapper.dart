import 'package:deehelp/module/incident/domain/region.dart';

class RegionMapper {
  static Region? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;
    return Region(
      id: map["id"],
      name: map["name"],
      city: map["city"],
      state: map["state"],
      regionKey: map["region_key"],
    );
  }
}
