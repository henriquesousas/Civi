import 'package:deehelp/core/errors/failure.dart';

class UploadImageFailure extends Failure {
  const UploadImageFailure({
    String message = "Não foi possível fazer upload da image :(",
  }) : super(message);
}
