// import 'dart:async';

// import 'package:deehelp/old_core/extension/result_extension.dart';
// import 'package:deehelp/old_core/services/network/network_info.dart';
// import 'package:deehelp/business/auth/providers/loggued_user_provider.dart';
// import 'package:deehelp/module/incident/domain/usecase/incident_output.dart';
// import 'package:deehelp/feature/incidents/providers/incident_usecase_providers.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class IncidentListViewModel
//     extends AutoDisposeFamilyAsyncNotifier<List<IncidentOutput>, NetworkInfo> {
//   List<IncidentOutput> _cacheIncidents = [];

//   @override
//   FutureOr<List<IncidentOutput>> build(NetworkInfo networkInfo) async {
//     // final connection = await networkInfo.hasConnection;
//     // if (!connection) {
//     //   return [];
//     // }
//     return _fetchAll();
//   }

//   Future<List<IncidentOutput>> _fetchAll() async {
//     // final authenticatedUser = ref.watch(logguedUserProviderOld);
//     // final getIncidentByUserUseCase =
//     //     ref.watch(getIncidentByUserUseCaseProvider);
//     // final incidentOrError =
//     //     await getIncidentByUserUseCase.execute(authenticatedUser!.id);

//     // if (incidentOrError.isFailure) {
//     return [];
//     // }
//     // _cacheIncidents = incidentOrError.data as List<IncidentOutput>;
//     // return _cacheIncidents;
//   }

//   void updateAt(IncidentOutput current) {
//     // final index = _cacheIncidents.indexWhere((inc) => inc.id == current.id);
//     // if (index != -1) {
//     //   _cacheIncidents = List<IncidentOutput>.from(_cacheIncidents);
//     //   _cacheIncidents[index] = current;
//     //   state = AsyncValue.data(_cacheIncidents);
//     // }
//   }

//   void removeAt(IncidentOutput current) {
//     // final index = _cacheIncidents.indexWhere((inc) => inc.id == current.id);
//     // if (index != -1) {
//     //   _cacheIncidents.removeAt(index);
//     //   state = AsyncValue.data(_cacheIncidents);
//     // }
//   }
// }
