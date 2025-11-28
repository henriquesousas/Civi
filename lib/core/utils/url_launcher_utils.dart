import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class UrlLauncherUtils {
  static final UrlLauncherUtils _instance = UrlLauncherUtils._internal();
  factory UrlLauncherUtils() => _instance;
  UrlLauncherUtils._internal();

  static Future<void> launchWhatsAppSupport(
    BuildContext context,
    String phoneNumber,
    String message,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    // final phoneNumber = "+5511972732245";
    // final message =
    //     "Olá! 👋 Queremos a sua ajuda para melhorar o app DeeHelp. Diga-nos: Qual é a sua dúvida ou sugestão sobre o funcionamento ou segurança? Sua opinião é essencial!";
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
      BuildContext context, String androidAppId, String iOSAppId) async {
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
}
