import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surfaceColor,
        border: Border(
          top: BorderSide(color: context.outlineVariantColor, width: 1),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 18,
            offset: Offset(0, -8),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onChanged,
          type: BottomNavigationBarType.fixed,
          backgroundColor: context.surfaceColor,
          selectedItemColor: context.primaryColor,
          // unselectedItemColor: context.secondaryColor,
          unselectedItemColor: const Color(0xFF6B7280),
          elevation: 0,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: context.safeSp(11),
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: context.safeSp(11),
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.public_outlined),
              activeIcon: Icon(Icons.public_rounded),
              label: 'Home',
              tooltip: 'Ocorrências',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search_rounded),
              label: 'Pesquisar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined),
              activeIcon: Icon(Icons.inventory_2_rounded),
              label: 'Meus itens',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              activeIcon: Icon(Icons.account_circle_rounded),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
