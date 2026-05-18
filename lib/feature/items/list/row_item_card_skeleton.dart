import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../old_core/theme/export_theme.dart';

class RowItemCardSkeleton extends StatelessWidget {
  const RowItemCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(RadiusSize.lg),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(RadiusSize.lg),
                child: Bone.square(
                  size: ImageSize.md,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Bone.text(words: 3),
                    const SizedBox(height: SpacingSize.sm),
                    Row(
                      children: [
                        Bone(
                          width: SpacingSize.lg,
                          height: SpacingSize.lg,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        const SizedBox(width: SpacingSize.sm),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Bone.text(words: 2),
                              SizedBox(height: 6),
                              Bone.text(words: 1),
                            ],
                          ),
                        ),
                        Bone(
                          width: IconSizes.md,
                          height: IconSizes.md,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
