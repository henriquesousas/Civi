import 'package:flutter/material.dart';

enum ItemType { car, motorcycle, phone }

class ItemTypeSelectionDarkPage extends StatelessWidget {
  const ItemTypeSelectionDarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const bgColor = Color(0xFF0B1220);
    const cardColor = Color(0xFF121A2B);
    const borderColor = Color(0xFF1F2A3D);
    const primaryColor = Color(0xFF2B5BEE);
    const titleColor = Colors.white;
    const subtitleColor = Color(0xFF94A3B8);
    const softTextColor = Color(0xFFCBD5E1);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          'Cadastro de item',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: titleColor,
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
                  color: titleColor,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Selecione uma categoria para continuar o cadastro e informar os dados do item.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: subtitleColor,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 28),
              _DarkItemTypeCard(
                icon: Icons.directions_car_rounded,
                title: 'Carro',
                subtitle:
                    'Cadastre automóveis para manter as informações organizadas no app.',
                onTap: () => _goToNext(context, ItemType.car),
              ),
              const SizedBox(height: 14),
              _DarkItemTypeCard(
                icon: Icons.two_wheeler_rounded,
                title: 'Moto',
                subtitle:
                    'Informe os dados da motocicleta para seguir com o cadastro.',
                onTap: () => _goToNext(context, ItemType.motorcycle),
              ),
              const SizedBox(height: 14),
              _DarkItemTypeCard(
                icon: Icons.smartphone_rounded,
                title: 'Celular',
                subtitle:
                    'Cadastre o aparelho e complemente depois com informações como IMEI.',
                onTap: () => _goToNext(context, ItemType.phone),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F1B33),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: primaryColor.withValues(alpha: 0.22),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x22000000),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: primaryColor.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.verified_user_outlined,
                        color: primaryColor,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Você poderá preencher os detalhes do item na próxima etapa.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: softTextColor,
                          fontWeight: FontWeight.w500,
                          height: 1.45,
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

class _DarkItemTypeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _DarkItemTypeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const cardColor = Color(0xFF121A2B);
    const borderColor = Color(0xFF1F2A3D);
    const titleColor = Colors.white;
    const subtitleColor = Color(0xFF94A3B8);
    const primaryColor = Color(0xFF2B5BEE);

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: borderColor),
            boxShadow: const [
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 22,
                offset: Offset(0, 12),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: primaryColor.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: primaryColor.withValues(alpha: 0.20),
                  ),
                ),
                child: Icon(
                  icon,
                  color: primaryColor,
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
                        color: titleColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: subtitleColor,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.05),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Color(0xFFCBD5E1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
