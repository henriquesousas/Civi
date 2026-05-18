import 'package:deehelp/old_core/errors/failure.dart';

class ProductNotFoundException extends Failure {
  const ProductNotFoundException({String message = "Nenhum item encontrado!"})
      : super(message);
}
