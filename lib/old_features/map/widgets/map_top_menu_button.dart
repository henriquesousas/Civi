import 'package:flutter/material.dart';

class MapTopMenuButton extends StatelessWidget {
  final AnimationController animationMenuController;
  final VoidCallback press;
  const MapTopMenuButton(
      {super.key, required this.animationMenuController, required this.press});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 12,
      left: 12,
      child: FadeTransition(
        opacity: animationMenuController,
        child: ScaleTransition(
          scale: animationMenuController,
          child: FloatingActionButton(
            heroTag: 'menu_fab',
            elevation: 3,
            mini: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            onPressed: press,
            child: const Icon(Icons.menu, size: 18),
          ),
        ),
      ),
    );
  }
}
