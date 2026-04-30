import 'package:deehelp/core/extension/size_extension.dart';
import 'package:flutter/material.dart';

class PremiumAlertCard extends StatelessWidget {
  final VoidCallback? onClose;
  final VoidCallback? onPressed;

  const PremiumAlertCard({
    super.key,
    this.onClose,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onClose,
              child: const Icon(
                Icons.close_rounded,
                color: Colors.white,
                size: 34,
              ),
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 70),
                  const _PremiumBadge(),
                  const SizedBox(height: 5),
                  const Text(
                    'Customize your alerts',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      height: 1.05,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Set a custom notification area and choose exactly\n'
                    'the types of alerts you want.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFE8E8E8),
                      fontSize: 18,
                      height: 1.25,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 42,
                    width: context.percentWidth(0.4),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0057FF),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      child: const Text(
                        'Civi Premium',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PremiumBadge extends StatelessWidget {
  const _PremiumBadge();

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [
            Color(0xFFE9D8FF),
            Color(0xFF6BA7FF),
          ],
        ).createShader(bounds);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
        ),
        child: const Text(
          'Premium',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            height: 1,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
        ),
      ),
    );
  }
}
