import 'package:flutter/material.dart';

class ItemRegisteredSuccessfullyDarkPage extends StatelessWidget {
  const ItemRegisteredSuccessfullyDarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const bgColor = Color(0xFF0B1220);
    const primaryColor = Color(0xFF2B5BEE);
    const titleColor = Colors.white;
    const subtitleColor = Color(0xFF94A3B8);
    const cardColor = Color(0xFF121A2B);
    const borderColor = Color(0xFF1F2A3D);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              const Spacer(),

              /// ÍCONE DE SUCESSO
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor.withValues(alpha: 0.12),
                  border: Border.all(
                    color: primaryColor.withValues(alpha: 0.25),
                  ),
                ),
                child: const Icon(
                  Icons.check_rounded,
                  size: 56,
                  color: primaryColor,
                ),
              ),

              const SizedBox(height: 28),

              /// TÍTULO
              Text(
                'Item cadastrado com sucesso',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: titleColor,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 12),

              /// SUBTÍTULO
              Text(
                'Seu veículo já está registrado e pode ser utilizado em alertas e ocorrências.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: subtitleColor,
                  height: 1.45,
                ),
              ),

              const SizedBox(height: 16),

              /// CARD INFORMATIVO
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: borderColor),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      size: 18,
                      color: primaryColor,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Agora você pode registrar ocorrências, acompanhar informações e manter os dados do item atualizados.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: subtitleColor,
                          height: 1.45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              /// BOTÃO PRINCIPAL
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: () {
                    // navegar para detalhe do item ou home
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Text(
                    'Ver meu item',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// BOTÃO SECUNDÁRIO
              TextButton(
                onPressed: () {
                  // reiniciar fluxo
                },
                child: Text(
                  'Cadastrar outro item',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: subtitleColor,
                    fontWeight: FontWeight.w600,
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
