import 'package:deehelp/features/profile/components/profile_banner.dart';
import 'package:deehelp/features/profile/components/profile_card.dart';
import 'package:deehelp/features/profile/components/profile_logout.dart';
import 'package:deehelp/features/profile/components/profile_preference_card.dart';
import 'package:deehelp/features/profile/components/profile_shared_support_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileCard(
            name: user?.displayName ?? 'sas',
            email: user?.email ?? '',
            photoUrl: FirebaseAuth.instance.currentUser?.photoURL ?? "",
            isPro: true,
            press: () {},
          ),
          const ProfileBanner(),
          const ProfilePreferenceCard(),
          const SizedBox(height: 30),
          const ProfileSharedSupportCard(),
          // const SizedBox(height: defaultPadding / 2),
          const ProfileLogout()
        ],
      ),
    );
  }
}
