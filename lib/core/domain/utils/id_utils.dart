import 'package:uuid/uuid.dart';

class IdUtils {
  static const _uuid = Uuid();

  static String generate() {
    return _uuid.v4().replaceAll("-", "").trim();
  }
}
