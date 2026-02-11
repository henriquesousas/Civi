import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShimmerAnimation extends StatelessWidget {
  final Widget child;
  final bool enabled;
  const ShimmerAnimation({
    super.key,
    required this.child,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      enableSwitchAnimation: true,
      ignoreContainers: false,
      containersColor: Theme.of(context).colorScheme.outlineVariant,
      // containersColor: AppColors.lightGreyColor30,
      effect: ShimmerEffect(
        // baseColor: AppColors.greyColor, //Color(0XFFDADADA),
        baseColor: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
        highlightColor: AppColors.darkGreyColor10, //Color(0XFFF2F2F2),
        duration: Duration(
          milliseconds: 2000,
        ),
      ),
      child: child,
    );
  }
}
