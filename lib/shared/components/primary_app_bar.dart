import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  const PrimaryAppBar(
      {super.key, required this.title, this.leading, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: context.textMediumSmall.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: leading,
      actions: actions,
      // actions: [
      //
      //   Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //     child: Row(
      //       children: [
      //         TextButton(
      //           onPressed: () {},
      //           child: Text(
      //             "Novo Item",
      //             style: context.getTextStyle.small,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
