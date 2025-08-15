import 'package:flutter/material.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const PrimaryAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: context.getTextStyle.regularMedium.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
