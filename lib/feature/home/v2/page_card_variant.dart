import 'package:deehelp/core/theme/size/radius_size.dart';
import 'package:flutter/material.dart';

enum PageCardVariant {
  /// padrão para a maioria das seções da home
  soft,

  /// destaque (hero, card principal, floating)
  elevated,

  /// lista/agrupador (quase sem “cara de card”)
  flat,

  /// totalmente transparente, só para agrupar layout
  ghost,
}

class PageCardV2 extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;

  /// Mantido por compatibilidade: se true, usa estilo elevated.
  final bool isFloating;

  /// Cor de fundo opcional (override).
  final Color? bgColor;

  /// Novo: variante de superfície
  final PageCardVariant variant;

  /// Novo: borda (por padrão, leve)
  final bool showBorder;

  /// Novo: raio (padrão = xl)
  final double? radius;

  const PageCardV2({
    super.key,
    required this.child,
    this.padding,
    this.bgColor,
    this.isFloating = false,
    this.variant = PageCardVariant.soft,
    this.showBorder = true,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final r = radius ?? RadiusSize.xl;

    // "Soft white" e "tinted surface" para reduzir cansaço visual
    const softSurface = Color(0xFFF8FAFF);
    const flatSurface = Color(0xFFF5F7FD);
    const borderColor = Color(0xFFE6EAF6);

    // Se isFloating=true, força elevated
    final effectiveVariant = isFloating ? PageCardVariant.elevated : variant;

    final Color background = bgColor ??
        switch (effectiveVariant) {
          PageCardVariant.elevated => Colors.white,
          PageCardVariant.soft => softSurface,
          PageCardVariant.flat => flatSurface,
          PageCardVariant.ghost => Colors.transparent,
        };

    final List<BoxShadow> shadow = switch (effectiveVariant) {
      PageCardVariant.elevated => const [
          BoxShadow(
            color: Color(0x1F2B5BEE),
            blurRadius: 28,
            spreadRadius: 1,
            offset: Offset(0, 14),
          ),
        ],
      PageCardVariant.soft => const [
          // sombra bem discreta (menos “muro de cards”)
          BoxShadow(
            color: Color(0x0D0B1220),
            blurRadius: 14,
            offset: Offset(0, 10),
          ),
        ],
      PageCardVariant.flat => const [],
      PageCardVariant.ghost => const [],
    };

    final border = showBorder && effectiveVariant != PageCardVariant.ghost
        ? Border.all(color: borderColor, width: 1)
        : null;

    return Container(
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(r),
        border: border,
        boxShadow: shadow,
      ),
      child: child,
    );
  }
}
