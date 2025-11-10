import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UIAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool showDefaultLeading;
  const UIAppBar(
      {super.key,
      required this.title,
      this.leading,
      this.actions,
      this.showDefaultLeading = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leadingWidth: showDefaultLeading ? null : 0,
      centerTitle: false,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      elevation: 0,
      leading: showDefaultLeading
          ? IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back),
            )
          : leading,
      actions: actions,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
