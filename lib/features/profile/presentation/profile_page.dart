import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/features/profile/presentation/widgets/profile_content.dart';
import 'package:deehelp/features/profile/presentation/widgets/profile_header.dart';
import 'package:deehelp/features/profile/presentation/widgets/profile_logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerWidget {
  final VoidCallback? onBackButtonPress;
  const ProfilePage({super.key, this.onBackButtonPress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return UICustomScaffold(
      hideAppBar: false,
      pageTitle: "Meus dados",
      // assetBackButton: R.svg.close,
      onBackButtonTap: () => context.pop(),
      body: const SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(),
            ProfileContent(),
            ProfileLogout(),
          ],
        ),
      ),
    );
  }
}
