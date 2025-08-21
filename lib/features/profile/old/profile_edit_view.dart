import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yousafe/app/localization/image_config.dart';
import 'package:yousafe/app/localization/string_config.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/app/theme/size_config.dart';
import 'package:yousafe/shared/components/buttons/primary_button.dart';
import 'package:yousafe/shared/components/ui_textfield.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

import '../components/old/ui_change_mobie_bottom_sheet.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: "Paulo");

    final TextEditingController lastNameController =
        TextEditingController(text: "Henrique");

    final TextEditingController mobileController =
        TextEditingController(text: "(11) 97273-2245");

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(
            left: SizeConfig.padding05,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => context.pop(),
                child: Image(
                  image: const AssetImage(ImageConfig.backArrow),
                  width: SizeConfig.width24,
                  height: SizeConfig.height24,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(width: SizeConfig.width10),
              Text(
                StringConfig.myProfile,
                style: context.getTextStyle.medium,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
          bottom: SizeConfig.padding24,
        ),
        child: PrimaryButton(
          text: StringConfig.textButtonSaveUpdated,
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
          top: SizeConfig.padding24,
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: SizeConfig.height22,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: SizeConfig.height45,
                        // backgroundColor:
                        //     Theme.of(context).colorScheme.onSecondary,
                        backgroundColor: AppColors.bottomNavigationSelected,

                        child: Text(
                          "PH",
                          style: context.getTextStyle.medium.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                      Positioned(
                        right: SizeConfig.width02,
                        bottom: SizeConfig.width10,
                        child: Image.asset(
                          ImageConfig.editImage,
                          width: SizeConfig.width20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              UITextField(
                hint: "Nome",
                textEditingController: nameController,
              ),
              UITextField(
                  hint: "Sobrenome", textEditingController: lastNameController),
              UITextField(
                hint: "Celular",
                suffix: GestureDetector(
                  onTap: () {
                    changeMobileNumberBottomSheet(context, mobileController);
                  },
                  child: Text(
                    StringConfig.change,
                    style: context.getTextStyle.small,
                  ),
                ),
                textEditingController: mobileController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
