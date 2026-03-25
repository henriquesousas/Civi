import 'dart:ui';
import 'package:deehelp/core/extension/size_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MapTopToolbar extends StatelessWidget {
  final String? avatarUrl;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onSettingsTap;

  const MapTopToolbar({
    super.key,
    this.avatarUrl,
    this.onAvatarTap,
    this.onSearchTap,
    this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor = isDark
        ? Colors.black.withValues(alpha: 0.01)
        : Colors.white.withValues(alpha: 0.35);

    final shadowColor = Colors.black.withValues(alpha: isDark ? 0.01 : 0.08);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
          child: Material(
            color: backgroundColor,
            elevation: 0,
            child: SafeArea(
              bottom: false,
              child: SizedBox(
                height: 64,
                child: Row(
                  children: [
                    // const SizedBox(width: 12),
                    // GestureDetector(
                    //   onTap: onAvatarTap,
                    //   child: CircleAvatar(
                    //     radius: 20,
                    //     backgroundColor: isDark
                    //         ? Colors.white.withValues(alpha: 0.08)
                    //         : const Color(0xFFE5E7EB),
                    //     backgroundImage:
                    //         avatarUrl != null ? NetworkImage(avatarUrl!) : null,
                    //     child: avatarUrl == null
                    //         ? Icon(
                    //             Icons.person,
                    //             color: isDark ? Colors.white70 : Colors.white,
                    //           )
                    //         : null,
                    //   ),
                    // ),
                    const Spacer(),
                    _ToolbarButton(
                      icon: CupertinoIcons.search,
                      onTap: onSearchTap,
                      isDark: isDark,
                    ),
                    // _ToolbarButton(
                    //   // icon: CupertinoIcons.hand_thumbsup,
                    //   icon: Icons.handshake_rounded,
                    //   onTap: () async => showSupportCiviBottomSheet(
                    //     context,
                    //     pixKey: "123",
                    //   ),
                    //   isDark: isDark,
                    // ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> showSupportCiviBottomSheet(
  BuildContext context, {
  required String pixKey,
  VoidCallback? onViewSupporters,
}) {
  final colorBg = const Color(0xFF0B0B0C);
  // final colorCard = Colors.white.withValues(alpha: 0.05);
  final colorBorder = Colors.white.withValues(alpha: 0.08);
  final colorTextPrimary = Colors.white;
  final colorTextSecondary = Colors.white.withValues(alpha: 0.72);
  final colorTextTertiary = Colors.white.withValues(alpha: 0.50);

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return Container(
        decoration: BoxDecoration(
          color: colorBg,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          border: Border.all(color: colorBorder),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.35),
              blurRadius: 36,
              offset: const Offset(0, -12),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 42,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   width: 52.w,
                    //   height: 52.h,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white.withValues(alpha: 0.06),
                    //     borderRadius: BorderRadius.circular(16),
                    //     border: Border.all(color: colorBorder),
                    //   ),
                    //   child: const Icon(
                    //     Icons.volunteer_activism_outlined,
                    //     color: Colors.white,
                    //     size: 24,
                    //   ),
                    // ),
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF4C6FFF).withValues(alpha: 0.22),
                            const Color(0xFF6EA8FF).withValues(alpha: 0.10),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color:
                              const Color(0xFF4C6FFF).withValues(alpha: 0.28),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                const Color(0xFF4C6FFF).withValues(alpha: 0.18),
                            blurRadius: 24,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.volunteer_activism_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fortaleça o Civi Osasco',
                            style: TextStyle(
                              color: colorTextPrimary,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              height: 1.1,
                              letterSpacing: -0.3,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Projeto independente feito para a comunidade.',
                            style: TextStyle(
                              // color: colorTextTertiary,
                              color: Colors.white.withValues(alpha: 0.68),
                              fontSize: context.safeSp(13),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                Text(
                  'O Civi Osasco é um projeto independente, criado para ajudar a comunidade a acompanhar melhor o que acontece em Osasco, e acessar informações mais úteis no dia a dia.',
                  style: TextStyle(
                    color: colorTextSecondary,
                    fontSize: context.safeSp(14),
                    height: 1.65,
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1F2B)
                        .withValues(alpha: 0.35), // 👈 leve azul escuro
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF4C6FFF)
                          .withValues(alpha: 0.25), // borda colorida suave
                      width: 1.2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF4C6FFF).withValues(alpha: 0.12),
                        blurRadius: 24,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color:
                              const Color(0xFF4C6FFF).withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.flash_on_rounded,
                          color: Color(0xFF4C6FFF),
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Nosso próximo passo é ajudar a comunidade a agir mais rápido e, quando possível, auxiliar no rastreamento de veículos roubados.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.safeSp(14),
                            height: 1.6,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Se você acredita nessa iniciativa, pode apoiar o projeto com qualquer valor via Pix.',
                  style: TextStyle(
                    color: colorTextPrimary,
                    fontSize: context.safeSp(14),
                    height: 1.65,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.pix,
                            size: 16,
                            color: Colors.white.withValues(alpha: 0.72),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Chave Pix',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.62),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SelectableText(
                        pixKey,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context.safeSp(16),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.035),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: colorBorder),
                  ),
                  child: Text(
                    'Como forma de agradecimento, o app poderá exibir o nome dos apoiadores, sempre com autorização.',
                    style: TextStyle(
                      color: colorTextTertiary,
                      fontSize: context.safeSp(12),
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: pixKey));
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Chave Pix copiada'),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Copiar chave pix',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                if (onViewSupporters != null)
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(color: colorBorder),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: onViewSupporters,
                      child: const Text(
                        'Ver apoiadores',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 8),
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'Agora não',
                      style: TextStyle(
                        color: colorTextTertiary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
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

class _ToolbarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final bool isDark;

  const _ToolbarButton({
    required this.icon,
    required this.isDark,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark
        ? Colors.white.withValues(alpha: 0.06)
        : Colors.white.withValues(alpha: 0.92);

    final borderColor =
        isDark ? Colors.white.withValues(alpha: 0.08) : const Color(0xFFE5E7EB);

    final iconColor = isDark ? Colors.white : const Color(0xFF111827);

    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
        child: Ink(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
            border: Border.all(color: borderColor),
          ),
          child: Icon(
            icon,
            size: 22,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
