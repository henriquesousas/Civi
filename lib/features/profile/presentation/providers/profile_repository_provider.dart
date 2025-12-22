import 'package:deehelp/features/profile/external/supabase_profile_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/supabase_provider.dart';

final profileRepositoryProvider = Provider(
  (ref) {
    final supabaseClient = ref.watch(supabaseClientProvider);
    return SupabaseProfileRepository(client: supabaseClient);
  },
);
