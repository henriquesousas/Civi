import 'package:deehelp/old_core/extension/color_extension.dart';
import 'package:deehelp/old_core/extension/size_extension.dart';
import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class UIButtonPrimary extends StatelessWidget {
  final String text;
  final VoidCallback? press;
  final bool loading;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  const UIButtonPrimary({
    super.key,
    required this.press,
    required this.text,
    this.width,
    this.loading = false,
    this.height,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? ButtonSize.xs,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? const Color(0xFFB8CDE3),
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 32),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(SizeRadius.xl),
            ),
          ),
        ).copyWith(
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: AppTextSizes.button,
            ),
          ),
        ),
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
        color: textColor ?? Colors.black,
      ),
    );
  }

  Widget _cirucularProgressIndicator(BuildContext context) {
    return SizedBox(
      height: CiruclarProgressIndicatorSize.xs,
      width: CiruclarProgressIndicatorSize.xs,
      child: CircularProgressIndicator(
        color: context.isDark() ? Colors.white : context.surfaceColor,
      ),
    );
  }
}
