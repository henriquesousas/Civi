import 'package:deehelp/app_name.dart';
import 'package:deehelp/core/extension/date_extension.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class UrlLauncherUtils {
  static final UrlLauncherUtils _instance = UrlLauncherUtils._internal();
  factory UrlLauncherUtils() => _instance;
  UrlLauncherUtils._internal();

  static Future<void> launchWhatsAppSupport({
    required BuildContext context,
  }) async {
    final messenger = ScaffoldMessenger.of(context);
    String? phoneNumber = "+5511972732245";

    final message =
        "Olá! 👋 Queremos a sua ajuda para melhorar o app ${AppName.appName}. Diga-nos: Qual é a sua dúvida? ou é uma sugestão sobre o funcionamento do app? Sua opinião é essencial!";

    try {
      final link = WhatsAppUnilink(
        phoneNumber: phoneNumber,
        text: message,
      );

      await launchUrl(link.asUri());
    } catch (e) {
      final url = 'https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        messenger.showSnackBar(
          const SnackBar(content: Text("Não foi possível abrir o WhatsApp.")),
        );
      }
    }
  }

  static Future<void> launchWhatsIncidentDenunc({
    required BuildContext context,
    required String alertId,
  }) async {
    final messenger = ScaffoldMessenger.of(context);
    String? phoneNumber = "+5511972732245";
    final message =
        """Olá! 👋  Vi a ocorrência no aplicativo ${AppName.appName} que tem o código  $alertId e acredito ter visto algo que pode estar relacionado. Gostaria de compartilhar as informações com você.
        """;

    try {
      final link = WhatsAppUnilink(
        phoneNumber: phoneNumber,
        text: message,
      );

      await launchUrl(link.asUri());
    } catch (e) {
      final url = 'https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        messenger.showSnackBar(
          const SnackBar(content: Text("Não foi possível abrir o WhatsApp.")),
        );
      }
    }
  }

  static Future<bool> launchAppStorePage(
    BuildContext context,
    String androidAppId,
    String iOSAppId,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    String url;

    // Determina a URL baseada na plataforma
    if (Theme.of(context).platform == TargetPlatform.android) {
      url = 'https://play.google.com/store/apps/details?id=$androidAppId';
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      // Exemplo de URL da App Store (substitua pelo seu link real)
      url = 'https://apps.apple.com/app/id$iOSAppId';
    } else {
      messenger.showSnackBar(
        const SnackBar(content: Text('Plataforma não suportada para loja.')),
      );
      return false;
    }

    try {
      if (await launchUrl(Uri.parse(url),
          mode: LaunchMode.externalApplication)) {
        return true;
      } else {
        messenger.showSnackBar(
          const SnackBar(
              content: Text('Não foi possível abrir a loja de aplicativos')),
        );
      }
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text('Erro ao abrir a loja: $e')),
      );
    }
    return false;
  }

  static Future<void> shareMyIncident(
      BuildContext context, String incidentId, DateTime date) async {
    final message = '''
🚨 **ALERTA DE SEGURANÇA** 🚨

Acabei de registrar um incidente de roubo no aplicativo ${AppName.appName}.

🔢 **ID do Caso:** $incidentId
📅 **Registrado em:** ${date.toDateWithFullMonth()}

⚠️ **Estou compartilhando para:**
• Alertar amigos e familiares
• Aumentar a segurança coletiva
• Contribuir com dados confiáveis para a comunidade

📱 **Compartilhado via ${AppName.appName}**
Este app ajuda a manter a comunidade mais segura.
Baixe agora: https://play.google.com/store/apps/details?id=com.seu.app


#SegurançaComunitária #Alerta #Caso$incidentId
''';

    await Share.share(
      message,
      subject: 'Alerta de Segurança - Caso $incidentId',
    );
  }

  static Future<void> shareIncident(
      BuildContext context, String incidentId, DateTime date) async {
    final message = '''
🚨 **ALERTA DE SEGURANÇA** 🚨

  Incidente de roubo registrado no aplicativo ${AppName.appName}.

  🔢 **ID do Caso:** $incidentId
  📅 **Registrado em:** ${date.toDateWithFullMonth()}

  ⚠️ **Estou compartilhando para:**
  • Alertar amigos e familiares
  • Aumentar a segurança coletiva
  • Contribuir com dados confiáveis para a comunidade

  📱 **Compartilhado via ${AppName.appName}**
  Este app ajuda a manter a comunidade mais segura.
  Baixe agora: https://play.google.com/store/apps/details?id=com.seu.app


  #SegurançaComunitária #Alerta #Caso$incidentId
  ''';

    await Share.share(
      message,
      subject: 'Alerta de Segurança - Caso $incidentId',
    );
  }

  static Future<void> shareApp(BuildContext context) async {
    final message = '''

🚨 **TIZZO App** 🚨

Estou usando o aplicativo Tizzo para registrar e acompanhar ocorrências na minha região.

O app ajuda a fortalecer a segurança da comunidade de forma colaborativa.

📲 Baixe e participe:
https://play.google.com/store/apps/details?id=com.seu.app
''';
    await Share.share(
      message,
      subject: 'Conheça o app Tizzo',
    );
  }

  static Future<void> makePhoneCall(String number) async {
    final Uri dialerUri = Uri(scheme: 'tel', path: number);

    if (await canLaunchUrl(dialerUri)) {
      await launchUrl(dialerUri);
      return;
    }

    throw Exception('Could not make the call...');
  }
}
