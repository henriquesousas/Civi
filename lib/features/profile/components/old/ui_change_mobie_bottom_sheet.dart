import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yousafe/app/localization/image_config.dart';
import 'package:yousafe/app/localization/string_config.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/app/theme/size_config.dart';
import 'package:yousafe/shared/components/buttons/primary_button.dart';
import 'package:yousafe/shared/components/ui_textfield.dart';
import 'package:yousafe/shared/extensions/screen_size_extension.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

changeMobileNumberBottomSheet(
  BuildContext context,
  TextEditingController mobileController,
) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(SizeConfig.borderRadius24),
        topRight: Radius.circular(SizeConfig.borderRadius24),
      ),
      borderSide: BorderSide.none,
    ),
    context: context,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SizedBox(
          height: context.percentHeight(0.35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => {context.pop()},
                child: Center(
                  child: Image(
                    image: AssetImage(ImageConfig.close),
                    width: SizeConfig.width28,
                  ),
                ),
              ),
              // const SizedBox(height: SizeConfig.height18),
              Container(
                height: context.percentHeight(0.3),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(SizeConfig.borderRadius24),
                    topLeft: Radius.circular(SizeConfig.borderRadius24),
                  ),
                  color: AppColors.backgroundColor,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding24,
                        right: SizeConfig.padding24,
                        top: SizeConfig.padding32,
                        bottom: SizeConfig.padding24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringConfig.enterMobileNumber,
                            style: context.getTextStyle.medium,
                          ),
                          const SizedBox(height: SizeConfig.height24),
                          UITextField(
                              hint: "Novo número",
                              textEditingController: mobileController),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: SizeConfig.height94,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              spreadRadius: .1,
                              blurRadius: 15,
                              offset: const Offset(0, -4),
                            ),
                          ],
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: SizeConfig.padding24,
                            right: SizeConfig.padding24,
                            top: SizeConfig.padding18,
                            bottom: SizeConfig.padding24,
                          ),
                          child: PrimaryButton(
                            text: StringConfig.textButtonSendOTPForVerification,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
