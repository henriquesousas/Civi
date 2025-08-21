import 'package:flutter/material.dart';

class TransformScaleOpacityAnimator extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final double initialScale;
  final Curve scaleCurve;
  final Curve fadeCurve;
  final double scaleAnimationEnd;
  final double fadeAnimationEnd;

  const TransformScaleOpacityAnimator({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 1000),
    this.initialScale = 0.0,
    this.scaleCurve = Curves.elasticOut,
    this.fadeCurve = Curves.easeIn,
    this.scaleAnimationEnd = 0.7,
    this.fadeAnimationEnd = 0.5,
  });

  @override
  State<TransformScaleOpacityAnimator> createState() =>
      _TransformScaleOpacityAnimatorState();
}

class _TransformScaleOpacityAnimatorState
    extends State<TransformScaleOpacityAnimator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _opacityAnimation;

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

    _scaleAnimation = Tween<double>(
      begin: widget.initialScale,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve:
            Interval(0.0, widget.scaleAnimationEnd, curve: widget.scaleCurve),
      ),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, widget.fadeAnimationEnd, curve: widget.fadeCurve),
      ),
    );
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}
