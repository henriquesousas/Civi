import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

class CardGradient extends StatelessWidget {
  final Color? baseColor;
  final VoidCallback? onMainTap;
  final VoidCallback? onSecondTap;
  final VoidCallback? onThirdTap;

  const CardGradient({
    super.key,
    this.baseColor,
    this.onMainTap,
    this.onSecondTap,
    this.onThirdTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onMainTap,
            child: UISoftGradientCardLight(
              height: context.isPortrait
                  ? context.percentHeight(0.2)
                  : context.percentHeight(0.65),
              padding: const EdgeInsets.all(LayoutSpacingSize.card),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HighlightIcon(
                    icon: Icon(
                      Icons.map_outlined,
                      size: IconSizes.lg,
                      color: baseColor ?? context.primaryColor(),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Mapa de ocorrências',
                    style: context.appText.headersm.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: SpacingSize.xs),
                  Text(
                    'Veja incidentes próximos a você',
                    style: context.appText.body.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: SpacingSize.sm),
        Expanded(
          child: Column(
            children: [
              GestureDetector(
                onTap: onSecondTap,
                child: UISoftGradientCardLight(
                  height: context.isPortrait
                      ? context.percentHeight(0.09)
                      : context.percentHeight(0.3),
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      HighlightIcon(
                        icon: Icon(
                          Icons.campaign_outlined,
                          size: IconSizes.lg,
                          color: baseColor ?? context.primaryColor(),
                        ),
                      ),
                      const SizedBox(width: SpacingSize.md),
                      Expanded(
                        child: Text(
                          'Minhas ocorrências',
                          style: context.appText.body.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: SpacingSize.md),
              GestureDetector(
                onTap: onSecondTap,
                child: UISoftGradientCardLight(
                  height: context.isPortrait
                      ? context.percentHeight(0.09)
                      : context.percentHeight(0.3),
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      HighlightIcon(
                        icon: Icon(
                          Icons.inventory_2_outlined,
                          size: IconSizes.lg,
                          color: baseColor ?? context.primaryColor(),
                        ),
                      ),
                      const SizedBox(width: SpacingSize.md),
                      Expanded(
                        child: Text(
                          'Meus itens',
                          style: context.appText.body.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UISoftGradientCardLight extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double? borderRadius;
  final Color? baseColor;
  final double? width;
  final double? height;

  const UISoftGradientCardLight({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(18),
    this.height,
    this.borderRadius,
    this.baseColor,
    this.width,
  });

  Color _lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  @override
  Widget build(BuildContext context) {
    final ultraLightBlue = _lighten(context.primaryColor(), 0.50);
    final softLightBlue = _lighten(context.primaryColor(), 0.36);

    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [ultraLightBlue, softLightBlue],
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? RadiusSize.lg),
        border: Border.all(color: context.primaryColorOpacity(0.06), width: 1),
        boxShadow: const [AppColors.shadowSoft],
      ),
      child: child,
    );
  }
}
