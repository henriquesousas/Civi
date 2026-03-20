import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:flutter/material.dart';

class WizardBottomBar extends StatelessWidget {
  final int step;
  final bool loading;
  final bool loadingWithoutPicture;
  final VoidCallback? press;
  final VoidCallback? onSaveWithoutPicture;
  final String nextLabel;

  const WizardBottomBar({
    super.key,
    required this.step,
    required this.loading,
    required this.loadingWithoutPicture,
    required this.press,
    required this.nextLabel,
    required this.onSaveWithoutPicture,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: const BoxDecoration(
        // color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          spacing: 10,
          children: [
            if (step == 2) ...[
              Expanded(
                child: ButtonOutline(
                  press: onSaveWithoutPicture ?? () {},
                  loading: loadingWithoutPicture,
                  text: "Salvar sem foto",
                ),
              ),
            ],
            Expanded(
              child: ButtonPrimary(
                press: press,
                loading: loading,
                text: nextLabel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
