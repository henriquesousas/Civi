import 'package:deehelp/ui/profile/widgets/badge/profile_badge.dart';
import 'package:deehelp/ui/profile/widgets/profile_header.dart';
import 'package:deehelp/ui/profile/widgets/profile_info.dart';
import 'package:deehelp/ui/profile/widgets/profile_tabs.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(),
              Column(
                spacing: 22,
                children: [
                  ProfileInfo(),
                  ProfileTabs(),
                  ProfileBadge(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
