import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapTopToolbar extends StatelessWidget {
  final String? avatarUrl;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onSettingsTap;

  const MapTopToolbar({
    super.key,
    this.avatarUrl,
    this.onAvatarTap,
    this.onSearchTap,
    this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor = isDark
        ? Colors.black.withValues(alpha: 0.01)
        : Colors.white.withValues(alpha: 0.35);

    final shadowColor = Colors.black.withValues(alpha: isDark ? 0.01 : 0.08);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
          child: Material(
            color: backgroundColor,
            elevation: 0,
            child: SafeArea(
              bottom: false,
              child: SizedBox(
                height: 64,
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    // GestureDetector(
                    //   onTap: onAvatarTap,
                    //   child: CircleAvatar(
                    //     radius: 20,
                    //     backgroundColor: isDark
                    //         ? Colors.white.withValues(alpha: 0.08)
                    //         : const Color(0xFFE5E7EB),
                    //     backgroundImage:
                    //         avatarUrl != null ? NetworkImage(avatarUrl!) : null,
                    //     child: avatarUrl == null
                    //         ? Icon(
                    //             Icons.person,
                    //             color: isDark ? Colors.white70 : Colors.white,
                    //           )
                    //         : null,
                    //   ),
                    // ),
                    const Spacer(),
                    _ToolbarButton(
                      icon: CupertinoIcons.search,
                      onTap: onSearchTap,
                      isDark: isDark,
                    ),
                    // _ToolbarButton(
                    //   icon: Icons.settings_outlined,
                    //   onTap: onSettingsTap,
                    //   isDark: isDark,
                    // ),
                    const SizedBox(width: 12),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ToolbarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final bool isDark;

  const _ToolbarButton({
    required this.icon,
    required this.isDark,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark
        ? Colors.white.withValues(alpha: 0.06)
        : Colors.white.withValues(alpha: 0.92);

    final borderColor =
        isDark ? Colors.white.withValues(alpha: 0.08) : const Color(0xFFE5E7EB);

    final iconColor = isDark ? Colors.white : const Color(0xFF111827);

    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
        child: Ink(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
            border: Border.all(color: borderColor),
          ),
          child: Icon(
            icon,
            size: 22,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
