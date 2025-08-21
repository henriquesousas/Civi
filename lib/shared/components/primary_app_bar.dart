import 'package:flutter/material.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  const PrimaryAppBar({super.key, required this.title, this.leading});

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
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
