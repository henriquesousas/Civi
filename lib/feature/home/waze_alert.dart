import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

/// Card estilo Waze (igual a imagem):
/// - Container preto arredondado
/// - Ícone em círculo à esquerda
/// - Título + subtítulo
/// - Botão X no topo direito
/// - Countdown circular à direita (fecha sozinho)
class Wazelert extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback onClosed;

  final String title;
  final String subtitle;

  /// Ex: 50s
  final Duration ttl;

  /// Altura do card (se quiser igual a imagem, 120~140 fica bom)
  final double height;

  const Wazelert({
    super.key,
    required this.onTap,
    required this.onClosed,
    this.title = 'Roubo registrado agora',
    this.subtitle = 'há 12 min • Centro • 1,8 km de você',
    this.ttl = const Duration(seconds: 50),
    this.height = 132,
  });

  @override
  State<Wazelert> createState() => _WazelertState();
}

class _WazelertState extends State<Wazelert>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.ttl,
      value: 1.0,
    )..reverse(from: 1.0);

    _timer = Timer(widget.ttl, () {
      if (mounted) widget.onClosed();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _closeNow() {
    _timer?.cancel();
    widget.onClosed();
  }

  @override
  Widget build(BuildContext context) {
    // cores (bem parecido com o print)
    const bg = Color(0xFF0E1117);
    const outerBorder = Color(0xFF2A2F3A);
    const innerBorder = Color(0xFF303747);

    const ink = Color(0xFFE9EEF9);
    const muted = Color(0xFF9AA6C4);

    const blue = Color(0xFF2B5BEE);
    const danger = Color(0xFFFF4D4D);

    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(26),
          child: Container(
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(26),
              border: Border.all(color: outerBorder, width: 1.2),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            padding: const EdgeInsets.all(14),
            child: Stack(
              children: [
                // Conteúdo principal
                Row(
                  children: [
                    // Ícone à esquerda (círculo com anel)
                    Container(
                      width: 66,
                      height: 66,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF111726),
                        border: Border.all(color: innerBorder, width: 1.2),
                      ),
                      child: Center(
                        child: Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF0B0F1A),
                            border: Border.all(color: innerBorder, width: 1.0),
                          ),
                          child: const Icon(
                            Icons.priority_high_rounded,
                            color: danger,
                            size: 28,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 14),

                    // Textos
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: ink,
                                fontSize: 20,
                                height: 1.05,
                                fontWeight:
                                    FontWeight.w300, // parecido com o Waze
                                letterSpacing: 0.2,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.subtitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: ink,
                                fontSize: 18,
                                height: 1.1,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Countdown circular à direita
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (_, __) {
                        final remaining =
                            (widget.ttl.inSeconds * _controller.value)
                                .clamp(0, widget.ttl.inSeconds.toDouble());
                        final seconds = remaining.ceil();

                        return _CountdownRing(
                          progress: _controller.value, // 1 -> 0
                          seconds: seconds,
                          ringColor: blue,
                          trackColor: innerBorder,
                          textColor: ink,
                        );
                      },
                    ),
                  ],
                ),

                // Botão X topo direito (igual a imagem)
                Positioned(
                  top: 2,
                  right: 2,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _closeNow,
                      borderRadius: BorderRadius.circular(999),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF161B26),
                          border: Border.all(color: innerBorder, width: 1),
                        ),
                        child: const Icon(
                          Icons.close_rounded,
                          size: 20,
                          color: muted,
                        ),
                      ),
                    ),
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

class _CountdownRing extends StatelessWidget {
  final double progress; // 1 -> 0
  final int seconds;

  final Color ringColor;
  final Color trackColor;
  final Color textColor;

