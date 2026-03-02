import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonHold extends StatelessWidget {
  final double progress;
  final bool done;
  final VoidCallback onHoldStart;
  final VoidCallback onHoldCancel;

  const ButtonHold({
    super.key,
    required this.progress,
    required this.done,
    required this.onHoldStart,
    required this.onHoldCancel,
  });

  static const _primary = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (_) => onHoldStart(),
      onLongPressEnd: (_) => onHoldCancel(),
      child: Stack(
        children: [
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: done ? const Color(0xFF43A047) : _primary,
              borderRadius: BorderRadius.circular(18),
            ),
            alignment: Alignment.center,
            child: Text(
              done ? 'Registro concluído' : 'Segure para reportar',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 14,
              ),
            ),
          ),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: done ? 1 : progress.clamp(0, 1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.18),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
