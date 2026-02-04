import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

class LocalizationIssuePage extends StatelessWidget {
  final String title;
  final String message;
  final String buttonName;
  final VoidCallback action;
  const LocalizationIssuePage({
    super.key,
    required this.title,
    required this.message,
    required this.buttonName,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.secondaryContainer,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(LayoutSpacingSize.page),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HighlightIcon(
                containerSize: IconContainerSizes.xxl,
                radius: RadiusSize.xl,
                icon: Icon(
                  Icons.location_off_rounded,
                  size: IconSizes.xxl,
                  color: context.primaryColor(),
                ),
              ),
              const SizedBox(height: SpacingSize.xl),
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.appText.headerlg,
              ),
              const SizedBox(height: SpacingSize.md),
              Text(
                message,
                textAlign: TextAlign.center,
                style: context.appText.body.copyWith(
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: SpacingSize.sm),
              Text(
                'Usamos o GPS para mostrar ocorrências próximas, '
                'mapa da região e alertas relevantes para você.',
                textAlign: TextAlign.center,
                style: context.appText.bodySmall,
              ),
              const SizedBox(height: SpacingSize.xl),
              CardHintInfo(
                icon: Icon(
                  Icons.lock_outline,
                  size: IconSizes.sm,
                  color: context.secondaryColor,
                  // color: _muted,
                ),
              ),
              const SizedBox(height: SpacingSize.xxl),
              PrimaryButton(
                press: action,
                text: buttonName,
              ),
              // const SizedBox(height: SpacingSize.md),
              // InlineButton(press: () {}, text: 'Tentar novamente'),
            ],
          ),
        ),
      ),
    );
  }
}
