import 'package:deehelp/core/extension/exports_extension.dart';
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
    this.showBackButton = false,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(74);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // elevation: 10,

      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          // color: const Color(0xFFE6EAF6),
          color: context.outlineVariantColor.withValues(alpha: 0.3),
        ),
      ),
      // scrolledUnderElevation: 0.6,
      // backgroundColor: context.surfaceColor,
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: context.surfaceColor,
      automaticallyImplyLeading: false,
      titleSpacing: 20,
      // iconTheme: const IconThemeData(color: Color(0xFF1F2A44)),
      iconTheme: IconThemeData(color: context.onSurface),
      leading: _getLeading(),
      title: Text(
        title,
        // style: context.appText.headerlg,
        style: const TextStyle(
          color: Colors.white,
          // fontSize: context.safeSp(18),
          fontWeight: FontWeight.w700,
          letterSpacing: -0.6,
          height: 1.05,
        ),
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
              Icons.arrow_back_ios_new_rounded,
              size: 18,
            ),
          )
        : null;
  }
}
