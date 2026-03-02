import 'package:deehelp/core/providers/supabase_provider.dart';
import 'package:deehelp/module/incident/domain/incident_repository.dart';
import 'package:deehelp/module/incident/external/repository/supabase_incident_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final incidentRepositoryProvider =
    Provider.autoDispose<IncidentRepository>((ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return SupabaseIncidentRepository(supabaseClient: supabaseClient);
});
