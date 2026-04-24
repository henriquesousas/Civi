import 'package:flutter/material.dart';

class PhoneBrand {
  final String name;

  const PhoneBrand(this.name);
}

class TestBrandPage extends StatefulWidget {
  const TestBrandPage({super.key});

  @override
  State<TestBrandPage> createState() => _TestBrandPageState();
}

class _TestBrandPageState extends State<TestBrandPage> {
  final TextEditingController _searchController = TextEditingController();

  static const List<PhoneBrand> _allBrands = [
    PhoneBrand('Apple'),
    PhoneBrand('Samsung'),
    PhoneBrand('Motorola'),
    PhoneBrand('Xiaomi'),
    PhoneBrand('Realme'),
    PhoneBrand('POCO'),
    PhoneBrand('Redmi'),
    PhoneBrand('ASUS'),
    PhoneBrand('Nokia'),
    PhoneBrand('LG'),
    PhoneBrand('Sony'),
    PhoneBrand('Huawei'),
    PhoneBrand('Honor'),
    PhoneBrand('OnePlus'),
    PhoneBrand('Google'),
    PhoneBrand('Lenovo'),
    PhoneBrand('Philco'),
    PhoneBrand('Multilaser'),
    PhoneBrand('Positivo'),
    PhoneBrand('TCL'),
    PhoneBrand('Infinix'),
    PhoneBrand('Tecno'),
    PhoneBrand('ZTE'),
    PhoneBrand('Alcatel'),
  ];

  String _search = '';

  List<PhoneBrand> get _filteredBrands {
    if (_search.trim().isEmpty) {
      return _allBrands;
    }

    return _allBrands
        .where(
          (brand) => brand.name.toLowerCase().contains(_search.toLowerCase()),
        )
        .toList();
  }

  void _selectBrand(PhoneBrand brand) {
    Navigator.of(context).pop(brand.name);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Colors.black;
    const cardColor = Color(0xFF111111);
    const fieldColor = Color(0xFF1D1D1D);
    const borderColor = Color(0xFF2A2A2A);
    const primaryTextColor = Colors.white;
    const secondaryTextColor = Color(0xFF9E9E9E);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: _BrandPageHeader(),
            ),
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Selecionar marca',
                style: TextStyle(
                  color: primaryTextColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Pesquise e escolha uma das marcas disponíveis.',
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 15,
                  height: 1.35,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _search = value;
                  });
                },
                style: const TextStyle(
                  color: primaryTextColor,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Pesquisar marca',
                  hintStyle: const TextStyle(
                    color: Color(0xFF8E8E8E),
                    fontSize: 15,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF8E8E8E),
                  ),
                  filled: true,
                  fillColor: fieldColor,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 18,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(color: Color(0xFF4B4B4B)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _filteredBrands.isEmpty
                  ? const _EmptyBrandState()
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                      itemCount: _filteredBrands.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final brand = _filteredBrands[index];

                        return InkWell(
                          borderRadius: BorderRadius.circular(22),
                          onTap: () => _selectBrand(brand),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 18,
                            ),
                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: const Color(0xFF1C1C1C),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1A1A1A),
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: const Color(0xFF2A2A2A),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.smartphone_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Text(
                                    brand.name,
                                    style: const TextStyle(
                                      color: primaryTextColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.white54,
                                  size: 22,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BrandPageHeader extends StatelessWidget {
  const _BrandPageHeader();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => Navigator.of(context).maybePop(),
      child: const Padding(
        padding: EdgeInsets.all(4),
        child: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

class _EmptyBrandState extends StatelessWidget {
  const _EmptyBrandState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off_rounded,
              color: Colors.white38,
              size: 34,
            ),
            SizedBox(height: 12),
            Text(
              'Nenhuma marca encontrada',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Tente pesquisar com outro nome.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 14,
                height: 1.35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
