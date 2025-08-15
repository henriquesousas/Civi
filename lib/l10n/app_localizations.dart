import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Raze'**
  String get appName;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Aguarde...'**
  String get loading;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Versão'**
  String get version;

  /// No description provided for @splashContent.
  ///
  /// In en, this message translates to:
  /// **'Segurança Colaborativa na Palma da Mão'**
  String get splashContent;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Começar'**
  String get start;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Próximo'**
  String get next;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Voltar'**
  String get back;

  /// No description provided for @jump.
  ///
  /// In en, this message translates to:
  /// **'Pular'**
  String get jump;

  /// No description provided for @buttonEnter.
  ///
  /// In en, this message translates to:
  /// **'Entrar'**
  String get buttonEnter;

  /// No description provided for @buttonClickHere.
  ///
  /// In en, this message translates to:
  /// **'Clique aqui'**
  String get buttonClickHere;

  /// No description provided for @onboardingTitleOne.
  ///
  /// In en, this message translates to:
  /// **'Bem vindo'**
  String get onboardingTitleOne;

  /// No description provided for @onboardingDescriptionOne.
  ///
  /// In en, this message translates to:
  /// **'Proteção em tempo real. Relate ocorrências e ajude a manter todos seguros.'**
  String get onboardingDescriptionOne;

  /// No description provided for @onboardingTitleTwo.
  ///
  /// In en, this message translates to:
  /// **'Ajuda Rápida'**
  String get onboardingTitleTwo;

  /// No description provided for @onboardingDescriptionTwo.
  ///
  /// In en, this message translates to:
  /// **'Escolha o tipo de ocorrência - Furto, Roubo, Violência ou Emergência. Respostas adequadas para cada situação de risco.'**
  String get onboardingDescriptionTwo;

  /// No description provided for @onboardingTitleThree.
  ///
  /// In en, this message translates to:
  /// **'Alertas tempo real'**
  String get onboardingTitleThree;

  /// No description provided for @onboardingDescriptionThree.
  ///
  /// In en, this message translates to:
  /// **'Fique por dentro das ocorrências próximas a você e acompanhe atualizações instantaneamente, onde quer que esteja.'**
  String get onboardingDescriptionThree;

  /// No description provided for @onboardingTitleFour.
  ///
  /// In en, this message translates to:
  /// **'Segurança'**
  String get onboardingTitleFour;

  /// No description provided for @onboardingDescriptionFour.
  ///
  /// In en, this message translates to:
  /// **'Todas as ocorrências passam por verificação e cada alerta é monitorado para manter você informado e seguro'**
  String get onboardingDescriptionFour;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Bem-vindo!'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Faça login e continue acompanhando as ocorrências na sua região.'**
  String get loginSubtitle;

  /// No description provided for @labelTextEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get labelTextEmail;

  /// No description provided for @hintEmail.
  ///
  /// In en, this message translates to:
  /// **'seu email'**
  String get hintEmail;

  /// No description provided for @labelTextPassword.
  ///
  /// In en, this message translates to:
  /// **'Senha'**
  String get labelTextPassword;

  /// No description provided for @hintPassword.
  ///
  /// In en, this message translates to:
  /// **'seu senha'**
  String get hintPassword;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Esqueceu sua senha?'**
  String get forgotPassword;

  /// No description provided for @registerAccountStepPersonal.
  ///
  /// In en, this message translates to:
  /// **'Dados pessoais'**
  String get registerAccountStepPersonal;

  /// No description provided for @registerAccountStepContact.
  ///
  /// In en, this message translates to:
  /// **'Contato'**
  String get registerAccountStepContact;

  /// No description provided for @registerAccountSecurity.
  ///
  /// In en, this message translates to:
  /// **'Segurança'**
  String get registerAccountSecurity;

  /// No description provided for @formPersonalDataSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Informações pessoais'**
  String get formPersonalDataSubtitle;

  /// No description provided for @formContactTitle.
  ///
  /// In en, this message translates to:
  /// **'Informações de contato'**
  String get formContactTitle;

  /// No description provided for @formContactSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Como podemos falar com você?'**
  String get formContactSubtitle;

  /// No description provided for @formSecurityTitle.
  ///
  /// In en, this message translates to:
  /// **'Segurança'**
  String get formSecurityTitle;

  /// No description provided for @formSecuritySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Crie uma senha segura'**
  String get formSecuritySubtitle;

  /// No description provided for @tellAboutYou.
  ///
  /// In en, this message translates to:
  /// **'Conte-nos sobre você'**
  String get tellAboutYou;

  /// No description provided for @registerAccountLabelTextName.
  ///
  /// In en, this message translates to:
  /// **'Nome'**
  String get registerAccountLabelTextName;

  /// No description provided for @registerAccountLabelTextSurname.
  ///
  /// In en, this message translates to:
  /// **'Sobrenome'**
  String get registerAccountLabelTextSurname;

  /// No description provided for @registerAccountLabelHintName.
  ///
  /// In en, this message translates to:
  /// **'seu nome'**
  String get registerAccountLabelHintName;

  /// No description provided for @registerAccountLabelHintSurname.
  ///
  /// In en, this message translates to:
  /// **'seu sobrenome'**
  String get registerAccountLabelHintSurname;

  /// No description provided for @registerAccountLabelTextPhone.
  ///
  /// In en, this message translates to:
  /// **'Celular'**
  String get registerAccountLabelTextPhone;

  /// No description provided for @registerAccountLabelHintPhone.
  ///
  /// In en, this message translates to:
  /// **'seu celular'**
  String get registerAccountLabelHintPhone;

  /// No description provided for @registerAccountLabelHintCreatePassword.
  ///
  /// In en, this message translates to:
  /// **'cria uma senha segura'**
  String get registerAccountLabelHintCreatePassword;

  /// No description provided for @registerAccountLabelTextConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirmar senha'**
  String get registerAccountLabelTextConfirmPassword;

  /// No description provided for @registerAccountLabelHintConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'confirmar sua senha'**
  String get registerAccountLabelHintConfirmPassword;

  /// No description provided for @registerAccountAppbar.
  ///
  /// In en, this message translates to:
  /// **'Criar conta'**
  String get registerAccountAppbar;

  /// No description provided for @otpInsertVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Insira o código de verificação'**
  String get otpInsertVerificationCode;

  /// No description provided for @otpWeSentCode.
  ///
  /// In en, this message translates to:
  /// **'Enviamos um código com 6-digitos para o telefone com final'**
  String get otpWeSentCode;

  /// No description provided for @otpResendCode.
  ///
  /// In en, this message translates to:
  /// **'Reenviar código'**
  String get otpResendCode;

  /// No description provided for @otpButtonResendCode.
  ///
  /// In en, this message translates to:
  /// **'Reenviar o código'**
  String get otpButtonResendCode;

  /// No description provided for @otpChangePhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Mudar número de telefone'**
  String get otpChangePhoneNumber;

  /// No description provided for @otpAppBar.
  ///
  /// In en, this message translates to:
  /// **'Verificar número de celular'**
  String get otpAppBar;

  /// No description provided for @welcomeHeader.
  ///
  /// In en, this message translates to:
  /// **'Bem-vindo'**
  String get welcomeHeader;

  /// No description provided for @welcomeAccountCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Conta criada com sucesso! \nVamos ajustar algumas configurações para você começar a relatar ocorrências.'**
  String get welcomeAccountCreatedSuccess;

  /// No description provided for @welcomeOnboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Definir sua localização'**
  String get welcomeOnboardingTitle1;

  /// No description provided for @welcomeOnboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Cadastre seus veículos e aparelhos'**
  String get welcomeOnboardingTitle2;

  /// No description provided for @welcomeOnboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Nascemos agora :)'**
  String get welcomeOnboardingTitle3;

  /// No description provided for @welcomeOnboardingDesc1.
  ///
  /// In en, this message translates to:
  /// **'Precisamos da sua localização para enviar alertas e ocorrências relevantes da sua região em tempo real'**
  String get welcomeOnboardingDesc1;

  /// No description provided for @welcomeOnboardingDesc2.
  ///
  /// In en, this message translates to:
  /// **'Ao cadastrar carros, motos, caminhões e celulares, você poderá relatar ocorrências rapidamente caso algo aconteça.'**
  String get welcomeOnboardingDesc2;

  /// No description provided for @welcomeOnboardingDesc3.
  ///
  /// In en, this message translates to:
  /// **'Estamos evoluindo rapidamente para oferecer mais recursos e tornar seu uso mais fácil e seguros'**
  String get welcomeOnboardingDesc3;

  /// No description provided for @labelAgreeTerms.
  ///
  /// In en, this message translates to:
  /// **'Eu concordo com os Termos e Condições'**
  String get labelAgreeTerms;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
