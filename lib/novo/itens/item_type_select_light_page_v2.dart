import 'package:flutter/material.dart';

enum ItemType { car, motorcycle, phone }

class ItemTypeSelectionPageLightV2 extends StatefulWidget {
  const ItemTypeSelectionPageLightV2({super.key});

  @override
  State<ItemTypeSelectionPageLightV2> createState() =>
      _ItemTypeSelectionPageLightV2State();
}

class _ItemTypeSelectionPageLightV2State
    extends State<ItemTypeSelectionPageLightV2> {
  ItemType? selectedType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF7F9FC),
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          'Cadastro de item',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: const Color(0xFF111827),
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
                'Qual item você deseja cadastrar?',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF111827),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Selecione uma categoria para continuar o cadastro e informar os dados do item.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF6B7280),
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 28),
              _ItemTypeCard(
                icon: Icons.directions_car_rounded,
                title: 'Carro',
                subtitle:
                    'Cadastre automóveis para manter as informações organizadas no app.',
                isSelected: selectedType == ItemType.car,
                onTap: () {
                  setState(() {
                    selectedType = ItemType.car;
                  });
                },
              ),
              const SizedBox(height: 14),
              _ItemTypeCard(
                icon: Icons.two_wheeler_rounded,
                title: 'Moto',
                subtitle:
                    'Informe os dados da motocicleta para seguir com o cadastro.',
                isSelected: selectedType == ItemType.motorcycle,
                onTap: () {
                  setState(() {
                    selectedType = ItemType.motorcycle;
                  });
                },
              ),
              const SizedBox(height: 14),
              _ItemTypeCard(
                icon: Icons.smartphone_rounded,
                title: 'Celular',
                subtitle:
                    'Cadastre o aparelho e depois complemente informações como IMEI, se desejar.',
                isSelected: selectedType == ItemType.phone,
                onTap: () {
                  setState(() {
                    selectedType = ItemType.phone;
                  });
                },
              ),
              const Spacer(),
              if (selectedType != null) ...[
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      _goToNext(context, selectedType!);
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF2B5BEE),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      'Continuar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _goToNext(BuildContext context, ItemType type) {
    debugPrint('Tipo selecionado: $type');

    // Exemplo:
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => NextStepPage(selectedType: type),
    //   ),
    // );
  }
}

class _ItemTypeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _ItemTypeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF2B5BEE)
                  : const Color(0xFFE5E7EB),
              width: isSelected ? 2 : 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0D101828),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFFEAF1FF)
                      : const Color(0xFFEEF3FF),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF2B5BEE),
                  size: 28,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF6B7280),
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF2B5BEE)
                      : const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  isSelected
                      ? Icons.check_rounded
                      : Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: isSelected ? Colors.white : const Color(0xFF6B7280),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
