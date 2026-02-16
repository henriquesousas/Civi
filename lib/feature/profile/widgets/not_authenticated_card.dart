import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/feature/auth/presentation/auth_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotAuthenticatedCard extends StatelessWidget {
  const NotAuthenticatedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AuthRouter.path),
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        padding: const EdgeInsets.all(RadiusSize.lg),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(RadiusSize.lg),
          boxShadow: const [
            BoxShadow(
              color: Color(0x142B5BEE),
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            ButtonProfile(onTap: () => context.push(AuthRouter.path)),
            const SizedBox(width: SpacingSize.lg),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fazer login",
                    style: context.appText.headermd.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            // const Icon(Icons.chevron_right, color: Color(0xFF8A96C8)),
          ],
        ),
      ),
    );
  }
}
