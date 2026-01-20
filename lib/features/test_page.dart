import 'package:deehelp/core/ui/extensions/dialog_extension.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return UICustomScaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: UIElevatedButton(
          text: "Text",
          press: () => context.showSnackBar("teste"),
        ),
      ),
    );
  }
}
