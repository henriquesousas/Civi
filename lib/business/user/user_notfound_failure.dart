import 'package:deehelp/core/failures/exports.dart';

//TODO: Aqui nao é um Failure e sim uma Exception
class UserNotfoundFailure extends Failure {
  const UserNotfoundFailure() : super("Usuário não encontrado");
}
