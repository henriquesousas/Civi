import '../../../../core/utils/id_utils.dart';
import '../../../../core/valueobject/identifier.dart';

class ProductId extends Identifier {
  ProductId(super.value);

  factory ProductId.from(String value) {
    return ProductId(value);
  }

  factory ProductId.unique() {
    return ProductId(IdUtils.generate());
  }
}
