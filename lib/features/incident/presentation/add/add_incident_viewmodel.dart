import 'package:deehelp/features/incident/presentation/add/add_incident_page.dart';
import 'package:deehelp/features/incident/presentation/add/state/add_incident_state.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddIncidentViewmodel extends StateNotifier<AddIncidentState> {
  AddIncidentViewmodel() : super(AddIncidentState.initial());

  void selectProduct(Product product) {
    state = state.copyWith(product: product);
  }

  void selectTypeAlert(TypeAlert type) {
    state = state.copyWith(type: type);
  }
}
