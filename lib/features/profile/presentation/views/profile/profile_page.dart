import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/features/profile/presentation/views/profile/widgets/profile_content.dart';
import 'package:deehelp/features/profile/presentation/views/profile/widgets/profile_header.dart';
import 'package:deehelp/features/profile/presentation/views/profile/widgets/profile_logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerWidget {
  final VoidCallback? onBackButtonPress;
  const ProfilePage({super.key, this.onBackButtonPress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return UICustomScaffold(
      padding: EdgeInsets.zero,
      hideAppBar: false,
      pageTitle: "Meus dados",
      onBackButtonTap: () => context.pop(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  ProfileHeader(),
                  ProfileContent(),
                  ProfileLogout(),
                  // SizedBox(height: Dimens.size64),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
