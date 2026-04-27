import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class FloatingChatBar extends StatelessWidget {
  const FloatingChatBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 18,
      right: 18,
      bottom: context.bottomPadding + 10,
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: Container(
              height: 68,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: const Color(0xFF242424),
                borderRadius: BorderRadius.circular(34),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 14,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Chat · 803',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.campaign,
                color: Colors.white,
                size: SizeIcon.x,
              ),
              Text(
                '4,333',
                style: context.appText.bodyLarger.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
