import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/app/theme/size_config.dart';
import 'package:yousafe/features/bottom_view/state/botto_navigation_event.dart';
import 'package:yousafe/features/bottom_view/state/bottom_navigation_bloc.dart';
import 'package:yousafe/features/bottom_view/state/bottom_navigation_state.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

class UINaviItem extends StatelessWidget {
  final int index;
  final Widget selectedImage;
  final Widget unselectedImage;
  final BottomNavigationState state;
  final String title;

  const UINaviItem(
      {super.key,
      required this.selectedImage,
      required this.unselectedImage,
      required this.state,
      required this.index,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final isSelected = state.selectedIndex == index;
    final imageWidget = isSelected ? selectedImage : unselectedImage;

    return InkWell(
      onTap: () {
        if (!isSelected) {
          context.read<BottomNavigationBloc>().add(ChangePageEvent(index));
        }
      },
      child: Container(
        width: SizeConfig.width52,
        height: SizeConfig.height52,
        // decoration: isSelected
        //     ? BoxDecoration(
        //         // shape: BoxShape.circle,
        //         borderRadius: BorderRadius.circular(12),
        //         color: Colors.blue.shade50,
        //       )
        //     : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            imageWidget,
            Text(
              title,
              style: context.getTextStyle.small.copyWith(
                  fontSize: 10,
                  color: isSelected
                      ? AppColors.bottomNavigationSelected
                      : AppColors.greyColor),
            ),
          ],
        ),
      ),
    );
  }
}
