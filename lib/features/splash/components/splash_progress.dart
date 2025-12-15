import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/ui/assets/resources.dart';

class SplashProgress extends StatelessWidget {
  const SplashProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 60.w,
          child: LinearProgressIndicator(
            backgroundColor: Colors.white.withValues(alpha: 0.3),
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white.withValues(alpha: 0.8),
            ),
            minHeight: 3,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          "${R.strings.waiting}...",
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Colors.white.withValues(alpha: 0.7),
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
