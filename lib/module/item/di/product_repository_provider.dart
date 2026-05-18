import 'package:deehelp/old_core/providers/supabase_provider.dart';
import 'package:deehelp/module/item/domain/product_repository.dart';
import 'package:deehelp/module/item/repository/supabase_product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRepositoryProvider =
    Provider.autoDispose<ProductRepository>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return SupabaseProductRepository(client: client);
});
