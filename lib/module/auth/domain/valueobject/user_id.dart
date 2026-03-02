import 'package:deehelp/old_core/utils/id_utils.dart';
import 'package:deehelp/old_core/valueobject/identifier.dart';

class UserId extends Identifier {
  UserId(super.value);

  factory UserId.from(String value) {
    return UserId(value);
  }

  factory UserId.unique() {
    return UserId(IdUtils.generate());
  }
}
