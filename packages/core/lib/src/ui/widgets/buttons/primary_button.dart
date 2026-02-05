import 'package:app_core/src/theme/size/button_size.dart';
import 'package:app_core/src/theme/size/ciruclar_progress_indicator_size.dart';
import 'package:app_core/src/ui/styles/app_styles.dart';
import 'package:flutter/material.dart';

//TODO: Refatorar para ter loading, desabilitado
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final bool loading;
  const PrimaryButton({
    super.key,
    required this.press,
    required this.text,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ButtonSize.md,
      child: ElevatedButton(
        onPressed: () {
          if (!loading) {
            press();
          }
        },
        child: !loading ? _title(context) : _cirucularProgressIndicator(),
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      text,
      style: context.appText.button.copyWith(
        color: Colors.white,
      ),
    );
  }

  Widget _cirucularProgressIndicator() {
    return SizedBox(
      height: CiruclarProgressIndicatorSize.sm,
      width: CiruclarProgressIndicatorSize.sm,
      child: const CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
