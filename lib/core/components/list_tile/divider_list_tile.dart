import 'package:deehelp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/constants.dart';

class DividerListTile extends StatelessWidget {
  final bool isShowForwardArrow, isShowDivider;
  final Widget title;
  final Widget? leading;
  final double? minLeadingWidth;
  final VoidCallback press;

  const DividerListTile({
    super.key,
    this.isShowForwardArrow = true,
    required this.title,
    required this.press,
    this.leading,
    this.minLeadingWidth,
    this.isShowDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minLeadingWidth: minLeadingWidth,
          leading: leading,
          onTap: press,
          title: title,
          trailing: isShowForwardArrow
              ? Icon(
                  Icons.arrow_forward_ios_rounded,
                  color:
                      Theme.of(context).iconTheme.color!.withValues(alpha: 0.4),
                  size: forwardIconSize,
                )
              : null,
        ),
        if (isShowDivider)
          const Divider(
            height: 1,
            color: AppColors.lightGreyColor20,
          ),
      ],
    );
  }
}

class DividerListTileWithTrailing extends StatelessWidget {
  const DividerListTileWithTrailing({
    super.key,
    required this.svgSrc,
    required this.title,
    required this.trailingText,
    required this.press,
    this.isShowArrow = true,
  });

  final String svgSrc, title, trailingText;
  final VoidCallback press;
  final bool isShowArrow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: press,
          minLeadingWidth: 24,
          leading: SvgPicture.asset(
            svgSrc,
            height: 24,
            width: 24,
            colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!, BlendMode.srcIn),
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 14, height: 1),
          ),
          trailing: SizedBox(
            width: 50,
            child: Row(
              children: [
                const Spacer(),
                Text(trailingText),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color:
                      Theme.of(context).iconTheme.color!.withValues(alpha: 0.4),
                  size: forwardIconSize,
                )
              ],
            ),
          ),
        ),
        if (isShowArrow) const Divider(height: 1),
      ],
    );
  }
}
