import 'package:deehelp/old_core/errors/failure.dart';

class DeleteProductFailure extends Failure {
  const DeleteProductFailure({
    String message = "Não foi possível realizar esta operação :(",
  }) : super(message);
}
