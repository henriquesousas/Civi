import '../item_status.dart';
import '../usecases/upload/create_item_dto.dart';

class Item {
  final String id;
  final String name;
  final String code;
  final int year;
  final ItemStatus status;
  final String type;
  final String userId;
  String? imageUrl;
  DateTime? createdAt;

  Item({
    required this.id,
    required this.name,
    required this.code,
    required this.year,
    required this.imageUrl,
    required this.status,
    required this.type,
    required this.userId,
    this.createdAt,
  }) {
    createdAt = DateTime.now();
  }

  factory Item.from(CreateItemDto dto) {
    return Item(
      id: dto.userId,
      name: dto.name,
      code: dto.code,
      type: dto.type,
      year: dto.year,
      imageUrl: dto.imageUrl,
      userId: dto.userId,
      status: ItemStatus.pending,
    );
  }

  void changeUrl(final String newUrl) {
    imageUrl = newUrl;
  }
}
