// ignore_for_file: must_be_immutable

import 'package:deehelp/old_core/ui/widgets/badge/export_badge.dart';
import 'package:deehelp/old_core/base/entity.dart';
import 'package:deehelp/module/item/domain/entities/product_id.dart';

import '../../../../business/_shared/validation/validation_handler.dart';
import '../usecases/add/dtos/add_product_dto.dart';
import 'image_media.dart';

//TODO: Refactor
class Product extends Entity<ProductId> {
  @override
  final ProductId id;
  String name;
  final String code;
  final int year;
  final ItemStatus status;
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
    // createdAt =  DateTime.now();
  }

  Product copyWith({
    String? name,
    String? code,
    int? year,
    ItemStatus? status,
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
      status: ItemStatus.pending,
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
  Product changeColor(final String value) => copyWith(color: value);
  Product changeType(final String value) => copyWith(type: value);
  Product changeName(final String value) => copyWith(name: value);
  Product changeCode(final String value) => copyWith(code: value);
  Product changeYear(final String value) => copyWith(year: int.parse(value));
  Product removeImage(int index) {
    final newImages = List<ImageMedia>.from(images);
    if (index >= 0 && index < newImages.length) {
      newImages.removeAt(index);
      images = newImages;
    }
    return this;
  }

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
