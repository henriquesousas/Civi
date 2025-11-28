import 'package:flutter/material.dart';

import '../../theme/dimens.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    this.height,
    this.width,
    this.layer = 1,
    this.radius = Dimens.defaultPadding,
  });

  final double? height, width;
  final int layer;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      // padding: const EdgeInsets.all(defaultPadding / 2),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: Theme.of(context)
              .iconTheme
              .color!
              .withValues(alpha: 0.04 * layer),
          borderRadius: BorderRadius.all(Radius.circular(radius))),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({super.key, this.size = 24});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      // padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        // color: Theme.of(context).primaryColor.withOpacity(0.04),
        color: Theme.of(context).iconTheme.color!.withValues(alpha: 0.04),
        shape: BoxShape.circle,
      ),
    );
  }
}
