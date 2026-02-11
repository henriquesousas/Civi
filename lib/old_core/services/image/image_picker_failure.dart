import 'package:deehelp/old_core/errors/failure.dart';

class ImagePickerFailure extends Failure {
  const ImagePickerFailure(
      {String message = 'Não foi possível recuperar a imagem'})
      : super(message);
}
