import '../../../core/domain/exception/app_exception.dart';

class ProductException extends AppException {
  ProductException({
    required super.message,
    super.stackTrace,
  });

  factory ProductException.from(final String message) {
    return ProductException(message: message);
  }
}
