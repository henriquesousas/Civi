import '../domain/entities/my_items.dart';

abstract class ItemDataSource {
  Future<void> save(Item item);
}
