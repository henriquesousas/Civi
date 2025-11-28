import 'package:deehelp/core/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/features/profile/components/profile_content.dart';
import 'package:deehelp/features/profile/components/profile_header.dart';
import 'package:deehelp/features/profile/components/profile_logout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final name = user?.displayName ?? '';
    final email = user?.email ?? '';
    return UICustomScaffold(
      pageTitle: "Perfil",
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          children: [
            ProfileHeader(name: name, email: email),
            const ProfileContent(),
            const ProfileLogout(),
          ],
        ),
      ),
    );
  }
}
