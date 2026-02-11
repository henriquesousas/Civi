import 'package:deehelp/old_features/products/domain/entities/product.dart';
import 'package:deehelp/old_features/products/domain/entities/product_id.dart';
import 'package:deehelp/old_features/products/product_status.dart';

final _shimmer = Product(
  id: ProductId.unique(),
  name: "shimmershimmer",
  code: "shimmer",
  year: 0000,
  images: const [],
  status: ProducStatus.active,
  type: "shimmer",
  userId: "shimmer",
  color: "shimmer",
  brand: "shimmer",
  obs: "shimmer",
);

final productListShimmer = List.generate(10, (index) => _shimmer);
