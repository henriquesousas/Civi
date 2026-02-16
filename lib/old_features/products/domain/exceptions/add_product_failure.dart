import 'package:deehelp/core/errors/failure.dart';

class AddProductFailure extends Failure {
  const AddProductFailure(
      {String message =
          "Não foi possível realizar essa operação, tente novamente mai tarde :("})
      : super(message);
}
