import '../../../../core/domain/utils/id_utils.dart';
import '../../../../core/domain/valueobject/identifier.dart';

class ItemId extends Identifier {
  ItemId(super.value);

  factory ItemId.from(String value) {
    return ItemId(value);
  }

  factory ItemId.unique() {
    return ItemId(IdUtils.generate());
  }
}
