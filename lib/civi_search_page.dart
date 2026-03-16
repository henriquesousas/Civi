import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TesteCiviSearchPage extends StatefulWidget {
  const TesteCiviSearchPage({super.key});

  @override
  State<TesteCiviSearchPage> createState() => _TesteCiviSearchPageState();
}

class _TesteCiviSearchPageState extends State<TesteCiviSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _debounce;
  String _search = '';
  bool _isLoading = false;

  final List<CiviSearchItem> _allItems = [
    CiviSearchItem(
      title: 'Moto roubada avistada na Av. Brasil',
      subtitle: '1.2 km · Av. Brasil, Centro',
      viewedAt: 'Visto em março 14',
      isPremium: false,
      isAlert: true,
    ),
    CiviSearchItem(
      title: 'Celular furtado próximo à estação',
      subtitle: '850 m · Estação Barueri',
      viewedAt: 'Visto em março 14',
      isPremium: false,
    ),
    CiviSearchItem(
      title: 'Tentativa de roubo em veículo estacionado',
      subtitle: '2.4 km · Rua da Prata, 120',
      viewedAt: 'Visto em março 13',
      isPremium: true,
    ),
    CiviSearchItem(
      title: 'Carro suspeito circulando na região',
      subtitle: '3.1 km · Alphaville Industrial',
      viewedAt: 'Visto em março 13',
      isPremium: true,
    ),
    CiviSearchItem(
      title: 'Roubo de bicicleta registrado',
      subtitle: '620 m · Parque Municipal',
      viewedAt: 'Visto em março 12',
      isPremium: false,
    ),
    CiviSearchItem(
      title: 'Movimentação suspeita em condomínio',
      subtitle: '1.7 km · Av. Andromeda',
      viewedAt: 'Visto em março 12',
      isPremium: true,
    ),
  ];

  List<CiviSearchItem> get _filteredItems {
    if (_search.trim().isEmpty) return _allItems;

    final query = _search.toLowerCase();
    return _allItems.where((item) {
      return item.title.toLowerCase().contains(query) ||
          item.subtitle.toLowerCase().contains(query);
    }).toList();
  }

  void _onSearchChanged() {
    final value = _searchController.text;

    /// cancela timer anterior
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    /// inicia novo timer
    _debounce = Timer(const Duration(seconds: 1), () {
      _performSearch(value);
    });
  }

  void _performSearch(String value) async {
    setState(() {
      _search = value;
      _isLoading = true;
    });

    /// Aqui você faz a consulta no backend
    debugPrint("Consultando: $value");

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    // exemplo
    // repository.searchReports(value);
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _search = '';
      _isLoading = false;
    });
  }

  void _cancelSearch() {
    FocusScope.of(context).unfocus();
    Navigator.of(context).maybePop();
  }

  @override
  void initState() {
    super.initState();

    // _searchController.addListener(() {
    //   setState(() {
    //     _search = _searchController.text;
    //   });
    // });
    _searchController.addListener(_onSearchChanged);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFF000000);
    const dividerColor = Color(0xFF161616);
    const searchBg = Color(0xFF1C1C1E);
    const hintColor = Color(0xFF8E8E93);
    const secondaryText = Color(0xFF7A7A7A);
    const premiumBorder = Color(0xFF5E5E62);
    const danger = Color(0xFFFF3B30);

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 8, 12, 12),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: searchBg,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 14),
                          const Icon(
                            CupertinoIcons.search,
                            color: hintColor,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              focusNode: _focusNode,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              cursorColor: Colors.white,
                              decoration: const InputDecoration(
                                hintText: 'Buscar incidentes, locais, regiões',
                                fillColor: searchBg,
                                hintStyle: TextStyle(
                                  color: hintColor,
                                  fontSize: 15,
                                ),
                                border: InputBorder.none,
                                isCollapsed: true,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          _isLoading
                              ? const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: SizedBox(
                                      width: 12,
                                      height: 12,
                                      child: CircularProgressIndicator()),
                                )
                              : AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 180),
                                  child: _search.isNotEmpty
                                      ? IconButton(
                                          key: const ValueKey('clear'),
                                          onPressed: _clearSearch,
                                          splashRadius: 18,
                                          icon: const Icon(
                                            CupertinoIcons.xmark_circle_fill,
                                            color: Color(0xFF6E6E73),
                                            size: 18,
                                          ),
                                        )
                                      : const SizedBox(
                                          key: ValueKey('empty'),
                                          width: 8,
                                        ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: _cancelSearch,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              color: dividerColor,
            ),
            Expanded(
              child: _filteredItems.isEmpty
                  ? const _EmptySearchState()
                  : ListView(
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(14, 0, 14, 14),
                          child: Text(
                            'Visualizados recentemente',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              height: 1.05,
                            ),
                          ),
                        ),
                        ..._filteredItems.map(
                          (item) => _SearchResultTile(
                            item: item,
                            danger: danger,
                            secondaryText: secondaryText,
                            premiumBorder: premiumBorder,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchResultTile extends StatelessWidget {
  final CiviSearchItem item;
  final Color danger;
  final Color secondaryText;
  final Color premiumBorder;

  const _SearchResultTile({
    required this.item,
    required this.danger,
    required this.secondaryText,
    required this.premiumBorder,
  });

  @override
  Widget build(BuildContext context) {
    final dotColor = item.isAlert ? danger : const Color(0xFF8E8E93);

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF252527),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                          ),
                        ),
                        if (item.isPremium) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: premiumBorder),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: const Text(
                              'Premium',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      item.subtitle,
                      style: TextStyle(
                        color: item.isAlert ? danger : secondaryText,
                        fontSize: 13,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.viewedAt,
                      style: TextStyle(
                        color: secondaryText,
                        fontSize: 13,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptySearchState extends StatelessWidget {
  const _EmptySearchState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.search,
              color: Color(0xFF7A7A7A),
              size: 34,
            ),
            SizedBox(height: 14),
            Text(
              'Nenhum resultado encontrado',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Tente buscar por incidente, bairro, rua ou região.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF7A7A7A),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CiviSearchItem {
  final String title;
  final String subtitle;
  final String viewedAt;
  final bool isPremium;
  final bool isAlert;

  CiviSearchItem({
    required this.title,
    required this.subtitle,
    required this.viewedAt,
    this.isPremium = false,
    this.isAlert = false,
  });
}
