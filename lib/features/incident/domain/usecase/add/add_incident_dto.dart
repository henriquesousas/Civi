import 'package:deehelp/features/products/domain/entities/product.dart';

class AddIncidentDto {
  final Product product;
  final String userId;

  AddIncidentDto({required this.product, required this.userId});
}
