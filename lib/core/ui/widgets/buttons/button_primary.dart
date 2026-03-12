import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final VoidCallback? press;
  final bool loading;
  final double? width;
  const ButtonPrimary({
    super.key,
    required this.press,
    required this.text,
    this.width,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: ButtonSize.xs,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 32),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(RadiusSize.xl)),
          ),
        ).copyWith(
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: AppTextSizes.button,
            ),
          ),
        ),
        // onPressed: () {
        //   if (!loading) {
        //     press();
        //   }
        // },
        onPressed: press != null
            ? () {
                if (!loading) {
                  press!();
                }
              }
            : null,
        child:
            !loading ? _title(context) : _cirucularProgressIndicator(context),
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      text,
      style: context.appText.button.copyWith(
        color: context.surfaceColor,
      ),
    );
  }

  Widget _cirucularProgressIndicator(BuildContext context) {
    return SizedBox(
      height: CiruclarProgressIndicatorSize.xs,
      width: CiruclarProgressIndicatorSize.xs,
      child: CircularProgressIndicator(
        color: context.surfaceColor,
      ),
    );
  }
}
