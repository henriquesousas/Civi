import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

class SplashProgressIndicator extends StatelessWidget {
  const SplashProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            width: ProgressIndicatorSizes.splashWidth,
            child: LinearProgressIndicator(
              backgroundColor: Colors.white.withValues(alpha: 0.3),
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.white.withValues(alpha: 0.8),
              ),
              minHeight: ProgressIndicatorSizes.minHeight,
            ),
          ),
          const SizedBox(height: SpacingSize.lg),
          Text(
            "Aguarde...",
            style: context.appText.body.copyWith(
              color: Colors.white.withValues(alpha: 0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
