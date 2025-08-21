import 'package:flutter/material.dart';

class TransitionAnimator extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve curve;

  const TransitionAnimator({
    super.key,
    required this.child,
    this.delay = const Duration(milliseconds: 800),
    this.duration = const Duration(milliseconds: 1000),
    this.curve = Curves.easeIn,
  });

  @override
  State<TransitionAnimator> createState() => _TransitionAnimatorState();
}

class _TransitionAnimatorState extends State<TransitionAnimator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
    _startAnimation();
  }

  void _initializeAnimation() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );
  }

  void _startAnimation() async {
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
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
