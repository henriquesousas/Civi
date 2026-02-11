import 'package:deehelp/old_core/ui/widgets/image/ui_my_network_image_widget.dart';
import 'package:flutter/material.dart';

class ProfileBanner extends StatelessWidget {
  const ProfileBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const AspectRatio(
        aspectRatio: 1.8,
        child:
            UIMyNetworkImageWidget(imageUrl: "https://i.imgur.com/dz0BBom.png"),
      ),
    );
  }
}
