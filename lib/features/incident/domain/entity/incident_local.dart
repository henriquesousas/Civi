class IncidentLocal {
  final double? latitue;
  final double? longitude;
  final String city;
  final String state;
  final String address;

  IncidentLocal({
    required this.address,
    required this.city,
    required this.state,
    this.latitue,
    this.longitude,
  });
}
