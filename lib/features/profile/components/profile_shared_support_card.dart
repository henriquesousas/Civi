// import 'package:deehelp/features/profile/components/profile_box_decoration.dart';
// import 'package:deehelp/features/profile/components/profile_menu_item_list_tile.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:whatsapp_unilink/whatsapp_unilink.dart';
//
// import '../../../core/resources/resources.dart';
// import '../../../core/router/router_constants.dart';
//
// class ProfileSharedSupportCard extends StatelessWidget {
//   const ProfileSharedSupportCard({super.key});
//
//   Future<void> _sendMessageWhatsApp(BuildContext context) async {
//     final messenger = ScaffoldMessenger.of(context);
//     final phoneNumber = "+5511972732245";
//     final message =
//         "Olá! 👋 Queremos a sua ajuda para melhorar o app DeeHelp. Diga-nos: Qual é a sua dúvida ou sugestão sobre o funcionamento ou segurança? Sua opinião é essencial!";
//     try {
//       final link = WhatsAppUnilink(
//         phoneNumber: phoneNumber,
//         text: message,
//       );
//
//       await launchUrl(link.asUri());
//     } catch (e) {
//       final url = 'https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}';
//       if (await canLaunchUrl(Uri.parse(url))) {
//         await launchUrl(Uri.parse(url));
//       } else {
//         messenger.showSnackBar(
//           const SnackBar(content: Text("Não foi possível abrir o WhatsApp.")),
//         );
//       }
//     }
//   }
//
//   Future<void> _openAppStore(BuildContext context) async {
//     final messenger = ScaffoldMessenger.of(context);
//     const androidAppId = 'com.massimobiolcati.irealb';
//     final url = 'https://play.google.com/store/apps/details?id=$androidAppId';
//     try {
//       if (await canLaunchUrl(Uri.parse(url))) {
//         await launchUrl(Uri.parse(url));
//       } else {
//         messenger.showSnackBar(
//           const SnackBar(
//               content: Text('Não foi possível abrir a loja de aplicativos')),
//         );
//       }
//     } catch (e) {
//       messenger.showSnackBar(
//         SnackBar(content: Text('Erro ao abrir a loja: $e')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             R.strings.sharedAndSupport,
//             style: Theme.of(context).textTheme.titleSmall,
//           ),
//           ProfileBoxDecoration(
//             child: Column(
//               children: [
//                 ProfileMenuListTile(
//                   text: "Avaliar DeeHelp",
//                   svgSrc: R.images.svgWishlist,
//                   press: () => _openAppStore(context),
//                 ),
//                 ProfileMenuListTile(
//                   text: "Enviar mensagem",
//                   svgSrc: R.images.svgHelp,
//                   press: () => _sendMessageWhatsApp(context),
//                 ),
//                 ProfileMenuListTile(
//                   text: R.strings.faq,
//                   svgSrc: R.images.svgFaq,
//                   press: () => context.push(RouterConstant.faq),
//                   isShowDivider: false,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
