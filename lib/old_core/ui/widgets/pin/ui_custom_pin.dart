import 'dart:math';
import 'package:flutter/material.dart';

class UICustomPin extends StatelessWidget {
  final double size; // largura total do pin
  final double tailHeight; // altura da pontinha
  final double roundness; // controla o quão "arredondada" é a curva na ponta
  final Color color;
  final Widget icon;
  final BoxShadow? shadow;

  const UICustomPin({
    Key? key,
    this.size = 56,
    this.tailHeight = 10,
    this.roundness = 8,
    this.color = Colors.red,
    required this.icon,
    this.shadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = size + tailHeight;
    return SizedBox(
      width: size,
      height: height,
      child: Stack(
        children: [
          // Sombra por baixo (opcional)
          Positioned.fill(
            child: CustomPaint(
              painter: _PinShadowPainter(shadow: shadow),
            ),
          ),

          // Forma recortada com ícone dentro
          ClipPath(
            clipper: _PinClipper(tailHeight: tailHeight, roundness: roundness),
            child: Container(
              width: size,
              height: height,
              color: color,
              alignment: Alignment(0, -0.12), // desloca um pouquinho pra cima
              child: SizedBox(
                width: size * 0.5,
                height: size * 0.5,
                child: Center(child: icon),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PinClipper extends CustomClipper<Path> {
  final double tailHeight;
  final double roundness;

  _PinClipper({required this.tailHeight, required this.roundness});

  @override
  Path getClip(Size size) {
    final double w = size.width;
    final double h = size.height;
    final double cx = w / 2;

    // raio do "círculo" superior (ajustado para deixar espaço para a ponta)
    final double circleRadius = min(w / 2, (h - tailHeight) / 2);

    // centro do círculo superior
    final Offset center = Offset(cx, circleRadius);

    final Path path = Path();

    // adicionar o círculo superior
    path.addOval(Rect.fromCircle(center: center, radius: circleRadius));

    // Ponto da ponta (tip)
    final Offset tip = Offset(cx, h - 0.0);

    // pontos laterais inferiores (onde a curva encontra o círculo)
    final Offset rightCircleEdge = Offset(cx + circleRadius, center.dy);
    final Offset leftCircleEdge = Offset(cx - circleRadius, center.dy);

    // controlar a "profundidade" do arco antes do tip
    final double ctrlDy = (h - tailHeight) - (circleRadius * 0.25);
    final double controlOffset = roundness.clamp(1.0, circleRadius * 0.8);

    // Desenhar curva do lado direito até a ponta e voltar pelo lado esquerdo
    path.moveTo(rightCircleEdge.dx, rightCircleEdge.dy);
    path.quadraticBezierTo(
      cx + controlOffset, // cx control x (direita)
      ctrlDy, // control y
      tip.dx, // tip x
      tip.dy - (roundness * 0.5), // tip y (ligeiro recuo para arredondar)
    );

    path.quadraticBezierTo(
      cx - controlOffset, // esquerda controle
      ctrlDy, // control y
      leftCircleEdge.dx, // volta para a aresta esquerda do círculo
      leftCircleEdge.dy,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant _PinClipper oldClipper) {
    return oldClipper.tailHeight != tailHeight ||
        oldClipper.roundness != roundness;
  }
}

class _PinShadowPainter extends CustomPainter {
  final BoxShadow? shadow;

  _PinShadowPainter({this.shadow});

  @override
  void paint(Canvas canvas, Size size) {
    final s = shadow ??
        const BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          blurRadius: 6,
          offset: Offset(0, 3),
        );

    final paint = s.toPaint();

    // Desenhar uma elipse sob a base para parecer sombra
    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height - (size.width * 0.08)),
      width: size.width * 0.6,
      height: size.width * 0.18,
    );

    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(covariant _PinShadowPainter oldDelegate) => false;
}
