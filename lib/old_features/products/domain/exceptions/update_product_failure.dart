import 'package:deehelp/core/errors/failure.dart';

class UpdateProductFailure extends Failure {
  const UpdateProductFailure({
    String message =
        "Não foi possível realizar essa operação, tente novamente mais tarde :(",
  }) : super(message);
}
