import 'package:flutter/material.dart';

class ItemColorStepPage extends StatefulWidget {
  const ItemColorStepPage({super.key});

  @override
  State<ItemColorStepPage> createState() => _ItemColorStepPageState();
}

class _ItemColorStepPageState extends State<ItemColorStepPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<_VehicleColorOption> _allColors = const [
    _VehicleColorOption('Preto', Color(0xFF111111)),
    _VehicleColorOption('Branco', Color(0xFFF5F5F5)),
    _VehicleColorOption('Prata', Color(0xFFC0C0C0)),
    _VehicleColorOption('Cinza', Color(0xFF7A7A7A)),
    _VehicleColorOption('Vermelho', Color(0xFFD32F2F)),
    _VehicleColorOption('Azul', Color(0xFF1565C0)),
    _VehicleColorOption('Verde', Color(0xFF2E7D32)),
    _VehicleColorOption('Amarelo', Color(0xFFF9A825)),
    _VehicleColorOption('Marrom', Color(0xFF6D4C41)),
    _VehicleColorOption('Bege', Color(0xFFD7CCC8)),
    _VehicleColorOption('Dourado', Color(0xFFC9A227)),
    _VehicleColorOption('Laranja', Color(0xFFEF6C00)),
    _VehicleColorOption('Roxo', Color(0xFF7B1FA2)),
  ];

  String _search = '';
  String? _selectedColorName;

  List<_VehicleColorOption> get _filteredColors {
    if (_search.trim().isEmpty) return _allColors;

    return _allColors
        .where(
          (item) => item.name.toLowerCase().contains(_search.toLowerCase()),
        )
        .toList();
  }

  bool get _canContinue => _selectedColorName != null;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _search = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onContinue() {
    debugPrint('Cor selecionada: $_selectedColorName');

    // Exemplo:
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => NextStepPage(color: _selectedColorName!),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const bgColor = Color(0xFFF7F9FC);
    const cardColor = Colors.white;
    const borderColor = Color(0xFFE5E7EB);
    const primaryColor = Color(0xFF2B5BEE);
    const titleColor = Color(0xFF111827);
    const subtitleColor = Color(0xFF6B7280);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Cadastro de item',
          style: theme.textTheme.titleLarge?.copyWith(
            color: titleColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selecione a cor do veículo',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: titleColor,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Escolha a cor que melhor identifica o veículo.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: subtitleColor,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar cor',
                  prefixIcon: const Icon(Icons.search_rounded),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      color: primaryColor,
                      width: 1.3,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: borderColor),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0D101828),
                        blurRadius: 18,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: _filteredColors.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Text(
                              'Nenhuma cor encontrada.',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: subtitleColor,
                              ),
                            ),
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.all(12),
                          itemCount: _filteredColors.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            final item = _filteredColors[index];
                            final isSelected = item.name == _selectedColorName;

                            return _ColorTile(
                              name: item.name,
                              color: item.color,
                              isSelected: isSelected,
                              onTap: () {
                                setState(() {
                                  _selectedColorName = item.name;
                                });
                              },
                            );
                          },
                        ),
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: _canContinue ? _onContinue : null,
                  style: FilledButton.styleFrom(
                    backgroundColor: primaryColor,
                    disabledBackgroundColor:
                        primaryColor.withValues(alpha: 0.35),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Text(
                    'Continuar',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ColorTile extends StatelessWidget {
  final String name;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _ColorTile({
    required this.name,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF2B5BEE);
    const borderColor = Color(0xFFE5E7EB);
    const textColor = Color(0xFF111827);
    const subtitleColor = Color(0xFF6B7280);

    final needsBorder = name.toLowerCase() == 'branco' ||
        name.toLowerCase() == 'bege' ||
        name.toLowerCase() == 'prata';

    return Material(
      color: isSelected
          ? primaryColor.withValues(alpha: 0.08)
          : Colors.transparent,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isSelected ? primaryColor : borderColor,
              width: isSelected ? 1.4 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: needsBorder
                        ? const Color(0xFFD1D5DB)
                        : Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? primaryColor : Colors.transparent,
                  border: Border.all(
                    color: isSelected ? primaryColor : const Color(0xFFD1D5DB),
                  ),
                ),
                child: isSelected
                    ? const Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 15,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _VehicleColorOption {
  final String name;
  final Color color;

  const _VehicleColorOption(this.name, this.color);
}
