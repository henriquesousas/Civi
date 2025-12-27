import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/domain/entities/product_id.dart';
import 'package:deehelp/features/products/domain/product_status.dart';

final _shimmer = Product(
  id: ProductId.unique(),
  name: "shimmer",
  code: "shimmer",
  year: 0000,
  images: const [],
  status: ProductSatus.active,
  type: "shimmer",
  userId: "shimmer",
  color: "shimmer",
  brand: "shimmer",
  obs: "shimmer",
);

final productListShimmer = List.generate(10, (index) => _shimmer);
