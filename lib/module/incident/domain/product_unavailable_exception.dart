import 'package:deehelp/old_core/errors/failure.dart';

class ProductUnavailableException extends Failure {
  const ProductUnavailableException()
      : super('Só é possível registrar ocorrências para itens ativos.');
}
