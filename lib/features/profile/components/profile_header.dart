import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/features/profile/components/profile_pro_indicator_badge.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/components/ui_my_network_image_widget.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/dimens.dart';
import '../../../core/widgets/card/ui_custom_app_card.dart';
import '../../../core/widgets/card/ui_custon_list_tile_card.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  const ProfileHeader({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return UICustomAppCard(
      child: UICustomListTileCard(
        leading: Skeleton.replace(
          replace: true,
          replacement: const Bone.square(size: 80),
          child: UIMyNetworkImageWidget(
            radius: Dimens.defaultRadius,
            imageUrl: FirebaseAuth.instance.currentUser?.photoURL ?? "",
            isProfile: true,
            width: context.responsiveRadius(0.13),
            height: context.responsiveRadius(0.13),
            imageAlt: name,
          ),
        ),
        title: name,
        subtitle: email,
        titleStyle: context.appTextStyles.sectionTitle.copyWith(
          color: AppColors.dark,
        ),
        subtitleStyle: context.appTextStyles.sectionBodyTextStyle.copyWith(
          color: AppColors.textColorBody,
        ),
        showBorder: false,
        trailing: const ProfileProIndicatorBadge(),
        press: () {},
      ),
    );
  }
}
