import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      // child: AnimatedBuilder(
      //   animation: _statsController,
      //   builder: (context, child) {
      //     return FadeTransition(
      //       opacity: _statsAnimation,
      //       child: ScaleTransition(
      //         scale: _statsAnimation,
      //         child: Row(
      //           children: [],
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
