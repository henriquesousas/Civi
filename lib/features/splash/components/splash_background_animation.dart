import 'package:flutter/material.dart';

import '../../../app/theme/app_colors_v2.dart';

class SplashBackgroundAnimation extends StatefulWidget {
  final Widget child;
  const SplashBackgroundAnimation({super.key, required this.child});

  @override
  State<SplashBackgroundAnimation> createState() =>
      _SplashBackgroundAnimationState();
}

class _SplashBackgroundAnimationState extends State<SplashBackgroundAnimation>
    with TickerProviderStateMixin {
  late AnimationController _backgroundController;
  late Animation<double> _backgroundAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
    _startAnimation();
  }

  void _initializeAnimation() {
    _backgroundController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    _backgroundAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _backgroundController, curve: Curves.easeInOut),
    );
  }

  void _startAnimation() async {
    _backgroundController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _backgroundAnimation,
      builder: (context, child) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColorsV2.primary,
                AppColorsV2.primaryLight,
                AppColorsV2.secondary,
              ],
              stops: [0.0, 0.6 + (_backgroundAnimation.value * 0.2), 1.0],
            ),
          ),
          child: widget.child,
        );
      },
    );
  }
}
