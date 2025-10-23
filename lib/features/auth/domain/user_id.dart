import 'package:yousafe/core/domain/utils/id_utils.dart';
import 'package:yousafe/core/domain/valueobjects/identifier.dart';

class UserId extends Identifier {
  UserId(super.value);

  factory UserId.from(String value) {
    return UserId(value);
  }

  factory UserId.unique() {
    return UserId(IdUtils.generate());
  }
}
