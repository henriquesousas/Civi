import 'package:flutter/material.dart';

class SlideFadeAnimator extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Curve fadeCurve;
  final Curve slideCurve;
  final Offset slideBeginOffset;
  const SlideFadeAnimator({
    super.key,
    required this.child,
    this.delay = const Duration(milliseconds: 800),
    this.duration = const Duration(milliseconds: 1000),
    this.fadeCurve = Curves.easeIn,
    this.slideCurve = Curves.easeOutBack,
    this.slideBeginOffset = const Offset(0, 0.5),
  });

  @override
  State<SlideFadeAnimator> createState() => _SlideFadeAnimatorState();
}

class _SlideFadeAnimatorState extends State<SlideFadeAnimator>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimation();
  }

  void _initializeAnimations() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _opacityAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.fadeCurve,
    ).drive(Tween<double>(begin: 0.0, end: 1.0));

    _slideAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.slideCurve,
    ).drive(Tween<Offset>(
      begin: widget.slideBeginOffset,
      end: Offset.zero,
    ));
  }

  Future<void> _startAnimation() async {
    await Future.delayed(widget.delay);
    if (mounted) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: widget.child,
      ),
    );
  }
}
