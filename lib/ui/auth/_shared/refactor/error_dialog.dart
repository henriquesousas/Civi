import 'package:flutter/material.dart';

enum DialogType { success, error, network }

class AppDialog extends StatefulWidget {
  final String? title;
  final String message;
  final DialogType type;
  final VoidCallback? onRetry;

  const AppDialog({
    super.key,
    required this.message,
    required this.type,
    this.title,
    this.onRetry,
  });

  static Future<bool> show(
    BuildContext context, {
    required String message,
    required DialogType type,
    String? title,
    VoidCallback? onRetry,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierColor: Colors.black.withOpacity(0.7),
      barrierDismissible: false,
      builder: (_) => AppDialog(
        title: title,
        message: message,
        type: type,
        onRetry: onRetry,
      ),
    );
    return result ?? false;
  }

  @override
  State<AppDialog> createState() => _AppDialogState();
}

class _AppDialogState extends State<AppDialog>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;
  late final Animation<double> _fadeAnim;

  _DialogConfig get _config => switch (widget.type) {
        DialogType.success => _DialogConfig(
            title: 'Sucesso',
            icon: Icons.check_circle_outline_rounded,
            color: Colors.green.shade400,
            bgColor: Colors.green.shade900.withOpacity(0.25),
            buttonColor: Colors.green.shade700,
          ),
        DialogType.error => _DialogConfig(
            title: widget.title ?? 'Falha',
            icon: Icons.error_outline_outlined,
            color: Colors.red.shade400,
            bgColor: Colors.red.shade900.withOpacity(0.25),
            buttonColor: Colors.red.shade700,
          ),
        DialogType.network => _DialogConfig(
            title: 'Sem conexão',
            icon: Icons.wifi_off_rounded,
            color: Colors.orange.shade400,
            bgColor: Colors.orange.shade900.withOpacity(0.25),
            buttonColor: Colors.orange.shade700,
          ),
      };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _scaleAnim =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = _config;

    return FadeTransition(
      opacity: _fadeAnim,
      child: ScaleTransition(
        scale: _scaleAnim,
        child: Dialog(
          backgroundColor: const Color(0xFF1C1C2E),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _DialogIcon(config: config),
                const SizedBox(height: 20),
                Text(
                  config.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.55),
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    Expanded(
                      child: _DialogButton(
                        label: 'Fechar',
                        onPressed: () => Navigator.of(context).pop(false),
                        outlined: true,
                      ),
                    ),
                    if (widget.onRetry != null) ...[
                      const SizedBox(width: 12),
                      Expanded(
                        child: _DialogButton(
                          label: widget.type == DialogType.success
                              ? 'Continuar'
                              : 'Tentar novamente',
                          color: config.buttonColor,
                          onPressed: () {
                            Navigator.of(context).pop(true);
                            widget.onRetry?.call();
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Config — centraliza visual por tipo
// ---------------------------------------------------------------------------

class _DialogConfig {
  final String title;
  final IconData icon;
  final Color color;
  final Color bgColor;
  final Color buttonColor;

  const _DialogConfig({
    required this.title,
    required this.icon,
    required this.color,
    required this.bgColor,
    required this.buttonColor,
  });
}

// ---------------------------------------------------------------------------
// Ícone estático
// ---------------------------------------------------------------------------

class _DialogIcon extends StatelessWidget {
  final _DialogConfig config;

  const _DialogIcon({required this.config});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: config.bgColor,
        border: Border.all(color: config.color, width: 1.5),
      ),
      child: Icon(config.icon, color: config.color, size: 32),
    );
  }
}

// ---------------------------------------------------------------------------
// Botão
// ---------------------------------------------------------------------------

class _DialogButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool outlined;
  final Color? color;

  const _DialogButton({
    required this.label,
    required this.onPressed,
    this.outlined = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (outlined) {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white54,
          side: const BorderSide(color: Color(0xFF2C2C3E), width: 1.5),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(label),
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
