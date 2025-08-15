import 'package:flutter/material.dart';
import 'package:yousafe/app/localization/image_config.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/app/theme/size_config.dart';
import 'package:yousafe/features/bottom_view/state/bottom_navigation_state.dart';
import 'package:yousafe/features/bottom_view/components/ui_nav_item.dart';

class UIBottomNavigationBar extends StatelessWidget {
  final BottomNavigationState state;
  const UIBottomNavigationBar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final items = [
      (ImageConfig.homeFill, ImageConfig.home, "Home"),
      (ImageConfig.bookingFill, ImageConfig.booking, "Veículos"),
      (ImageConfig.favoriteFill, ImageConfig.favoriteThin, "Salvos"),
      (ImageConfig.profileFill, ImageConfig.profile, "Conta"),
    ];

    return Container(
      height: SizeConfig.height64,
      // margin: const EdgeInsets.only(
      //   left: SizeConfig.padding24,
      //   right: SizeConfig.padding24,
      //   bottom: SizeConfig.padding10,
      // ),
      padding: const EdgeInsets.symmetric(
        horizontal: SizeConfig.padding07point,
      ),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(SizeConfig.borderRadius136),
        color: AppColors.bottomNavigationBar,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          final (selectedPath, unselectedPath, title) = items[index];
          return UINaviItem(
            selectedImage: Image(
              image: AssetImage(selectedPath),
              width: SizeConfig.width22,
              color: AppColors.bottomNavigationSelected,
            ),
            unselectedImage: Image(
              image: AssetImage(unselectedPath),
              width: SizeConfig.width20,
              color: AppColors.greyColor,
            ),
            state: state,
            index: index,
            title: title,
          );
        }),
      ),
    );
  }
}
