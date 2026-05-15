import 'package:uuid/uuid.dart';

class IdUtils {
  static const _uuid = Uuid();

  static String generate() {
    return _uuid.v4();
  }

  static bool isValid(String value) {
    // return value.isNotEmpty && _uuid.parse(value) != null;
    return false;
  }
}
