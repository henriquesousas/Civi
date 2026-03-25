import 'dart:ui';
import 'package:flutter/material.dart';

class MapToolbar extends StatelessWidget {
  const MapToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            const TranspToolbar(),
          ],
        ),
      ),
    );
  }
}

class TranspToolbar extends StatelessWidget {
  final VoidCallback? onIncidentsTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onProfileTap;

  const TranspToolbar({
    super.key,
    this.onIncidentsTap,
    this.onSearchTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 8,
      left: 16,
      right: 16,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.4),
              ),
            ),
            child: Row(
              children: [
                /// Incidents dropdown
                InkWell(
                  onTap: onIncidentsTap,
                  borderRadius: BorderRadius.circular(12),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.layers_outlined,
                        size: 18,
                        color: Color(0xFF1F2937),
                      ),
                      SizedBox(width: 6),
                      Text(
                        "Incidents",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xFF111827),
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 18,
                        color: Color(0xFF6B7280),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                /// Search
                _circleButton(
                  icon: Icons.search,
                  onTap: onSearchTap,
                ),

                const SizedBox(width: 8),

                /// Profile
                _circleButton(
                  icon: Icons.person_outline,
                  onTap: onProfileTap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _circleButton({
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 20,
          color: const Color(0xFF111827),
        ),
      ),
    );
  }
}
