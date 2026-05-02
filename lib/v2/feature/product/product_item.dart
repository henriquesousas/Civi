import 'package:deehelp/v2/feature/product/product_status.dart';
import 'package:deehelp/v2/feature/product/product_type.dart';

class ProductItem {
  final String title;
  final String subtitle;
  final ProductStatus status;
  final ProductType type;

  const ProductItem({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.type,
  });
}
