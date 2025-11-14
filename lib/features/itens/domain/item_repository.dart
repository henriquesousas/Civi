import 'package:deehelp/features/itens/domain/entities/my_items.dart';

abstract class ItemRepository {
  Future<void> save(Item item);
}
