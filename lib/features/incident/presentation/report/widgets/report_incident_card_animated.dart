import 'package:flutter/material.dart';

class ReportIncidentCardAnimated extends StatelessWidget {
  final Widget child;
  final double opacity;
  final double? height;
  const ReportIncidentCardAnimated({
    super.key,
    required this.child,
    this.height,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          height: height,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: opacity,
            child: child,
          ),
        ),
      ),
    );
  }
}
