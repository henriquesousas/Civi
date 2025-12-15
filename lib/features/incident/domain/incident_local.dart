class IncidentLocal {
  final double? latitue;
  final double? longitude;
  final String address;
  final String neighborhood; //Bairro
  final String city;

  IncidentLocal({
    required this.address,
    required this.neighborhood,
    required this.city,
    this.latitue,
    this.longitude,
  });
}
