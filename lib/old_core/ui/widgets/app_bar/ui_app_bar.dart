import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class UIAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;
  final TextStyle? textStyle;
  const UIAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.centerTitle = false,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leadingWidth: leading != null ? null : 0,
      centerTitle: centerTitle,
      elevation: 0,
      title: Text(
        title,
        style: textStyle ??
            context.appTextStyles.appBarTitle.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
      // title: Text(
      //   "$pageTitle",
      // style: context.appTextStyles.appBarTitle.copyWith(
      //   fontWeight: FontWeight.w600,
      // ),
      // ),
      leading: leading,
      actions: actions,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
