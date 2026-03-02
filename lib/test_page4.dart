import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestPage4 extends StatelessWidget {
  const TestPage4({super.key});

  static const _bg = Color(0xFFF5F7FD);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    final items = _mockItems();

    return Scaffold(
      backgroundColor: _bg,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: _AddItemFab(
      //   onTap: () {
      //     // GoRouter:
      //     // context.push('/items/new');
      //   },
      // ),
      // bottomNavigationBar: const _ItemsBottomBar(),
      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      //   decoration: const BoxDecoration(
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Color(0x142B5BEE),
      //         blurRadius: 16,
      //         offset: Offset(0, -6),
      //       ),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x142B5BEE),
              blurRadius: 16,
              offset: Offset(0, -6),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 54,
            child: ElevatedButton.icon(
              onPressed: () {
                // context.push('/items/new');
              },
              icon: const Icon(Icons.add_circle_outline),
              label: const Text(
                'Cadastrar novo item',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2B5BEE),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: _ink),
        title: const Text(
          'Meus itens',
          style: TextStyle(
            color: _ink,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Adicionar item',
            onPressed: () {},
            icon: const Icon(Icons.add_circle_outline),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          _HeaderSummary(total: items.length),
          const SizedBox(height: 14),
          const _VerificationInfoCard(), // 👈 adiciona aqui
          const SizedBox(height: 14),

          ...items.map(
            (it) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ItemCard(
                item: it,
                onTap: () {
                  // Aqui você navega para a tela de detalhes
                  // Ex: context.push('/items/${it.id}');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<UserItem> _mockItems() {
    return [
      UserItem(
        id: '1',
        name: 'CG Titan 150',
        status: ItemStatus.active,
        createdAt: DateTime(2026, 1, 18),
        photo: const NetworkImage('https://picsum.photos/seed/titan/600/600'),
      ),
      UserItem(
        id: '2',
        name: 'iPhone 13',
        status: ItemStatus.pending,
        createdAt: DateTime(2026, 1, 29),
        photo: const NetworkImage('https://picsum.photos/seed/iphone/600/600'),
      ),
      UserItem(
        id: '3',
        name: 'Toyota Corolla',
        status: ItemStatus.canceled,
        createdAt: DateTime(2025, 12, 6),
        photo: const NetworkImage('https://picsum.photos/seed/corolla/600/600'),
      ),
    ];
  }
}

/* ------------------- MODEL ------------------- */

enum ItemStatus { active, pending, canceled }

class UserItem {
  final String id;
  final String name;
  final ItemStatus status;
  final DateTime createdAt;
  final ImageProvider photo;

  const UserItem({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.photo,
  });
}

/* ------------------- UI ------------------- */

class _HeaderSummary extends StatelessWidget {
  final int total;

  const _HeaderSummary({required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [Color(0xFF2B5BEE), Color(0xFF5F85FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Icon(Icons.inventory_2_outlined, color: Colors.white),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Seus itens cadastrados',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1F2A44),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$total item(ns) no seu perfil',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF8A96C8),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF2B5BEE).withOpacity(0.10),
              borderRadius: BorderRadius.circular(99),
            ),
            child: Text(
              '$total',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Color(0xFF2B5BEE),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  final UserItem item;
  final VoidCallback onTap;

  const _ItemCard({
    required this.item,
    required this.onTap,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    final statusStyle = _StatusStyle.from(item.status);
    final dateText = DateFormat('dd/MM/yyyy').format(item.createdAt);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        splashColor: _primary.withOpacity(0.06),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Color(0x142B5BEE),
                blurRadius: 16,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ✅ 1 Foto
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Container(
                    width: 92,
                    height: 92,
                    color: const Color(0xFFF5F7FD),
                    child: Image(
                      image: item.photo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nome + badge
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: _ink,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          _StatusBadge(style: statusStyle),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Data de cadastro
                      Row(
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              color: _ink.withOpacity(0.06),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.calendar_month_outlined,
                              size: 18,
                              color: _ink,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Cadastrado em',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: _muted,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  dateText,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: _ink,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: Color(0xFF8A96C8),
                          ),
                        ],
                      ),
                    ],
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

class _StatusBadge extends StatelessWidget {
  final _StatusStyle style;

  const _StatusBadge({required this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: style.bg,
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: style.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(style.icon, size: 14, color: style.fg),
          const SizedBox(width: 6),
          Text(
            style.label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: style.fg,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusStyle {
  final String label;
  final Color bg;
  final Color fg;
  final Color border;
  final IconData icon;

  const _StatusStyle({
    required this.label,
    required this.bg,
    required this.fg,
    required this.border,
    required this.icon,
  });

  factory _StatusStyle.from(ItemStatus status) {
    switch (status) {
      case ItemStatus.active:
        return _StatusStyle(
          label: 'Ativo',
          bg: const Color(0xFF2B5BEE).withOpacity(0.12),
          fg: const Color(0xFF2B5BEE),
          border: const Color(0xFF2B5BEE).withOpacity(0.35),
          icon: Icons.check_circle_outline,
        );
      case ItemStatus.pending:
        return _StatusStyle(
          label: 'Pendente',
          bg: const Color(0xFFFFB020).withOpacity(0.14),
          fg: const Color(0xFFB06A00),
          border: const Color(0xFFFFB020).withOpacity(0.35),
          icon: Icons.schedule,
        );
      case ItemStatus.canceled:
        return _StatusStyle(
          label: 'Cancelado',
          bg: Colors.redAccent.withOpacity(0.12),
          fg: Colors.redAccent,
          border: Colors.redAccent.withOpacity(0.30),
          icon: Icons.block,
        );
    }
  }
}

class _VerificationInfoCard extends StatelessWidget {
  const _VerificationInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF2B5BEE).withOpacity(0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.verified_user_outlined,
              color: Color(0xFF2B5BEE),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verificação',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1F2A44),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Todos os itens cadastrados passam por uma verificação da nossa equipe antes de ficarem visíveis no app.',
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.35,
                    color: Color(0xFF8A96C8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AddItemButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddItemButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              colors: [Color(0xFF2B5BEE), Color(0xFF5F85FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x332B5BEE),
                blurRadius: 18,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.add_circle_outline, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  'Cadastrar novo item',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
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

class _AddItemFab extends StatelessWidget {
  final VoidCallback onTap;

  const _AddItemFab({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: FloatingActionButton.extended(
        onPressed: onTap,
        backgroundColor: const Color(0xFF2B5BEE),
        elevation: 0,
        icon: const Icon(Icons.add_circle_outline, color: Colors.white),
        label: const Text(
          'Cadastrar item',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}

class _ItemsBottomBar extends StatelessWidget {
  const _ItemsBottomBar();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 10,
      surfaceTintColor: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 64,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: const [
              _BottomHint(
                icon: Icons.verified_user_outlined,
                text: 'Itens passam por verificação',
              ),
              Spacer(),
              // Espaço do notch do FAB (não colocar nada aqui)
              SizedBox(width: 52),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomHint extends StatelessWidget {
  final IconData icon;
  final String text;

  const _BottomHint({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: const Color(0xFF2B5BEE).withOpacity(0.10),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 18, color: const Color(0xFF2B5BEE)),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w700,
            color: Color(0xFF8A96C8),
          ),
        ),
      ],
    );
  }
}
