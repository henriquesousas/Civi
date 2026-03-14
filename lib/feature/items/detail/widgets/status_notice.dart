import 'package:deehelp/core/ui/widgets/badge/status_style.dart';
import 'package:flutter/material.dart';

class ItemStatusNotice extends StatelessWidget {
  final ItemStatus status;

  const ItemStatusNotice({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final data = _getStatusData(status);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: data.backgroundColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: data.borderColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: data.iconBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              data.icon,
              size: 20,
              color: data.iconColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: data.titleColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data.message,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.45,
                    fontWeight: FontWeight.w400,
                    color: data.messageColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _StatusNoticeData _getStatusData(ItemStatus status) {
    switch (status) {
      case ItemStatus.pending:
        return _StatusNoticeData(
          title: 'Em análise',
          message:
              'Este item está em análise pela equipe. Assim que a validação for concluída, o status será atualizado.',
          icon: Icons.schedule_rounded,
          backgroundColor: const Color(0xFF1E1810),
          borderColor: const Color(0xFF4B3A1E),
          iconBackgroundColor: const Color(0xFF3A2C14),
          iconColor: const Color(0xFFFFC857),
          titleColor: Colors.white,
          messageColor: Colors.white.withValues(alpha: 0.72),
        );

      case ItemStatus.active:
        return _StatusNoticeData(
          title: 'Validado',
          message:
              'Este item foi validado pela equipe e está com as informações confirmadas.',
          icon: Icons.verified_rounded,
          backgroundColor: const Color(0xFF101C14),
          borderColor: const Color(0xFF1F4D2C),
          iconBackgroundColor: const Color(0xFF173322),
          iconColor: const Color(0xFF41D17D),
          titleColor: Colors.white,
          messageColor: Colors.white.withValues(alpha: 0.72),
        );

      case ItemStatus.canceled:
        return _StatusNoticeData(
          title: 'Não aprovado',
          message:
              'Este item não foi aprovado pela equipe. Revise as informações enviadas e tente novamente.',
          icon: Icons.error_outline_rounded,
          backgroundColor: const Color(0xFF211214),
          borderColor: const Color(0xFF5A262C),
          iconBackgroundColor: const Color(0xFF3A171C),
          iconColor: const Color(0xFFFF6B6B),
          titleColor: Colors.white,
          messageColor: Colors.white.withValues(alpha: 0.72),
        );

      case ItemStatus.rouberry:
        return _StatusNoticeData(
          title: 'Item reportado como roubado',
          message:
              'Este item foi reportado como roubado. Caso você tenha informações relevantes, entre em contato com as autoridades ou registre um aviso no aplicativo.',
          icon: Icons.warning_amber_rounded,
          backgroundColor: const Color(0xFF211214),
          borderColor: const Color(0xFF5A262C),
          iconBackgroundColor: const Color(0xFF3A171C),
          iconColor: const Color(0xFFFF6B6B),
          titleColor: Colors.white,
          messageColor: Colors.white.withValues(alpha: 0.72),
        );
    }
  }
}

class _StatusNoticeData {
  final String title;
  final String message;
  final IconData icon;
  final Color backgroundColor;
  final Color borderColor;
  final Color iconBackgroundColor;
  final Color iconColor;
  final Color titleColor;
  final Color messageColor;

  _StatusNoticeData({
    required this.title,
    required this.message,
    required this.icon,
    required this.backgroundColor,
    required this.borderColor,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.titleColor,
    required this.messageColor,
  });
}
