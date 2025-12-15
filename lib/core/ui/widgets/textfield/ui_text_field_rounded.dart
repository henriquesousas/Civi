import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UITextFieldRounded extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool isRequired;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool forceShowSuffixDesign;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? focusBorderColor;
  final String? Function(String?)? validator;
  final InputBorderType borderType;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? textInputFormatter;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final bool readOnly;
  final bool forceFillColor;
  final bool showLabelText;
  final int maxLine;
  final String? instructions;
  final String? error;
  final Color? borderColor;
  final double borderRadius;

  const UITextFieldRounded(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.controller,
      this.isRequired = false,
      this.focusNode,
      this.nextFocus,
      this.keyboardType = TextInputType.text,
      this.isPassword = false,
      this.forceShowSuffixDesign = false,
      this.prefixIcon,
      this.suffixIcon,
      this.fillColor = Colors.white,
      this.focusBorderColor,
      this.validator,
      this.borderType = InputBorderType.outline, // default border type
      this.maxLength,
      this.textInputAction,
      this.textStyle,
      this.hintStyle,
      this.textInputFormatter,
      this.onTap,
      this.onChanged,
      this.onFieldSubmitted,
      this.contentPadding,
      this.readOnly = false,
      this.forceFillColor = true,
      this.showLabelText = true,
      this.maxLine = 1,
      this.instructions,
      this.error,
      this.borderColor,
      this.borderRadius = 12});

  @override
  State<UITextFieldRounded> createState() => _UITextFieldRoundedState();
}

class _UITextFieldRoundedState extends State<UITextFieldRounded> {
  bool hidePassword = true;
  final GlobalKey<TooltipState> _tooltipKey = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextFormField(
          readOnly: widget.readOnly,
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword ? hidePassword : false,
          maxLength: widget.maxLength,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.textInputFormatter,
          maxLines: widget.maxLine,
          cursorColor: AppColors.textColorBody,
          // style: widget.textStyle ??
          //     context.appTextStyles.sectionBodyTextStyle.copyWith(
          //       color: AppColors.textColorHeader,
          //     ),
          style: context.appTextStyles.sectionBodyTextStyle.copyWith(
            color: AppColors.errorColor,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelStyle:
                context.appTextStyles.sectionBodyTextStyle.copyWith(
              color: AppColors.textColorBody,
            ),
            // error: widget.error != null ? Text(widget.error!) : null,
            errorText: widget.error,
            contentPadding: widget.contentPadding ??
                const EdgeInsetsDirectional.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
            // labelText: widget.showLabelText ? widget.labelText : null,
            labelStyle: context.appTextStyles.sectionSubTitle1.copyWith(
              color: AppColors.textColorBody,
            ),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle ??
                context.appTextStyles.sectionBodyTextStyle.copyWith(
                  color: AppColors.textColorBody.withValues(alpha: 0.8),
                ),
            prefixIcon: widget.prefixIcon,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            // suffixIcon: suffixIcon,
            suffixIcon:
                widget.isPassword && widget.forceShowSuffixDesign == false
                    ? UnconstrainedBox(
                        child: Material(
                          color: Colors.transparent,
                          shape: const CircleBorder(),
                          child: IconButton(
                            focusColor: AppColors.lightGreyColor30.withValues(
                              alpha: 0.01,
                            ),
                            autofocus: false,
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            icon: Icon(
                              hidePassword == true
                                  ? CupertinoIcons.eye_slash
                                  : CupertinoIcons.eye,
                              color: AppColors.textColorBody.withValues(
                                alpha: 0.5,
                              ),
                            ),
                          ),
                        ),
                      )
                    : widget.suffixIcon,
            filled: true,
            fillColor: widget.forceFillColor
                ? widget.fillColor
                : widget.readOnly
                    ? AppColors.dark.withValues(alpha: 0.02)
                    : widget.fillColor,
            border: _getInputBorder(borderRadius: widget.borderRadius),
            enabledBorder: _getInputBorder(
                borderColor: widget.borderColor,
                borderRadius: widget.borderRadius),
            focusedBorder: _getInputBorder(
                isFocused: true,
                color: AppColors.primaryColor,
                borderRadius: widget.borderRadius),
            errorBorder: _getInputBorder(isError: true),
            errorStyle: const TextStyle(color: AppColors.errorColor),
            focusedErrorBorder: _getInputBorder(isFocused: true, isError: true),
          ),
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted ??
              (text) => widget.nextFocus != null
                  ? FocusScope.of(context).requestFocus(widget.nextFocus)
                  : null,
          onChanged: (text) {
            if (widget.onChanged != null) {
              widget.onChanged!(text);
            }
          },
          onTap: widget.onTap,
        ),
        PositionedDirectional(
          top: -9,
          start: 15,
          child: widget.showLabelText
              ? Container(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    color: widget.fillColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Text(
                        widget.labelText,
                        style: context.appTextStyles.sectionSubTitle1.copyWith(
                          color: AppColors.textColorBody,
                        ),
                      ),
                      if (widget.instructions != null) ...[
                        // spaceSide(Dimensions.space5),
                        SizedBox(height: 5),
                        Tooltip(
                          onTriggered: () {},
                          key: _tooltipKey,
                          message: "${widget.instructions}",
                          child: InkWell(
                            onTap: () {
                              _tooltipKey.currentState?.ensureTooltipVisible();
                            },
                            child: const Icon(
                              Icons.info_outline_rounded,
                              size: 18,
                              color: AppColors.textColorBody,
                            ),
                          ),
                        ),
                      ],
                      if (widget.isRequired) ...[
                        // spaceSide(Dimensions.space5),
                        SizedBox(height: 5),
                        Text(
                          "*",
                          style:
                              context.appTextStyles.sectionSubTitle1.copyWith(
                            color: AppColors.errorColor,
                          ),
                        ),
                      ],
                    ],
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }

  InputBorder _getInputBorder({
    bool isFocused = false,
    bool isError = false,
    Color? color,
    Color? borderColor,
    double borderRadius = 12,
  }) {
    switch (widget.borderType) {
      case InputBorderType.outline:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: isError
                ? AppColors.errorColor
                : isFocused
                    ? color ?? AppColors.lightGreyColor30
                    : borderColor ?? AppColors.lightGreyColor30,
            width: 1,
          ),
        );
      case InputBorderType.underline:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: isError
                ? AppColors.errorColor
                : isFocused
                    ? AppColors.lightGreyColor30
                    : AppColors.lightGreyColor30,
            width: 1,
          ),
        );
      case InputBorderType.none:
        return InputBorder.none;
    }
  }
}

// Enum for border types
enum InputBorderType { outline, underline, none }
