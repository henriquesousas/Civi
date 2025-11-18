import 'package:flutter/material.dart';

class UIImagePlaceHolderWidget extends StatelessWidget {
  final IconData icon;
  const UIImagePlaceHolderWidget({
    super.key,
    this.icon = Icons.image_not_supported_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, color: Colors.grey[500], size: 20),
    );
  }
}
