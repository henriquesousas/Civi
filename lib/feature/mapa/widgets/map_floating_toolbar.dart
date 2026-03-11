import 'dart:ui';
import 'package:flutter/material.dart';

class MapTopToolbar extends StatelessWidget {
  final String? avatarUrl;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onSettingsTap;

  const MapTopToolbar({
    super.key,
    this.avatarUrl,
    this.onAvatarTap,
    this.onNotificationTap,
    this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.14),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
          child: Material(
            color: Colors.white.withValues(alpha: 0.72),
            elevation: 0, // a sombra principal fica no BoxShadow
            child: SafeArea(
              bottom: false,
              child: SizedBox(
                height: 64,
                width: double.infinity,
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: onAvatarTap,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color(0xFFE5E7EB),
                        backgroundImage:
                            avatarUrl != null ? NetworkImage(avatarUrl!) : null,
                        child: avatarUrl == null
                            ? const Icon(Icons.person, color: Colors.white)
                            : null,
                      ),
                    ),
                    const Spacer(),
                    _ToolbarButton(
                      icon: Icons.notifications_none_rounded,
                      onTap: onNotificationTap,
                    ),
                    _ToolbarButton(
                      icon: Icons.settings_outlined,
                      onTap: onSettingsTap,
                    ),
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

  const _ToolbarButton({
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
        child: Ink(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.92),
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFE5E7EB),
            ),
          ),
          child: Icon(
            icon,
            size: 22,
            color: const Color(0xFF111827),
          ),
        ),
      ),
    );
  }
}
