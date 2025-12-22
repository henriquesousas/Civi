import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/features/profile/components/profile_content.dart';
import 'package:deehelp/features/profile/components/profile_header.dart';
import 'package:deehelp/features/profile/components/profile_logout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  final VoidCallback? onBackButtonPress;
  const ProfilePage({super.key, this.onBackButtonPress});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final name = user?.displayName ?? '';
    final email = user?.email ?? '';
    final imageUrl = user?.photoURL ?? '';
    return UICustomScaffold(
      hideAppBar: false,
      pageTitle: "Meus dados",
      // assetBackButton: R.svg.close,
      onBackButtonTap: () => context.pop(),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(
              name: name,
              email: email,
              imageUrl: imageUrl,
            ),
            const ProfileContent(),
            const ProfileLogout(),
          ],
        ),
      ),
    );
  }
}
