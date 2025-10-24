import 'package:deehelp/core/domain/utils/id_utils.dart';
import 'package:deehelp/core/domain/valueobject/identifier.dart';

class UserId extends Identifier {
  UserId(super.value);

  factory UserId.from(String value) {
    return UserId(value);
  }

  factory UserId.unique() {
    return UserId(IdUtils.generate());
  }
}
