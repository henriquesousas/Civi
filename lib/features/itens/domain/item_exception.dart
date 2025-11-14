import '../../../core/domain/exception/app_exception.dart';

class ItemException extends AppException {
  ItemException({
    required super.message,
    super.stackTrace,
  });

  factory ItemException.from(final String message) {
    return ItemException(message: message);
  }
}
