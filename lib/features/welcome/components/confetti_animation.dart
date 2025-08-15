import 'package:flutter/material.dart';

import 'confetti_painter.dart';

class ConfettiAnimation extends StatefulWidget {
  const ConfettiAnimation({super.key});

  @override
  State<ConfettiAnimation> createState() => _ConfettiAnimationState();
}

class _ConfettiAnimationState extends State<ConfettiAnimation>
    with TickerProviderStateMixin {
  late Animation<double> _confettiAnimation;
  late AnimationController _confettiController;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    // _mainController = AnimationController(
    //   duration: const Duration(milliseconds: 2000),
    //   vsync: this,
    // );
    //
    _confettiController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    //
    // _cardsController = AnimationController(
    //   duration: const Duration(milliseconds: 1500),
    //   vsync: this,
    // );
    //
    // _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
    //   CurvedAnimation(
    //     parent: _mainController,
    //     curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
    //   ),
    // );
    //
    // _slideAnimation =
    //     Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
    //       CurvedAnimation(
    //         parent: _mainController,
    //         curve: const Interval(0.2, 0.7, curve: Curves.easeOutBack),
    //       ),
    //     );
    //
    // _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
    //   CurvedAnimation(
    //     parent: _mainController,
    //     curve: const Interval(0.3, 0.8, curve: Curves.elasticOut),
    //   ),
    // );

    _confettiAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _confettiController, curve: Curves.easeInOut),
    );

    // _cardsAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
    //   CurvedAnimation(parent: _cardsController, curve: Curves.easeOutBack),
    // );
  }

  void _startAnimations() async {
    // _mainController.forward();

    // Start confetti after main animation
    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) {
      _confettiController.forward();
    }

    // Start cards animation
    // await Future.delayed(const Duration(milliseconds: 400));
    // if (mounted) {
    //   _cardsController.forward();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _confettiAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _confettiAnimation.value,
          child: CustomPaint(
            painter: ConfettiPainter(_confettiAnimation.value),
            size: Size.infinite,
          ),
        );
      },
    );
  }
}
