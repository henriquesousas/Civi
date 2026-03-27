import 'package:flutter/material.dart';

class MapSideActionButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color backgroundColor;
  final double size;
  final String assetPath;

  const MapSideActionButton({
    super.key,
    required this.assetPath,
    this.onTap,
    this.backgroundColor = Colors.white,
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    // final double iconSize = size * 0.5;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(size),
        onTap: onTap,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.14),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Icon(
            Icons.inventory_2_outlined,
          ),
          // child: Center(
          //   child: Image.asset(
          //     assetPath,
          //     width: iconSize,
          //     height: iconSize,
          //     fit: BoxFit.contain,
          //   ),
          // ),
        ),
      ),
    );
  }
}
