import 'package:flutter/material.dart';

class FadeSlideTransitionAnimator extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Curve fadeCurve;
  final Curve slideCurve;
  final Offset slideBeginOffset;
  const FadeSlideTransitionAnimator({
    super.key,
    required this.child,
    this.delay = const Duration(milliseconds: 800),
    this.duration = const Duration(milliseconds: 1000),
    this.fadeCurve = Curves.easeIn,
    this.slideCurve = Curves.easeOutBack,
    this.slideBeginOffset = const Offset(0, 0.5),
  });

  @override
  State<FadeSlideTransitionAnimator> createState() =>
      _FadeSlideTransitionAnimatorState();
}

class _FadeSlideTransitionAnimatorState
    extends State<FadeSlideTransitionAnimator> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),
    );
  }

  void _startAnimations() {
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}
