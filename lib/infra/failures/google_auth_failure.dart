import 'package:deehelp/infra/failures/exports.dart';

final class GoogleAuthFailure extends Failure {
  const GoogleAuthFailure([String? message])
      : super(message ?? 'Falha ao autenticar com o Google. Tente novamente.');
}
