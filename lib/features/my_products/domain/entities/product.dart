import 'package:deehelp/core/domain/entity.dart';
import 'package:deehelp/features/my_products/domain/entities/product_id.dart';
import 'package:logging/logging.dart';

import '../../../../core/domain/validation/validation_handler.dart';
import '../../../../core/resources/resources.dart';
import '../product_status.dart';
import '../usecases/create/create_product_dto.dart';
import 'image_media.dart';

class Product extends Entity<ProductId> {
  static final _logger = Logger("Item");
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
  ImageMedia? image;
  DateTime? createdAt;

  Product({
    required this.id,
    required this.name,
    required this.code,
    required this.year,
    required this.image,
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
    ImageMedia? image,
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
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Product.from(CreateProductDto dto) {
    return Product(
      id: ProductId.unique(),
      name: dto.name,
      code: dto.code,
      type: dto.type,
      color: dto.color,
      brand: dto.brand,
      obs: dto.obs,
      year: dto.year,
      image: dto.image,
      userId: dto.userId,
      status: ProductSatus.pending,
    );
  }

  void changeImage(ImageMedia image) {
    this.image = image;
  }

  Product changeModel(final String value) {
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
        image,
        createdAt
      ];
}
