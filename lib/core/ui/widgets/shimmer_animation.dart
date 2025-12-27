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
      effect: const ShimmerEffect(
          baseColor: Color(0XFFDADADA),
          highlightColor: Color(0XFFF2F2F2),
          duration: Duration(microseconds: 1300)),
      child: child,
    );
  }
}
