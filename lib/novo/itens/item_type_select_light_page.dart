import 'package:flutter/material.dart';

enum ItemType { car, motorcycle, phone }

class ItemTypeSelectionPageLight extends StatelessWidget {
  const ItemTypeSelectionPageLight({super.key});

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
                onTap: () {
                  _goToNext(context, ItemType.car);
                },
              ),
              const SizedBox(height: 14),
              _ItemTypeCard(
                icon: Icons.two_wheeler_rounded,
                title: 'Moto',
                subtitle:
                    'Informe os dados da motocicleta para seguir com o cadastro.',
                onTap: () {
                  _goToNext(context, ItemType.motorcycle);
                },
              ),
              const SizedBox(height: 14),
              _ItemTypeCard(
                icon: Icons.smartphone_rounded,
                title: 'Celular',
                subtitle:
                    'Cadastre o aparelho e depois complemente informações como IMEI, se desejar.',
                onTap: () {
                  _goToNext(context, ItemType.phone);
                },
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF4FF),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFD8E4FF)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.verified_user_outlined,
                      color: Color(0xFF2B5BEE),
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Você poderá preencher os detalhes do item na próxima etapa.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF28407A),
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
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

class _ItemTypeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ItemTypeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
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
            border: Border.all(color: const Color(0xFFE5E7EB)),
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
                  color: const Color(0xFFEEF3FF),
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
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Color(0xFF6B7280),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
