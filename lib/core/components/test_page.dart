import 'package:deehelp/core/components/app_main_submit_button.dart';
import 'package:deehelp/core/components/custom_main_transaction_list_tile_card.dart';
import 'package:deehelp/core/components/profile_image_with_upload_button_widget.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/core/widgets/buttons/ui_category_button.dart';
import 'package:deehelp/core/widgets/buttons/ui_elevated_button.dart';
import 'package:deehelp/core/widgets/buttons/ui_elevated_icon_button.dart';
import 'package:deehelp/core/widgets/buttons/ui_hold_confirm_button.dart';
import 'package:deehelp/core/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/core/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return UICustomScaffold(
      pageTitle: " Transacion history",
      onBackButtonTap: () {},
      actionButton: [],
      body: UICustomAppCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHoldConfirmButton(
              onProgressCompleted: () async {},
              onApiCall: () async {},
              onProgressChange: (_) {},
            ),
            UICategoryButton(text: "Clique aqui ", press: () {}),
            AppMainSubmitButton(
              text: "Confiramr",
              onTap: () {},
              isActive: true,
            ),
            SizedBox(height: 10),
            //
            Text("Transaction history",
                style: context.appTextStyles.appBarTitle),
            Text("Transaction history",
                style: context.appTextStyles.buttonTextStyle1),
            Text("Transaction history",
                style: context.appTextStyles.sectionTitle3),

            Text(
              "Transaction history",
              style: context.appTextStyles.sectionSubTitle1.copyWith(
                color: Color(0xFF1E293B),
              ),
            ),

            Text("Transaction history",
                style: context.appTextStyles.bodyTextStyle1),

            Text("Transaction history",
                style: context.appTextStyles.caption1Style),

            Text("Transaction history",
                style: context.appTextStyles.caption2Style),

            //
            SizedBox(height: 10),

            UIElevatedIconButton(
              icon: const Icon(
                Icons.add,
                color: AppColors.whiteColor,
              ),
              text: "dadsasdsdsadsa",
              onTap: () {},
            ),
            UIElevatedButton(
              shadowColor: Colors.black,
              radius: 200,
              width: context.percentWidth(0.5),
              text: "Confiramr",
              onTap: () {},
              isLoading: false,
              elevation: 0,
              icon: Icon(
                Icons.add,
                color: AppColors.primaryColorDark,
              ),
              bgColor: Colors.white,
              textColor: AppColors.primaryColorDark,
              borderColor: AppColors.primaryColorDark,
            ),

            const ProfileImageWithUploadButtonWidget(
              imageUrl:
                  "https://blog.portalpos.com.br/wp-content/uploads/2023/07/pessoa-autentica.jpg",
              imageAlt: "Alt",
            ),
            Flexible(
              fit: FlexFit.loose,
              child: ListView.builder(
                physics: const ClampingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: 50,
                itemBuilder: (context, index) {
                  return const CustomMainTransactionListTileCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
