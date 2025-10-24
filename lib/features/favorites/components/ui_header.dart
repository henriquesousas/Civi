import 'package:flutter/material.dart';
import 'package:deehelp/features/favorites/components/ui_verification_flag.dart';
import 'package:deehelp/features/favorites/favourite_model.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';

class UIHeader extends StatelessWidget {
  final FavouriteModel favourite;
  const UIHeader({super.key, required this.favourite});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            width: context.screenWidth,
            // height: context.percentHeight(0.15),
            favourite.image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 5,
          right: 0,
          child: UIVerificationFlag(isVerified: favourite.isVerified),
        ),
      ],
    );
  }
}
