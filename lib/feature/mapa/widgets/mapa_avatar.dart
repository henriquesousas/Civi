import 'package:deehelp/old_core/theme/export_theme.dart';
import 'package:deehelp/old_core/ui/widgets/avatar/profile_image_with_upload_button_widget.dart';
import 'package:deehelp/old_core/ui/widgets/buttons/button_profile.dart';
import 'package:flutter/widgets.dart';

class MapaAvatar extends StatelessWidget {
  final String? photoUrl;

  const MapaAvatar({super.key, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return photoUrl != null
        ? ProfileImageWithUploadButtonWidget(
            radius: RadiusSize.xxl,
            width: ImageSize.xs,
            height: ImageSize.xs,
            imageUrl: photoUrl!,
            imageAlt: '',
            showBoxShadow: true,
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1,
            ),
            showUploadIcon: false,
            onTap: () {},
          )
        : ButtonProfile(
            onTap: () {},
          );
  }
}
