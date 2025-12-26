import 'package:deehelp/core/providers/supabase_provider.dart';
import 'package:deehelp/features/products/domain/product_repository.dart';
import 'package:deehelp/features/products/external/repository/supabase_product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRepositoryProvider =
    Provider.autoDispose<ProductRepository>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return SupabaseProductRepository(client: client);
});
