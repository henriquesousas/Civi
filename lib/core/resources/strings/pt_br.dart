import 'package:deehelp/core/resources/strings/translation.dart';

class PtBr with TranslationParts implements Translation {
  @override
  String get appName => "DeeHelp";

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
  String get notHaveAccount => "Ainda não tem uma conta ? | Clique aqui";

  @override
  String get or => "Ou";

  @override
  String get password => "Senha";

  @override
  String get warning => "Aviso";

  @override
  String get skip => "Pular";

  @override
  String get version => "Versão";

  @override
  String get exitApp => "Sair";

  @override
  String get waiting => "Aguarde...";

  @override
  String get obs => "Observação";

  @override
  String get cancelRegister => "Cancelar cadastro";

  @override
  String get cancelRegisterMessage =>
      "Sair agora fará você perder todos os dados do cadastro. Confirmar saída?";

  //Onboarding
  //============================================================================
  @override
  String get onboardingWelcomeHead => "Bem vindo";

  @override
  String get onboardingWelcomeBody =>
      "Proteção em tempo real. Relate ocorrências e ajude a manter todos seguros";

  @override
  String get onboardingHelpHead => "Ajuda rápida";

  @override
  String get onboardingHelpBody =>
      "Reportar um incidente (carro roubado, celular, perigo iminente) leva menos de 1 minuto. Sua informação é vital para proteger vizinhos e recuperar bens perdidos.";

  @override
  String get onboardingAlertsRealTimeHead => "Alertas";

  @override
  String get onboardingAlertsRealTimeBody =>
      "Fique por dentro das ocorrências registradas \nna sua região e tome decisões com mais segurança!";

  @override
  String get onboardingSecurityHead => "Segurança";

  @override
  String get onboardingSecurityBody =>
      "Todas as ocorrências passam por verificação e cada alerta é monitorado para manter você informado e seguro";

  //Login
  //============================================================================
  @override
  String get loginWithGoogleError => "Falha na autenticação com o google!";

  @override
  String get loginInvalidCredentialsError => "Login ou senha inválidos!!!";

  @override
  String get loginInfo =>
      "Faça login e continue acompanahando as ocorrências na sua região.";

  @override
  String get enterCreateAccount => "Entrar/Criar conta";

  @override
  String get continueWithoutLogin => "Continuar sem logar";

  // Splash
  //============================================================================
  @override
  String get splashHeadline => "Segurança colaborativa na palma da mão";

  // Profile
  //============================================================================
  @override
  String get preferences => "Preferências";

  @override
  String get faq => "FAQ";

  @override
  String get favorites => "Favoritos";

  @override
  String get help => "Ajuda";

  @override
  String get sharedAndSupport => "Compartilhar e apoiar";

  @override
  String get lastOccurrences => "Útimas ocorrências";

  @override
  String get myItems => "Meus itens";

  @override
  String get search => "Consultar";

  // BottomBar
  //============================================================================
  @override
  String get bottomBarHome => "Discover";

  @override
  String get bottomBarMyItems => "Meus Itens";

  @override
  String get bottomBarProfile => "Profile";

  // Logout
  //============================================================================
  @override
  String get logoutConfirmButton => "Sim, quero sair!";

  @override
  String get logoutExitTitle => "Sair da conta";

  @override
  String get logoutExitMessage =>
      "Tem certeza que deseja sair da sua conta? Você precisará fazer login novamente para acessar o DeeHelp.";

  // Item
  //============================================================================
  @override
  String get appNewItemTitle => "Novo item";

  @override
  String get addNewItem => "Adicionar novo item";

  @override
  String get stepOneHeader => "Qual é o seu produto";

  @override
  String get stepOneBody =>
      "Informe o tipo de produto (carro, moto, celular ou outro). Isso facilita a identificação da sua ocorrência.";

  @override
  String get stepItemDetailHeader => "Informe os detalhes";

  @override
  String get stepItemDetailBody =>
      "Preencha as informações importantes sobre o produto, como modelo, cor, placa ou número de série.";

  @override
  String get errorMessageVehicle => "Placa inválida";

  @override
  String get hintTextVehicleCode => "Número da placa";

  @override
  String get selectColor => "Selecione uma cor";

  @override
  String get selectBrand => "Selecione a marca";

  @override
  String get stepObsHeady => "Alguma obervação ?";

  @override
  String get stepObsBody =>
      "Adicione informações adicionais que possam ajudar, como características únicas ou circunstâncias do ocorrido.";

  @override
  List<String> get itemSteps => [
        "Tipo",
        "Detalhes",
        "Observação",
        "Foto",
      ];
}
