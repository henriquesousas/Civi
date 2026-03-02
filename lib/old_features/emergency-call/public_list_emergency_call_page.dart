import 'package:deehelp/old_core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/old_core/utils/url_launcher_utils.dart';
import 'package:deehelp/old_features/emergency-call/contact_item_row.dart';
import 'package:deehelp/old_features/emergency-call/public_contact_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PublicListEmergencyCallPage extends StatelessWidget {
  const PublicListEmergencyCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return UICustomScaffold(
      pageTitle: "Chamadas de emergência",
      onBackButtonTap: () {
        context.pop();
      },
      body: ListView.builder(
        itemCount: PublicContactModel.defaultContact().length,
        itemBuilder: (context, index) {
          final contact = PublicContactModel.defaultContact()[index];
          return ContactItemRow(
            contact: contact,
            press: () => UrlLauncherUtils.makePhoneCall(contact.phone),
          );
        },
      ),
    );
  }
}
