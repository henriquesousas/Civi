import 'package:deehelp/core/handlers/handle_command.dart';
import 'package:deehelp/core/handlers/handler_error.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/features/incident/domain/usecase/listing/get_incident_by_user_usecase.dart';
import 'package:deehelp/features/incident/presentation/views/listing/state/listing_incident_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListingIncidentViewmodel extends StateNotifier<ListingIncidentState> {
  List<IncidentOutput> _cacheIncidents = [];
  final String _userId;
  final GetIncidentByUserUseCase _getIncidentByUserUseCase;
  ListingIncidentViewmodel({
    required String userId,
    required GetIncidentByUserUseCase getIncidentByUserUseCase,
  })  : _userId = userId,
        _getIncidentByUserUseCase = getIncidentByUserUseCase,
        super(const ListingIncidentState.empty());

  void getAllIncidents() async {
    await HandleCommand.execute<List<IncidentOutput>, ListingIncidentState>(
      updateState: (newState) => state = newState,
      command: () => _getIncidentByUserUseCase.execute(_userId),
      onLoading: () => const ListingIncidentState.loading(),
      onSuccess: (incidents) {
        _cacheIncidents = incidents;
        return incidents.isEmpty
            ? const ListingIncidentState.empty()
            : ListingIncidentState.success(incidents, "");
      },
      onError: (error) {
        return handleError<ListingIncidentState>(
          error,
          (message, extra) {
            return ListingIncidentState.error(message);
          },
        );
      },
    );
  }

  void guardSelected(IncidentOutput incident) {
    state = ListingIncidentState.guard(incident, _cacheIncidents);
  }
}
