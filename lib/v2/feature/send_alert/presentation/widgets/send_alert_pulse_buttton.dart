import 'package:flutter/material.dart';

class SenAlertPulseButton extends StatefulWidget {
  final VoidCallback onTap;
  const SenAlertPulseButton({
    super.key,
    required this.onTap,
  });

  @override
  State<SenAlertPulseButton> createState() => _SenAlertPulseButtonState();
}

class _SenAlertPulseButtonState extends State<SenAlertPulseButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _glow;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scale = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _glow = Tween<double>(begin: 20, end: 40).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Transform.scale(
            scale: _scale.value,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.redAccent.withOpacity(0.6),
                    blurRadius: _glow.value,
                    spreadRadius: 8,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFF1F3A),
                      Color(0xFFE00017),
                    ],
                  ),
                  border: Border.all(
                    color: const Color(0xFF9D0011),
                    width: 4,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white70,
                        width: 3,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Enviar\nAlerta',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          height: 1.15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
