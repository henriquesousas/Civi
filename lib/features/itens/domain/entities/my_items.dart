import 'package:deehelp/core/domain/entity.dart';
import 'package:deehelp/features/itens/domain/entities/item_id.dart';
import 'package:logging/logging.dart';

import '../../../../core/domain/validation/validation_handler.dart';
import '../../../../core/resources/resources.dart';
import '../item_status.dart';
import '../usecases/create/create_item_dto.dart';

class Item extends Entity<ItemId> {
  static final _logger = Logger("Item");
  final ItemId id;
  String name;
  final String code;
  final int year;
  final ItemStatus status;
  final String type;
  final String userId;
  final String brand;
  final String color;
  String? obs;
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
  }) : super(id) {
    createdAt = DateTime.now();
  }

  Item copyWith({
    String? name,
    String? code,
    int? year,
    ItemStatus? status,
    String? type,
    String? userId,
    String? brand,
    String? color,
    String? obs,
    String? imageUrl,
    DateTime? createdAt,
  }) {
    return Item(
      id: id,
      name: name ?? this.name,
      code: code ?? this.code,
      year: year ?? this.year,
      status: status ?? this.status,
      type: type ?? this.type,
      userId: userId ?? this.userId,
      brand: brand ?? this.brand,
      color: color ?? this.color,
      obs: obs ?? this.obs,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Item.from(CreateItemDto dto) {
    return Item(
      id: ItemId.unique(),
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

  Item changeModel(final String value) {
    final item = copyWith(name: value);

    if (value.isEmpty) {
      item.notification.append("Modelo", "Modelo não pode ser vazio");
    }

    if (value.length < 3) {
      item.notification.append("Modelo", R.strings.errorMessageModel);
    }

    _logger.info("Item: ${notification.getErrors}");
    return item;
  }

  Item changeObs(final String value)  => copyWith(obs: value);

  Item changeBrand(final String value)  =>  copyWith(brand: value);

  //TODO: Nao precisa por enquando deste metodo
  @override
  void validate(ValidationHandler handler) {}

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
