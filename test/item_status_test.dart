import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/domain/item_status.dart';
import 'package:deehelp/features/itens/domain/usecases/upload/create_item_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("givenAValidValues_whenInstantiateANewItem_shouldReturnCorrectValues",
      () {
    final dto = CreateItemDto(
        userId: "any",
        imageUrl: "any",
        name: "any",
        code: "any",
        year: 0000,
        type: "any");
    final item = Item.from(dto);
    expect(item.name, dto.name);
    expect(item.status, ItemStatus.pending);
  });
}
