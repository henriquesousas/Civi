import 'package:deehelp/ui/profile/widgets/profile_avatar.dart';
import 'package:deehelp/ui/profile/widgets/profile_banner.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const ProfileBanner(),
        Positioned(
          right: 18,
          top: 18,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ),
        const Positioned(
          bottom: -50,
          left: 0,
          right: 0,
          child: Center(
            child: ProfileAvatar(),
          ),
        ),
      ],
    );
  }
}
