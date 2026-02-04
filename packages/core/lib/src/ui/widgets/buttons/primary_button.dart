import 'package:app_core/src/ui/styles/app_styles.dart';
import 'package:flutter/material.dart';

//TODO: Refatorar para ter loading, desabilitado
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  const PrimaryButton({super.key, required this.press, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: press,
        child: Text(
          text,
          style: context.appText.button.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
