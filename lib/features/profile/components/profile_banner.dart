import 'package:flutter/material.dart';

import '../../../core/components/images/ui_network_image_with_loader.dart';

class ProfileBanner extends StatelessWidget {
  const ProfileBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.symmetric(
      //   horizontal: defaultPadding,
      //   vertical: defaultPadding * 1.5,
      // ),
      padding: EdgeInsets.all(0),
      child: GestureDetector(
        onTap: () {},
        child: const AspectRatio(
          aspectRatio: 1.8,
          child:
              UINetworkImageWithLoader(src: "https://i.imgur.com/dz0BBom.png"),
        ),
      ),
    );
  }
}
