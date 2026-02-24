import 'package:deehelp/old_core/services/location/current_location.dart';

enum IncidentField {
  howto,
  city,
  state,
  address,
}

extension IncidentFieldExtension on IncidentField {
  String? getPlaceValueFrom(OldCurrentLocation? place) {
    if (place == null) return null;
    switch (this) {
      case IncidentField.city:
        return place.city;
      case IncidentField.state:
        return place.state;
      case IncidentField.address:
        return place.fullAddress;
      default:
        {
          return null;
        }
    }
  }

  String get validationMessage {
    switch (this) {
      case IncidentField.city:
        return "Cidade do ocorrido";
      case IncidentField.state:
        return "Estado do ocorrido";
      case IncidentField.address:
        return "Local aproximado";
      case IncidentField.howto:
        return "Nos informe um pouco mais de detalhe.";
    }
  }
}
