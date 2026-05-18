import 'package:deehelp/old_core/errors/failure.dart';

class ProductAlreadyExistException extends Failure {
  const ProductAlreadyExistException(
      {String message = "Já foi postado uma ocorrência com esse item !"})
      : super(message);
}
