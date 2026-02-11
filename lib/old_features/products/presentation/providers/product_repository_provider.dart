import 'package:deehelp/old_core/providers/supabase_provider.dart';
import 'package:deehelp/old_features/products/domain/product_repository.dart';
import 'package:deehelp/old_features/products/external/repository/supabase_product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRepositoryProvider =
    Provider.autoDispose<ProductRepository>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return SupabaseProductRepository(client: client);
});
