import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
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
      ignorePointers: false,
      justifyMultiLineText: true,
      containersColor: Theme.of(context).colorScheme.outlineVariant,
      effect: ShimmerEffect(
        baseColor: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
        highlightColor: const Color(0xFF6B7280),
        duration: const Duration(
          milliseconds: 2000,
        ),
      ),
      child: child,
    );
  }
}
