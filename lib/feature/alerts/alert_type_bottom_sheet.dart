import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AlertTypeBottomSheet {
  static Future<void> show(
    BuildContext context, {
    required VoidCallback onSuspiciousTap,
    required VoidCallback onRobberyTap,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return _AlertTypeContent(
          onRobberyTap: onRobberyTap,
          onSuspiciousTap: onSuspiciousTap,
        );
      },
    );
  }
}

class _AlertTypeContent extends StatelessWidget {
  final VoidCallback onSuspiciousTap;
  final VoidCallback onRobberyTap;
  const _AlertTypeContent({
    required this.onSuspiciousTap,
    required this.onRobberyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      decoration: BoxDecoration(
        color: context.primaryBgCard,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        border: Border.all(color: context.outlineVariantColor),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Handle
            Container(
              width: 40.w,
              height: 4,
              decoration: BoxDecoration(
                color: context.outlineVariantColor,
                borderRadius: BorderRadius.circular(999),
              ),
            ),

            const SizedBox(height: 16),

            /// Title
            Text(
              'Criar alerta',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.primaryTextColor,
                  ),
            ),

            const SizedBox(height: 6),

            Text(
              'Escolha o tipo de alerta que deseja reportar',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: context.secondaryTextColor,
                  ),
            ),

            const SizedBox(height: 20),

            /// Cards
            Row(
              children: [
                Expanded(
                  child: _AlertCard(
                    title: 'Atividade suspeita',
                    description:
                        'Movimentação estranha ou comportamento suspeito',
                    icon: Icons.visibility_rounded,
                    iconColor: const Color(0xFF2B5BEE),
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceContainerLow,
                    onTap: () {
                      context.pop();
                      onSuspiciousTap();
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _AlertCard(
                    title: 'Roubo ou tentativa',
                    description:
                        'Assalto, abordagem,quebra de vidro de veículo ou furto',
                    icon: Icons.warning_amber_rounded,
                    iconColor: const Color(0xFFFF8A00),
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceContainerLow,
                    onTap: () {
                      context.pop();
                      onRobberyTap();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AlertCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  /// Nova abordagem
  final Color? iconColor;
  final Color? backgroundColor;

  const _AlertCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final bgColor = backgroundColor ?? colorScheme.surfaceContainerLow;

    final iconBaseColor = iconColor ?? colorScheme.primary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: colorScheme.outlineVariant,
            ),
            color: bgColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Icon container
              Container(
                width: 46.w,
                height: 46.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: iconBaseColor.withOpacity(0.12),
                ),
                child: Icon(
                  icon,
                  color: iconBaseColor,
                  size: 20.w,
                ),
              ),

              const SizedBox(height: 12),

              /// Title
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSurface,
                    ),
              ),

              const SizedBox(height: 6),

              /// Description
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.4,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
