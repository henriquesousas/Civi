import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShimmerAnimation extends StatelessWidget {
  final Widget child;
  final bool enabled;
  const ShimmerAnimation(
      {super.key, required this.child, required this.enabled});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      enableSwitchAnimation: true,
      ignoreContainers: false,
      containersColor: AppColors.lightGreyColor30,
      effect: const ShimmerEffect(
        baseColor: AppColors.greyColor, //Color(0XFFDADADA),
        highlightColor: AppColors.darkGreyColor10, //Color(0XFFF2F2F2),
        duration: Duration(milliseconds: 1300),
      ),
      child: child,
    );
  }
}
