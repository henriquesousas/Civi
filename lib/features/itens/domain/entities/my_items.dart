import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../item_status.dart';
import '../usecases/create/create_item_dto.dart';

class Item extends Equatable {
  final String id;
  final String name;
  final String code;
  final int year;
  final ItemStatus status;
  final String type;
  final String userId;
  final String brand;
  final String color;
  final String? obs;
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
    required this.color,
    required this.brand,
    required this.obs,
    this.createdAt,
  }) {
    createdAt = DateTime.now();
  }

  factory Item.from(CreateItemDto dto) {
    return Item(
      id: const Uuid().v1(),
      name: dto.name,
      code: dto.code,
      type: dto.type,
      color: dto.color,
      brand: dto.brand,
      obs: dto.obs,
      year: dto.year,
      imageUrl: dto.imageUrl,
      userId: dto.userId,
      status: ItemStatus.pending,
    );
  }

  void changeUrl(final String newUrl) {
    imageUrl = newUrl;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        code,
        year,
        status,
        type,
        userId,
        brand,
        obs,
        imageUrl,
        createdAt
      ];
}
