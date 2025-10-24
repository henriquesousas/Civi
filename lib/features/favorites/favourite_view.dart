import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:deehelp/app/localization/image_config.dart';
import 'package:deehelp/app/localization/string_config.dart';
import 'package:deehelp/app/router/router_config.dart';
import 'package:deehelp/app/theme/app_colors.dart';
import 'package:deehelp/app/theme/app_font_size.dart';
import 'package:deehelp/app/theme/app_fonts.dart';
import 'package:deehelp/app/theme/size_config.dart';
import 'package:deehelp/features/favorites/components/ui_favourite_card.dart';
import 'package:deehelp/features/favorites/favourite_model.dart';
import 'package:deehelp/shared/components/buttons/primary_button.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  final isSeach = false;

  @override
  Widget build(BuildContext context) {
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
              Text(
                "Salvos",
                style: context.getTextStyle.medium,
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 22,
            crossAxisSpacing: 1,
            mainAxisExtent: context.percentHeight(0.2),
          ),
          itemCount: FavouriteModel.getFavourites.length,
          itemBuilder: (context, index) {
            final favorite = FavouriteModel.getFavourites[index];
            return UIFavouriteCard(
              favouriteModel: favorite,
              onTap: () {
                context.push(Routes.productDetail);
              },
            );
          },
        ),
        // child: ListView.builder(
        //   shrinkWrap: true,
        //   physics: BouncingScrollPhysics(),
        //   itemCount: FavouriteModel.getFavourites.length,
        //   itemBuilder: (context, index) {
        //     final favorite = FavouriteModel.getFavourites[index];
        //     return Padding(
        //       padding: const EdgeInsets.only(left: 16, right: 16, bottom: 6),
        //       child: UIFavouriteCard(
        //         favouriteModel: favorite,
        //         onTap: () {
        //           context.push(Routes.productDetail);
        //         },
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
