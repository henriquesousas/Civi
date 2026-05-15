import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

/**
 * 

final class InvalidCredentialsFailure extends Failure {
  const InvalidCredentialsFailure()
      : super('E-mail ou senha inválidos. Tente novamente.');
}

final class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Erro no servidor. Tente mais tarde.']);
}

final class NetworkFailure extends Failure {
  const NetworkFailure()
      : super('Sem conexão com a internet. Verifique sua rede.');
}

final class UnexpectedFailure extends Failure {
  const UnexpectedFailure([super.message = 'Ocorreu um erro inesperado.']);
}

 */
