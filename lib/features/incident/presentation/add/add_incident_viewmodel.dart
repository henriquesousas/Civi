import 'package:deehelp/core/handlers/handle_command.dart';
import 'package:deehelp/core/handlers/handler_error.dart';
import 'package:deehelp/core/utils/unit.dart';
import 'package:deehelp/features/incident/domain/entity/type_alert.dart';
import 'package:deehelp/features/incident/domain/usecase/add/add_incident_dto.dart';
import 'package:deehelp/features/incident/domain/usecase/add/add_incident_immediately_usecase.dart';
import 'package:deehelp/features/incident/presentation/add/state/add_incident_state.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddIncidentViewmodel extends StateNotifier<AddIncidentState> {
  final AddIncidentImmediatelyUsecase _addIncidentImmediatelyUsecase;
  AddIncidentViewmodel({
    required AddIncidentImmediatelyUsecase addIncidentImmediatelyUsecase,
  })  : _addIncidentImmediatelyUsecase = addIncidentImmediatelyUsecase,
        super(AddIncidentState.initial());

  void selectProduct(Product product) =>
      state = state.copyWith(product: product);

  void selectTypeAlert(TypeAlert type) => state = state.copyWith(type: type);

  void save(String userId) async {
    final dto = AddIncidentDto(
      product: state.product!,
      userId: userId,
    );
    await HandleCommand.execute<Unit, AddIncidentState>(
      updateState: (newState) => state = newState,
      command: () => _addIncidentImmediatelyUsecase.execute(dto),
      onLoading: () => state.copyWith(errorMessage: null),
      onSuccess: (result) => state =
          state.copyWith(successMessage: "Incidente registrado com sucesso."),
      onError: (error) {
        return handleError<AddIncidentState>(
          error,
          (message, extra) {
            return state.copyWith(errorMessage: message);
          },
        );
      },
    );
  }
}
