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
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: const IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    ProfileHeader(),
                    ProfileContent(),
                    ProfileLogout(),
                    // Center(
                    //   child: Container(
                    //     padding: const EdgeInsets.all(10),
                    //     decoration: BoxDecoration(
                    //       borderRadius:
                    //           const BorderRadius.all(Radius.circular(10)),
                    //       color: AppColors.lightGreyColor30,
                    //       border: BoxBorder.all(
                    //         color: AppColors.lightGreyColor20,
                    //         width: 1,
                    //       ),
                    //     ),
                    //     child: Text(
                    //       "Versão 1.0.0",
                    //       style: context.appTextStyles.caption2Style.copyWith(
                    //         color: AppColors.textColorBody,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
