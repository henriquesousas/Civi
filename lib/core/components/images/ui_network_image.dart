import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';

class UINetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  const UINetworkImage(
      {super.key, required this.imageUrl, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.percentWidth(0.25),
      height: height ?? context.percentWidth(0.25),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 3.0,
        ),
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          // width: width ?? 100,
          // height: height ?? 100,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox.shrink();
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