  const _CountdownRing({
    required this.progress,
    required this.seconds,
    required this.ringColor,
    required this.trackColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    // Tamanho parecido com o da imagem
    const size = 70.0;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // trilho
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: 1,
              strokeWidth: 6,
              valueColor: AlwaysStoppedAnimation(trackColor),
            ),
          ),
          // progresso (vai “esvaziando”)
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 6,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation(ringColor),
            ),
          ),
          Text(
            '$seconds',
            style: TextStyle(
              color: textColor,
              fontSize: 26,
              fontWeight: FontWeight.w900,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}

/// Wrapper animado:
/// - Entra: de cima -> baixo
/// - Sai: de baixo -> cima (some subindo)
/// - Auto fecha após ttl (ex: 50s)
///
/// Use:
/// AnimatedTopToastCard(
///   child: WazeLikeBlackAlertCard(...),
///   onClosed: () => setState(() => show = false),
/// )
class AnimatedTopToastCard extends StatefulWidget {
  final Widget child;
  final VoidCallback onClosed;

  /// quanto tempo o card fica visível antes de sumir
  final Duration ttl;

  /// duração das animações (entrada e saída)
  final Duration animDuration;

  /// distância de slide (1.0 = altura do próprio card)
  final double slideAmount;

  const AnimatedTopToastCard({
    super.key,
    required this.child,
    required this.onClosed,
    this.ttl = const Duration(seconds: 50),
    this.animDuration = const Duration(milliseconds: 260),
    this.slideAmount = 1.15,
  });

  @override
  State<AnimatedTopToastCard> createState() => _AnimatedTopToastCardState();
}

class _AnimatedTopToastCardState extends State<AnimatedTopToastCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  late final Animation<Offset> _slideIn;
  // late final Animation<Offset> _slideOut;
  late final Animation<double> _fade;

  Timer? _ttlTimer;
  bool _isClosing = false;

  @override
  void initState() {
    super.initState();

    _c = AnimationController(vsync: this, duration: widget.animDuration);

    // Entrada: de cima (-y) até o lugar (0)
    _slideIn = Tween<Offset>(
      begin: Offset(0, -widget.slideAmount),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _c, curve: Curves.easeOutCubic));

    // Saída: do lugar (0) para cima (-y)
    // _slideOut = Tween<Offset>(
    //   begin: Offset.zero,
    //   end: Offset(0, -widget.slideAmount),
    // ).animate(CurvedAnimation(parent: _c, curve: Curves.easeInCubic));

    _fade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _c, curve: Curves.easeOut),
    );

    // começa animando pra dentro
    _c.forward();

    // agenda auto-fechamento
    _ttlTimer = Timer(widget.ttl, _close);
  }

  @override
  void dispose() {
    _ttlTimer?.cancel();
    _c.dispose();
    super.dispose();
  }

  Future<void> _close() async {
    if (_isClosing) return;
    _isClosing = true;
    _ttlTimer?.cancel();

    // aqui fazemos a saída "subindo"
    // para manter a mesma controller, animamos manualmente:
    // 1) coloca controller em 1 (visible)
    // 2) anima de 0->1 usando slideOut (que vai pra cima)
    // Para isso, usamos um AnimatedBuilder com um "mode".
    // Solução simples: fazemos um outro controller? Não precisa:
    // vamos rodar um reverse com slideIn invertido (também sobe).
    // reverse: 1 -> 0 faz Offset ir de 0 para -amount = sobe.
    await _c.reverse();

    if (mounted) widget.onClosed();
  }

  @override
  Widget build(BuildContext context) {
    // Dica: coloque esse widget dentro de um Stack no topo.
    return AnimatedBuilder(
      animation: _c,
      builder: (_, __) {
        // Quando _c está forward: usamos slideIn (descendo)
        // Quando está reverse: slideIn ao contrário (subindo) — perfeito pro "sumir de baixo pra cima"
        final offset = _slideIn.value;

        return FractionalTranslation(
          translation: offset,
          child: Opacity(
            opacity: _fade.value,
            child: GestureDetector(
              // swipe up pra fechar (opcional)
              onVerticalDragEnd: (d) {
                if ((d.primaryVelocity ?? 0) < -200) _close();
              },
              child: Stack(
                children: [
                  // O card original
                  widget.child,

                  // Área invisível no canto superior direito para "fechar"
                  // (se você já tem X dentro do card, pode remover isso)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(999),
                          onTap: _close,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class WazeAlertState {
  final String title;
  final String subtitle;

  const WazeAlertState({
    required this.title,
    required this.subtitle,
  });
}

class WazeAlertController {
  WazeAlertController._();
  static final instance = WazeAlertController._();

  final ValueNotifier<WazeAlertState?> notifier = ValueNotifier(null);

  void show(WazeAlertState alert) => notifier.value = alert;
  void hide() => notifier.value = null;
}

//Fraco
// class AlertVibration {
//   static Future<void> vibrateAlert() async {
//     if (await Vibration.hasVibrator() ?? false) {
//       Vibration.vibrate(
//         pattern: [
//           0, // inicia imediatamente
//           200, // vibra
//           120, // pausa
//           200, // vibra
//           120,
//           400 // vibração final mais forte
//         ],
//       );
//     }
//   }
// }

class AlertVibrationStrong {
  static Future<void> vibrateStrong() async {
    final haVibration = await Vibration.hasVibrator();
    if (haVibration) {
      Vibration.vibrate(
        pattern: [
          0, // começa imediatamente
          400, // vibra forte
          150, // pausa
          400, // vibra forte
          150,
          600 // vibração final longa (alerta)
        ],
        intensities: [
          0,
          255, // máximo
          0,
          255,
          0,
          255
        ],
      );
    }
  }
}

/// CTA para pedir ao usuario para interagir

class WazeLikeCommunityPromptCard extends StatelessWidget {
  final String title;
  final String subtitle;

  /// localização atual
  final String locationLabel;

  final VoidCallback onPrimary;
  final VoidCallback onClose;

  final String primaryLabel;

  const WazeLikeCommunityPromptCard({
    super.key,
    this.title = "Ajude a comunidade",
    this.subtitle = "Viu algo por perto? Um alerta rápido ajuda todos.",
    required this.locationLabel,
    required this.onPrimary,
    required this.onClose,
    this.primaryLabel = "Contribuir",
  });

  static const bg = Color(0xFF0E1117);
  static const border = Color(0xFF2A2F3A);
  static const innerBorder = Color(0xFF303747);

  static const ink = Color(0xFFE9EEF9);
  static const muted = Color(0xFF9AA6C4);

  static const blue = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 90,
        padding: const EdgeInsets.all(12),
        // margin: EdgeInsetsDirectional.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: border, width: 1.2),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 18,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF111726),
                    border: Border.all(color: innerBorder),
                  ),
                  child: const Icon(
                    Icons.campaign_rounded,
                    color: blue,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: ink,
                          fontSize: 15.5,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 2),
                      // Row(
                      //   children: [
                      //     const Icon(
                      //       Icons.location_on_rounded,
                      //       size: 14,
                      //       color: muted,
                      //     ),
                      //     const SizedBox(width: 4),
                      //     Text(
                      //       locationLabel,
                      //       style: const TextStyle(
                      //         color: muted,
                      //         fontSize: 12.6,
                      //         fontWeight: FontWeight.w700,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 3),
                      Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: muted,
                          fontSize: 12.6,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                _PrimaryPill(
                  label: primaryLabel,
                  onTap: onPrimary,
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: onClose,
                borderRadius: BorderRadius.circular(999),
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF161B26),
                    border: Border.all(color: innerBorder),
                  ),
                  child: const Icon(
                    Icons.close_rounded,
                    color: muted,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrimaryPill extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _PrimaryPill({
    required this.label,
    required this.onTap,
  });

  static const blue = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: blue,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
