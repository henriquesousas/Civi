import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseAuthExceptionExtension on FirebaseAuthException {
  String get errorMessage {
    const messages = {
      'user-not-found': 'Nenhum usuário encontrado com este email',
      'wrong-password': 'Senha incorreta',
      'invalid-email': 'Email inválido',
      'user-disabled': 'Esta conta foi desativada',
      'too-many-requests': 'Muitas tentativas. Tente novamente mais tarde',
      'network-request-failed': 'Erro de conexão. Verifique sua internet',
      'email-already-in-use': 'Este email já está em uso. Tente fazer login.',
      'weak-password': 'Senha muito fraca. Use uma senha mais forte.',
      'operation-not-allowed': 'Operação não permitida. Contate o suporte.',
      'invalid-credential': 'Login ou senha inválido!',
    };

    return messages[code] ?? 'Erro de autenticação!: $message';
  }
}
