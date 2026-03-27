import 'package:flutter/material.dart';

enum ItemType { car, motorcycle, phone }

class ItemTypeSelectionPageDarkV2 extends StatefulWidget {
  const ItemTypeSelectionPageDarkV2({super.key});

  @override
  State<ItemTypeSelectionPageDarkV2> createState() =>
      _ItemTypeSelectionPageDarkV2State();
}

class _ItemTypeSelectionPageDarkV2State
    extends State<ItemTypeSelectionPageDarkV2> {
  static const Color primaryColor = Color(0xFF2B5BEE);

  ItemType? selectedType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF121417),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF121417),
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          'Cadastro de item',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _StepHeader(
                currentStep: 1,
                totalSteps: 3,
                primaryColor: primaryColor,
              ),
              const SizedBox(height: 28),
              Text(
                'Qual item você deseja cadastrar?',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Selecione uma categoria para continuar o cadastro e informar os dados do item.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 28),
              _ItemTypeCardDark(
                icon: Icons.directions_car_rounded,
                title: 'Carro',
                subtitle:
                    'Cadastre automóveis para manter as informações organizadas no app.',
                isSelected: selectedType == ItemType.car,
                primaryColor: primaryColor,
                onTap: () {
                  setState(() {
                    selectedType = ItemType.car;
                  });
                },
              ),
              const SizedBox(height: 14),
              _ItemTypeCardDark(
                icon: Icons.two_wheeler_rounded,
                title: 'Moto',
                subtitle:
                    'Informe os dados da motocicleta para seguir com o cadastro.',
                isSelected: selectedType == ItemType.motorcycle,
                primaryColor: primaryColor,
                onTap: () {
                  setState(() {
                    selectedType = ItemType.motorcycle;
                  });
                },
              ),
              const SizedBox(height: 14),
              _ItemTypeCardDark(
                icon: Icons.smartphone_rounded,
                title: 'Celular',
                subtitle:
                    'Cadastre o aparelho e depois complemente informações como IMEI, se desejar.',
                isSelected: selectedType == ItemType.phone,
                primaryColor: primaryColor,
                onTap: () {
                  setState(() {
                    selectedType = ItemType.phone;
                  });
                },
              ),
              const Spacer(),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                child: selectedType == null
                    ? const SizedBox.shrink()
                    : Container(
                        key: const ValueKey('continue_button'),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.22),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: FilledButton(
                          onPressed: () {
                            _goToNext(context, selectedType!);
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: primaryColor,
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
                              fontWeight: FontWeight.w800,
                            ),
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

class _StepHeader extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final Color primaryColor;

  const _StepHeader({
    required this.currentStep,
    required this.totalSteps,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final progress = currentStep / totalSteps;

    return Column(
      children: [
        Center(
          child: Text(
            '$currentStep de $totalSteps',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
          ),
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: Colors.white.withOpacity(0.08),
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
          ),
        ),
      ],
    );
  }
}

class _ItemTypeCardDark extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;
  final Color primaryColor;

  const _ItemTypeCardDark({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: isSelected
                ? primaryColor.withOpacity(0.10)
                : Colors.white.withOpacity(0.035),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isSelected ? primaryColor : Colors.white.withOpacity(0.08),
              width: isSelected ? 1.6 : 1,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.14),
                      blurRadius: 22,
                      offset: const Offset(0, 10),
                    ),
                  ]
                : [],
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: isSelected
                      ? primaryColor.withOpacity(0.16)
                      : Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: isSelected
                        ? primaryColor.withOpacity(0.30)
                        : Colors.white.withOpacity(0.06),
                  ),
                ),
                child: Icon(
                  icon,
                  color: isSelected ? primaryColor : Colors.white70,
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
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white70,
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
                      ? primaryColor
                      : Colors.white.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? primaryColor
                        : Colors.white.withOpacity(0.08),
                  ),
                ),
                child: Icon(
                  isSelected
                      ? Icons.check_rounded
                      : Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: isSelected ? Colors.white : Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
