import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/feature/sos/widgets/row_sos_contact.dart';
import 'package:deehelp/feature/sos/widgets/section_header.dart';
import 'package:deehelp/feature/sos/widgets/sos_contact.dart';
import 'package:deehelp/feature/sos/widgets/sos_header.dart';
import 'package:deehelp/old_core/utils/url_launcher_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SOSPage extends StatelessWidget {
  const SOSPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = SosContact.defaultEmergencyContacts();

    return Scaffold(
      backgroundColor: UIK.bg,
      appBar: DefaultAppBar(
        title: "SOS",
        press: () => context.pop(),
      ),
      body: SafeArea(
        child: ListView(
          padding:
              const EdgeInsets.fromLTRB(UIK.s16, UIK.s16, UIK.s16, UIK.s24),
          children: [
            SosHeaderCard(
              title: 'Contatos de emergência',
              subtitle:
                  'Use apenas em situações reais. Em caso de risco imediato, ligue para o serviço adequado.',
              onTapTips: () {},
            ),
            const SizedBox(height: SpacingSize.lg),
            const SectionHeader(),
            const SizedBox(height: SpacingSize.lg),
            ...contacts.map(
              (c) => Padding(
                padding: const EdgeInsets.only(bottom: UIK.s12),
                child: RowSOSContact(
                  contact: c,
                  onCall: () => UrlLauncherUtils.makePhoneCall(c.phone),
                ),
              ),
            ),
            const SizedBox(height: UIK.s20),
            // _OtherContactsHint(),
          ],
        ),
      ),
    );
  }
}

/// ===============================
/// OUTROS CONTATOS (placeholder)
/// ===============================
// class _OtherContactsHint extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: UIK.surface,
//         borderRadius: BorderRadius.circular(UIK.rCard),
//         border: Border.all(color: UIK.border),
//         boxShadow: const [UIK.shadowSoft],
//       ),
//       padding: const EdgeInsets.all(UIK.s16),
//       child: Row(
//         children: [
//           Container(
//             width: 46,
//             height: 46,
//             decoration: BoxDecoration(
//               color: UIK.primary.withOpacity(0.10),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child:
//                 const Icon(Icons.person_add_alt_1_rounded, color: UIK.primary),
//           ),
//           const SizedBox(width: 12),
//           const Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Adicione contatos confiáveis',
//                   style: TextStyle(fontWeight: FontWeight.w900, color: UIK.ink),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   'Ex: familiar, vizinho, porteiro, segurança do bairro.',
//                   style: TextStyle(
//                     color: UIK.muted,
//                     fontSize: 12.5,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 10),
//           const Icon(Icons.chevron_right_rounded, color: UIK.muted),
//         ],
//       ),
//     );
//   }
// }
