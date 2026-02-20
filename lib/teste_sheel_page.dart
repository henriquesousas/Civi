import 'package:deehelp/teste_home.dart';
import 'package:flutter/material.dart';

// ✅ Sua Home (1ª aba)
// class HomeIncidentsPage extends StatelessWidget {
//   const HomeIncidentsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Substitua pelo seu widget real da Home (a tela que criamos)
//     return const Center(child: Text('Home (Ocorrências)'));
//   }
// }

// ✅ 2ª aba: Pesquisar
class SearchPage2 extends StatelessWidget {
  const SearchPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Pesquisar'));
  }
}

// ✅ 3ª aba: Meus Itens
class MyItemsPage extends StatelessWidget {
  const MyItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Meus Itens'));
  }
}

// ✅ 4ª aba: Profile
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile'));
  }
}

/// ===============================
/// DASHBOARD com BottomNavigationBar
/// (Home, Pesquisar, Itens, Profile)
/// ===============================
/// //AppSheellPage
class TesteShellPage extends StatefulWidget {
  const TesteShellPage({super.key});

  @override
  State<TesteShellPage> createState() => _TesteShellPageState();
}

class _TesteShellPageState extends State<TesteShellPage> {
  // Design tokens (consistente com teu app)
  static const _bg = Color(0xFFF5F7FD);
  static const _surface = Colors.white;
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);
  static const _border = Color(0xFFE6EAF6);

  int index = 0;

  // Mantém estado das abas (scroll, campos etc)
  late final List<Widget> _pages = const [
    TesteHome(), // 1
    SearchPage2(), // 2
    MyItemsPage(), // 3
    ProfilePage(), // 4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,

      // ✅ preserva estado das telas
      body: IndexedStack(
        index: index,
        children: _pages,
      ),

      bottomNavigationBar: _PremiumBottomNav(
        currentIndex: index,
        onChanged: (i) => setState(() => index = i),
      ),
    );
  }
}

/// BottomBar premium (clean, pouco colorido, elegante)
class _PremiumBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const _PremiumBottomNav({
    required this.currentIndex,
    required this.onChanged,
  });

  static const _surface = Color(0xFFFFFFFF);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);
  static const _border = Color(0xFFE6EAF6);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: _surface,
        border: Border(top: BorderSide(color: _border, width: 1)),
        boxShadow: [
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
          backgroundColor: _surface,
          elevation: 0,
          selectedItemColor: _primary,
          unselectedItemColor: _muted,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.public_rounded),
              label: 'Home',
              tooltip: 'Ocorrências',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: 'Pesquisar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined),
              label: 'Meus itens',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
