import 'package:deehelp/core/errors/failure.dart';

class ImagePickerFailure extends Failure {
  final bool canceled;
  const ImagePickerFailure({
    this.canceled = false,
    String message = 'Desculpe tivemos um problema, tente novamente !!!',
  }) : super(message);
}
