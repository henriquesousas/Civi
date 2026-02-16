import 'package:deehelp/core/errors/failure.dart';

class DeleteImageFailure extends Failure {
  const DeleteImageFailure({
    String message = "Não foi possível deletar a imagem :(",
  }) : super(message);
}
