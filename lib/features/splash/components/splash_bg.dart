import 'package:deehelp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SplashBg extends StatefulWidget {
  final Widget child;
  const SplashBg({super.key, required this.child});

  @override
  State<SplashBg> createState() => _SplashBgState();
}

class _SplashBgState extends State<SplashBg> with TickerProviderStateMixin {
  late AnimationController _backgroundController;
  late Animation<double> _backgroundAnimation;

  final _startColor = AppColors.primaryColorDark;
  final _middleColor = AppColors.primaryColor;
  final _endColor = AppColors.primaryColorDark;

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
                _startColor,
                _middleColor,
                _endColor,
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
