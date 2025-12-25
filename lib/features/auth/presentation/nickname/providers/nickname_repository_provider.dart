import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/providers/supabase_provider.dart';
import '../../../external/repositories/supabase_nickname_repository.dart';

final nicknameeRepositoryProvider = Provider(
  (ref) {
    final supabaseClient = ref.watch(supabaseClientProvider);
    return SupabaseNicknameRepository(client: supabaseClient);
  },
);
