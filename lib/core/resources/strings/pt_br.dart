import 'package:deehelp/core/resources/strings/translation.dart';

class PtBr with TranslationParts implements Translation {
  @override
  String get welcome => "Bem vindo";

  @override
  String get email => "Email";

  @override
  String get enter => "Entrar";

  @override
  String get enterWithGoogle => "Entrar como Google";

  @override
  String get forgotPassword => "Esqueceu sua senha?";

  @override
  String get loginInfo =>
      "Faça login e continue acompanahando as ocorrências na sua região.";

  @override
  String get notHaveAccount => "Ainda não tem uma conta ? | Clique aqui";

  @override
  String get or => "Ou";

  @override
  String get password => "Senha";

  @override
  String get warning => "Aviso";
}
