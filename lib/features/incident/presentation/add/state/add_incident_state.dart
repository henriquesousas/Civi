import 'package:deehelp/features/incident/domain/entity/type_alert.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_incident_state.freezed.dart';

@freezed
abstract class AddIncidentState with _$AddIncidentState {
  const factory AddIncidentState({
    // @Default(false) bool isLoading,
    // @Default(false) bool addingPhoto,
    // @Default(false) bool deletingProduct,
    // @Default(false) bool isSuccess,
    // String? updateValue,
    // String? errorValidation,
    Product? product,
    @Default(TypeAlert.none) TypeAlert type,
    String? errorMessage,
    String? successMessage,
  }) = _AddIncidentState;

  factory AddIncidentState.initial() => const AddIncidentState();
}
