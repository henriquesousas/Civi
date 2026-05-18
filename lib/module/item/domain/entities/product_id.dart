import '../../../../business/_shared/utils/id_utils.dart';
import '../../../../old_core/valueobject/identifier.dart';

class ProductId extends Identifier {
  ProductId(super.value);

  factory ProductId.from(String value) {
    return ProductId(value);
  }

  factory ProductId.unique() {
    return ProductId(IdUtils.generate());
  }
}
