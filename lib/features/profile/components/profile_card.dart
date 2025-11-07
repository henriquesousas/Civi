import 'package:deehelp/core/components/images/ui_network_image_with_loader.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/constants.dart';

class ProfileCard extends StatelessWidget {
  final String name, email, photoUrl;
  final String proLabelText;
  final bool isPro, isShowHi, isShowArrow;
  final VoidCallback? press;

  const ProfileCard({
    super.key,
    required this.name,
    required this.email,
    required this.photoUrl,
    this.proLabelText = "Pro",
    this.isPro = false,
    this.press,
    this.isShowHi = true,
    this.isShowArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: CircleAvatar(
        radius: 28,
        child: UINetworkImageWithLoader(
          photoUrl,
          radius: 100,
        ),
      ),
      title: Row(
        children: [
          Text(
            isShowHi ? name : "",
            style: const TextStyle(fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(width: defaultPadding / 2),
          if (isPro)
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding / 2, vertical: defaultPadding / 4),
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(defaultBorderRadius)),
              ),
              child: Text(
                proLabelText,
                style: const TextStyle(
                  fontFamily: grandisExtendedFont,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: 0.7,
                  height: 1,
                ),
              ),
            ),
        ],
      ),
      subtitle: Text(email),
      trailing: isShowArrow
          ? Icon(
              Icons.arrow_forward_ios_rounded,
              color: Theme.of(context).iconTheme.color!.withValues(alpha: 0.4),
              size: forwardIconSize,
            )
          : null,
    );
  }
}
