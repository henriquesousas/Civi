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
  String get exitApp => "Sair da conta";

  @override
  String get waiting => "Aguarde...";

  @override
  String get obs => "Observação";

  @override
  String get cancelRegister => "Cancelar cadastro";

  @override
  String get cancelRegisterMessage =>
      "Sair agora fará você perder todos os dados do cadastro. Confirmar saída?";

  @override
  String get addPhoto => "Adicionar foto";

  @override
  String get confirm => "Confirmar";

  @override
  String get next => "Próximo";

  @override
  String get goAhead => "Continue";
  @override
  String get defaultMessageError =>
      "Não foi possível realizar essa operação, tente novamente mai tarde :(";

  @override
  String get productDeletedSuccess => "Produto deletado com sucesso";

  @override
  String get productDeleting => "Deletando...";

  @override
  String get userNotFound => "Usuário não encontrado";

  @override
  String get add => "Adicionar";

  @override
  String get productNoFound => "Nenhum item encontrado";

  @override
  String get productMessageEmpty =>
      "Comece adicionando seu primeiro item à plataforma para gerenciar seus veículos, celulares e outros itens";

  @override
  String get brand => "Marca";

  @override
  String get detail => "Detalhes";

  @override
  String get name => "Nome";

  @override
  String get photos => "Fotos";

  @override
  String get plate => "Placa";

  @override
  String get type => "Tipo";

  @override
  String get color => "Color";

  @override
  String get permanentlyDeleteVehicle =>
      "Para deletar esse veículo permanentemente | Clique aqui";

  @override
  String get confirmUpdate => "Confirmar alterações";

  @override
  String get cancel => "Cancelar";

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
  String get faq => "Perguntas frequentes";

  @override
  String get favorites => "Favoritos";

  @override
  String get help => "Ajuda";

  @override
  String get sharedAndSupport => "Compartilhar e apoiar";

  @override
  String get lastOccurrences => "Útimas ocorrências";

  @override
  String get myProducts => "Meus produtos";

  @override
  String get search => "Consultar";

  // BottomBar
  //============================================================================
  @override
  String get bottomBarExplore => "Exlorar";

  @override
  String get bottomBarMyProducts => "Produtos";

  @override
  String get bottomBarProfile => "Profile";

  @override
  String get bottomBarOccurrence => "Ocorrências";

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
  String get addNewItem => "Novo";

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
  String get errorMessageModel => "Modelo inválido";
  @override
  String get errorMessageYear => "Ano inválido";

  @override
  String get hintTextVehicleCode => "Placa";

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
  String get stepAddPhotoHead => "Adicione uma foto";

  @override
  String get stepAddPhotoBody =>
      "Envie uma imagem do produto para facilitar a identificação e tornar seu registro mais completo.";

  @override
  String get stepSummaryHead => "Resumo";

  @override
  String get stepSummaryBody => "Reveja as informações";

  @override
  String get itemRegisterSuccessMessage =>
      "Obrigado pelo cadastro! Todos os produtos passam por verificação interna para sua segurança. Em breve estará disponível.";

  @override
  String get itemRegisterReceiver => "Cadastro recebido";

  @override
  List<String> get createItemSteps =>
      ["Tipo", "Detalhes", "Observação", "Foto"];

  @override
  List<String> get listItems => ["Carro", "Caminhão", "Motocicleta"];

  @override
  String get modelUpdateExample => "Exemplos: Civic, Corolla, Onix, HB20";

  @override
  String get modelUpdateDescription =>
      "Atualize informações do modelo do veículo";

  @override
  String get model => "Modelo";

  @override
  String get obsUpdateExample =>
      "Exemplos: Amassado na porta, Risco na lateral, Parachoque traseiro quebrado";

  @override
  String get obsUpdateDescription =>
      "Adicione observações sobre o estado do veículo";
}
