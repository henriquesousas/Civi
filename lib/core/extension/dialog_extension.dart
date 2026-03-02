import 'dart:async';

import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

enum DialogType { success, error, normal }

extension DialogExtension on BuildContext {
  Future<bool> showQuestionDialog(
    String title,
    String message, {
    String textConfirmButton = "SIM",
    String textCancelButton = "NÃO",
  }) async {
    final result = await showDialog<bool>(
      context: this,
      builder: (ctx) => AlertDialog(
        backgroundColor: Theme.of(this).colorScheme.surfaceContainer,
        title: Text(
          title,
          // style: appTextStyles.sectionTitle,
        ),
        content: Text(
          message,
          // style: appTextStyles.bodyTextStyle1.copyWith(
          //   color: AppColors.textTertiary,
          // ),
        ),
        actions: [
          TextButton(
            child: Text(
              textCancelButton,
              // style: appTextStyles.buttonTextStyle1.copyWith(
              //   color: AppColors.primaryColor,
              // ),
            ),
            onPressed: () => Navigator.of(ctx).pop(false),
          ),
          TextButton(
            child: Text(
              textConfirmButton,
              // style: appTextStyles.buttonTextStyle1.copyWith(
              //   color: AppColors.primaryColor,
              // ),
            ),
            onPressed: () => Navigator.of(ctx).pop(true),
          ),
        ],
      ),
    );

    return result ?? false;
  }

  void showDilaog(String title, String message) {
    showDialog(
      context: this,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void showSnackBar(String message, {DialogType type = DialogType.success}) {
    Color bgColor = AppColors.green;

    if (type == DialogType.normal) {
      bgColor = onSurface;
    } else if (type == DialogType.error) {
      bgColor = AppColors.danger;
    }

    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          // style: appTextStyles.sectionTitle3.copyWith(
          //   color: AppColors.whiteColor,
          // ),
        ),
        backgroundColor: bgColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class TopNotice {
  static OverlayEntry? _entry;
  static Timer? _timer;

  static void show(
    BuildContext context, {
    required String message,
    DialogType type = DialogType.success,
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    // fecha se já existir
    dismiss();

    final theme = Theme.of(context);
    final mq = MediaQuery.of(context);

    Color bg;
    IconData icon;

    switch (type) {
      case DialogType.error:
        bg = const Color(0xFFDC2626); // red-600
        icon = Icons.error_outline_rounded;
        break;
      case DialogType.normal:
        bg = const Color(0xFF111827); // gray-900
        icon = Icons.info_outline_rounded;
        break;
      case DialogType.success:
      default:
        bg = const Color(0xFF16A34A); // green-600
        icon = Icons.check_circle_outline_rounded;
        break;
    }

    _entry = OverlayEntry(
      builder: (_) => _TopNoticeWidget(
        topPadding: mq.padding.top,
        message: message,
        background: bg,
        icon: icon,
        textStyle: theme.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        actionLabel: actionLabel,
        onAction: onAction,
        onClose: dismiss,
      ),
    );

    Overlay.of(context, rootOverlay: true).insert(_entry!);

    _timer = Timer(duration, dismiss);
  }

  static void dismiss() {
    _timer?.cancel();
    _timer = null;
    _entry?.remove();
    _entry = null;
  }
}

class _TopNoticeWidget extends StatefulWidget {
  final double topPadding;
  final String message;
  final Color background;
  final IconData icon;
  final TextStyle? textStyle;
  final String? actionLabel;
  final VoidCallback? onAction;
  final VoidCallback onClose;

  const _TopNoticeWidget({
    required this.topPadding,
    required this.message,
    required this.background,
    required this.icon,
    required this.textStyle,
    required this.actionLabel,
    required this.onAction,
    required this.onClose,
  });

  @override
  State<_TopNoticeWidget> createState() => _TopNoticeWidgetState();
}

class _TopNoticeWidgetState extends State<_TopNoticeWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<Offset> _slide;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
      reverseDuration: const Duration(milliseconds: 200),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, -0.35),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);

    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _close() async {
    if (!mounted) return;
    await _ctrl.reverse();
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    final top = widget.topPadding + 12;

    return Material(
      color: Colors.transparent,
      child: SafeArea(
        bottom: false,
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: top, left: 16, right: 16),
            child: SlideTransition(
              position: _slide,
              child: FadeTransition(
                opacity: _fade,
                child: _NoticeCard(
                  background: widget.background,
                  icon: widget.icon,
                  message: widget.message,
                  textStyle: widget.textStyle,
                  actionLabel: widget.actionLabel,
                  onAction: () async {
                    widget.onAction?.call();
                    await _close();
                  },
                  onClose: _close,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NoticeCard extends StatelessWidget {
  final Color background;
  final IconData icon;
  final String message;
  final TextStyle? textStyle;
  final String? actionLabel;
  final VoidCallback onAction;
  final VoidCallback onClose;

  const _NoticeCard({
    required this.background,
    required this.icon,
    required this.message,
    required this.textStyle,
    required this.actionLabel,
    required this.onAction,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose, // tap fecha (bem iOS)
      child: Container(
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              blurRadius: 22,
              offset: Offset(0, 10),
              color: Color(0x33000000),
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 22),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: textStyle,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (actionLabel != null && actionLabel!.trim().isNotEmpty) ...[
              const SizedBox(width: 10),
              TextButton(
                onPressed: onAction,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  actionLabel!,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ],
            const SizedBox(width: 4),
            IconButton(
              onPressed: onClose,
              icon: const Icon(Icons.close_rounded),
              color: Colors.white,
              iconSize: 18,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            ),
          ],
        ),
      ),
    );
  }
}

extension TopNoticeExtension on BuildContext {
  void showTopNotice(
    String message, {
    DialogType type = DialogType.success,
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    TopNotice.show(
      this,
      message: message,
      type: type,
      duration: duration,
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }
}
