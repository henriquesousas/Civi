import 'package:deehelp/core/domain/entity.dart';
import 'package:deehelp/features/products/domain/entities/product_id.dart';

import '../../../../core/domain/validation/validation_handler.dart';
import '../product_status.dart';
import '../usecases/dtos/add_product_dto.dart';
import 'image_media.dart';

//TODO: Refactor
class Product extends Entity<ProductId> {
  final ProductId id;
  String name;
  final String code;
  final int year;
  final ProductSatus status;
  final String type;
  final String userId;
  final String brand;
  final String color;
  String? obs;
  List<ImageMedia> images;
  DateTime? createdAt;

  Product({
    required this.id,
    required this.name,
    required this.code,
    required this.year,
    required this.images,
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

  Product copyWith({
    String? name,
    String? code,
    int? year,
    ProductSatus? status,
    String? type,
    String? userId,
    String? brand,
    String? color,
    String? obs,
    List<ImageMedia>? images,
    DateTime? createdAt,
  }) {
    return Product(
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
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Product.fromDto(AddProductDto dto) {
    return Product(
      id: ProductId.unique(),
      name: dto.name,
      code: dto.code,
      type: dto.type,
      color: dto.color,
      brand: dto.brand,
      obs: dto.obs,
      year: dto.year,
      images: dto.images,
      userId: dto.userId,
      status: ProductSatus.pending,
    );
  }

  void changeImage(List<ImageMedia> images) {
    this.images = images;
  }

  Product changeModel(final String value) {
    final item = copyWith(name: value);

    if (value.isEmpty) {
      item.notification.append("Modelo", "Modelo não pode ser vazio");
    }

    if (value.length < 3) {
      item.notification.append("Modelo", "Modelo inv");
    }

    return item;
  }

  Product changeObs(final String value) => copyWith(obs: value);

  Product changeBrand(final String value) => copyWith(brand: value);

  //TODO: Validar
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
        images,
        createdAt
      ];
}
