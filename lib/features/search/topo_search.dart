import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/widgets/textfield/ui_text_field_rounded.dart';
import 'package:flutter/material.dart';

class TopoSearch extends StatelessWidget {
  const TopoSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: context.topPadding + 8,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.textSecondary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: UITextFieldRounded(
              borderRadius: 90,
              fillColor: Colors.transparent, // Colors.grey[100],
              borderColor: Colors.transparent, //Colors.grey[300],
              focusBorderColor: Colors.transparent, //Colors.grey[600],
              borderType: InputBorderType.none,
              showLabelText: false,
              labelText: "",
              hintText: "Ex: ABC-1234 ou Toyota Corolla",
              suffixIcon: const Icon(
                Icons.close,
                color: AppColors.textSecondary,
              ),
              hintStyle: context.appTextStyles.bodyTextStyle2.copyWith(
                color: AppColors.textSecondary,
              ),
              textStyle: context.appTextStyles.bodyTextStyle2.copyWith(
                color: AppColors.textColorBody,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
