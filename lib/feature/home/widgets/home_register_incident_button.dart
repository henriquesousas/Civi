import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';

class HomeRegisterIncidentButton extends StatelessWidget {
  final VoidCallback onTap;

  const HomeRegisterIncidentButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsetsGeometry.all(LayoutSpacingSize.card),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: ButtonSize.lg,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusSize.md),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  context.primaryColor.withValues(alpha: 0.95),
                  context.primaryColor.withValues(alpha: 0.85),
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x22000000),
                  blurRadius: 18,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(width: SpacingSize.xl),
                Expanded(
                  child: Text(
                    'Registrar incidente',
                    style: context.appTextOld.body.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  width: IconContainerSizes.md,
                  height: IconContainerSizes.md,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(RadiusSize.md),
                    border:
                        Border.all(color: Colors.white.withValues(alpha: 0.14)),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
