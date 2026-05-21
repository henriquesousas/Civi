import 'package:uuid/uuid.dart';

//TODO: Criar unit test
class IdUtils {
  static const _uuid = Uuid();

  static String generate() {
    return _uuid.v4();
  }

  static bool isValid(String value) {
    try {
      if (value.isEmpty) return false;
      Uuid.parse(value);
      return true;
    } catch (_) {
      return false;
    }
  }
}
