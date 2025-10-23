import 'package:yousafe/features/auth/domain/name.dart';

class SurName extends Name {
  SurName(super.value);

  factory SurName.from(String value) {
    return SurName(value);
  }
}
