import 'package:deehelp/app/theme/app_colors_v2.dart';
import 'package:deehelp/app/theme/size_config.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

class UITextField extends StatelessWidget {
  final String? hint;
  final Widget? suffix;
  final TextEditingController? textEditingController;

  const UITextField({
    super.key,
    this.hint,
    this.textEditingController,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height70,
      width: context.screenWidth,
      padding: const EdgeInsets.only(
        left: SizeConfig.padding20,
        right: SizeConfig.padding20,
        top: SizeConfig.padding11,
        bottom: SizeConfig.padding11,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
        color: AppColorsV2.secondaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hint ?? "",
            style: context.getTextStyle.regular,
          ),
          SizedBox(
            height: SizeConfig.height30,
            child: TextField(
              controller: textEditingController,
              cursorColor: AppColorsV2.primaryColor,
              // focusNode: textEditingController,
              style: context.getTextStyle.regular,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: hint,
                hintStyle: context.getTextStyle.small.copyWith(
                  color: AppColorsV2.textSecondary,
                ),
                // hintStyle: TextStyle(
                //   fontSize: FontSize.body2,
                //   fontFamily: FontFamily.lexendRegular,
                //   fontWeight: FontWeight.w400,
                //   color: darkModeController.isLightTheme.value
                //       ? ColorsConfig.textColor
                //       : ColorsConfig.modeInactiveColor,
                // ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                suffix: suffix,
              ),
              onChanged: (value) {
                // if (value.isEmpty) {
                //   editProfileController.focusNode.unfocus();
                // }
              },
              onSubmitted: (value) {
                // if (value.isEmpty) {
                //   editProfileController.focusNode.unfocus();
                // }
              },
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
          )
        ],
      ),
    );
  }
}
