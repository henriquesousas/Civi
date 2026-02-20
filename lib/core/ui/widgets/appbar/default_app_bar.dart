import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final VoidCallback press;
  final bool showBackButton;
  final List<Widget>? actions;

  const DefaultAppBar({
    super.key,
    required this.title,
    required this.press,
    this.leading,
    this.showBackButton = true,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(74);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      // toolbarHeight: 74,
      scrolledUnderElevation: 0.6,
      backgroundColor: context.surfaceColor,
      surfaceTintColor: context.surfaceColor,
      automaticallyImplyLeading: false,
      titleSpacing: 20,
      iconTheme: const IconThemeData(color: Color(0xFF1F2A44)),
      leading: _getLeading(),
      title: Text(
        title,
        style: context.appText.headerlg,
      ),
      actions: actions,
    );
  }

  Widget? _getLeading() {
    if (leading != null) return leading!;
    return showBackButton
        ? IconButton(
            onPressed: press,
            icon: const Icon(
              Icons.arrow_back,
            ),
          )
        : null;
  }
}
