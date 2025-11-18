import 'package:deehelp/features/itens/domain/entities/my_items.dart';

abstract class ItemRepository {
  Future<void> save(Item item);
  Future<List<Item>> getByUser(String userId);
  Future<void> delete(String userId);
}
