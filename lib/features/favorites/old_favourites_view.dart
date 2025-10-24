import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:deehelp/app/localization/image_config.dart';
import 'package:deehelp/app/localization/string_config.dart';
import 'package:deehelp/app/theme/app_colors.dart';
import 'package:deehelp/app/theme/size_config.dart';
import 'package:deehelp/features/favorites/components/ui_favourite_card.dart';
import 'package:deehelp/features/favorites/favourite_model.dart';

class OldFavouritesView extends StatelessWidget {
  const OldFavouritesView({super.key});

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
            top: SizeConfig.padding10,
            left: SizeConfig.padding10,
          ),
          child: Text(
            StringConfig.favourites,
            style: context.getTextStyle.medium,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: SizeConfig.padding24,
              left: SizeConfig.padding24,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Image(
                image: const AssetImage(ImageConfig.search),
                width: SizeConfig.width20,
                height: SizeConfig.height20,
                color: AppColors.primaryColor,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
          top: SizeConfig.padding10,
        ),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: FavouriteModel.getFavourites.length,
          itemBuilder: (context, index) {
            final favourite = FavouriteModel.getFavourites[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: SizeConfig.padding08),
              child: UIFavouriteCard(favouriteModel: favourite),
            );
          },
        ),
      ),
    );
  }
}
