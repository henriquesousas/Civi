import 'package:deehelp/core/ui/image/ui_network_image.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

class CollapsingTitle extends StatelessWidget {
  final String title;
  final String photoUrl;
  const CollapsingTitle(
      {super.key, required this.title, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    // 1. Acessa as configurações do FlexibleSpaceBar pai
    final settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();

    if (settings == null) {
      // Retorna um widget vazio se não estiver dentro de um FlexibleSpaceBar
      return const SizedBox.shrink();
    }

    // 2. Calcula a taxa de expansão/colapso

    // Altura mínima (pinned height) da barra
    final double minExtent = settings.minExtent;
    // Altura máxima (expanded height) da barra
    final double maxExtent = settings.maxExtent;
    // Altura atual da barra
    final double currentExtent = settings.currentExtent;

    // Taxa de contração (Contraction Factor):
    // 0.0 = totalmente expandido
    // 1.0 = totalmente colapsado
    final double collapseFactor =
        (maxExtent - currentExtent) / (maxExtent - minExtent);

    // 3. Define a opacidade:
    // Queremos que a opacidade seja 0 quando expandido (fator 0.0) e 1 quando colapsado (fator 1.0)
    final double opacity = collapseFactor.clamp(0.0, 1.0);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: opacity,
        child: Row(
          spacing: 5,
          children: [
            const SizedBox(width: 5),
            UINetworkImage(
              imageUrl: photoUrl,
              width: 60,
              height: 60,
            ),
            Text(
              "Paulo Liberato",
              style: context.textRegular.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
