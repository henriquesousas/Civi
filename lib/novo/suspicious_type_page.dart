import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SuspiciousType {
  person,
  vehicle,
  group,
  observing,
  other,
}

class SuspiciousActivityPage extends StatefulWidget {
  const SuspiciousActivityPage({super.key});

  @override
  State<SuspiciousActivityPage> createState() => _SuspiciousActivityPageState();
}

class _SuspiciousActivityPageState extends State<SuspiciousActivityPage> {
  SuspiciousType? selectedType;
  final TextEditingController descriptionController = TextEditingController();

  final types = const [
    (SuspiciousType.person, 'Pessoa suspeita'),
    (SuspiciousType.vehicle, 'Veículo suspeito'),
    (SuspiciousType.group, 'Grupo suspeito'),
    (SuspiciousType.observing, 'Observando imóveis'),
    (SuspiciousType.other, 'Outro'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0E14),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_left),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Atividade suspeita',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      /// BOTÃO FIXO
      bottomNavigationBar: _PublishButton(
        enabled: selectedType != null &&
            descriptionController.text.trim().isNotEmpty,
        onTap: _onPublish,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            Text(
              'Informe rapidamente o que você observou na região.',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 13.5,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 20),

            /// LOCAL
            _SectionTitle('Local do alerta'),
            const SizedBox(height: 10),
            _LocationCard(),

            const SizedBox(height: 22),

            /// TIPO
            _SectionTitle('O que você percebeu?'),
            const SizedBox(height: 10),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: types.map((e) {
                final isSelected = selectedType == e.$1;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedType = e.$1;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF2B5BEE)
                          : Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF2B5BEE)
                            : Colors.white.withValues(alpha: 0.08),
                      ),
                    ),
                    child: Text(
                      e.$2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 22),

            /// DESCRIÇÃO
            _SectionTitle('O que chamou sua atenção?'),
            const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.06),
                ),
              ),
              child: TextField(
                controller: descriptionController,
                maxLines: 4,
                style: const TextStyle(color: Colors.white),
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText:
                      'Ex: veículo parado há muito tempo observando as casas da rua',
                  hintStyle: TextStyle(
                    color: Colors.white.withValues(alpha: 0.4),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(14),
                ),
              ),
            ),

            const SizedBox(height: 22),

            /// FOTO OPCIONAL
            _SectionTitle('Adicionar foto (opcional)'),
            const SizedBox(height: 10),

            GestureDetector(
              onTap: () {
                // TODO: abrir picker
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.06),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        CupertinoIcons.camera,
                        color: Colors.white70,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Adicionar imagem',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),

            /// INFO
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(
                    CupertinoIcons.info_circle,
                    size: 16,
                    color: Colors.white70,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Evite se expor. Publique apenas situações reais.',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.6),
                        fontSize: 12,
                      ),
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

  void _onPublish() {
    // TODO: enviar alerta
  }
}

/// COMPONENTES

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14.5,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.06),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            CupertinoIcons.location_solid,
            color: Color(0xFF82A7FF),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Rua Antônio Agú, Centro - Osasco',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85),
                fontSize: 13,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // TODO: abrir mapa
            },
            child: const Text('Ajustar'),
          )
        ],
      ),
    );
  }
}

class _PublishButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onTap;

  const _PublishButton({
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: enabled ? onTap : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 54,
            decoration: BoxDecoration(
              color: enabled
                  ? const Color(0xFF2B5BEE)
                  : Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                'Publicar alerta',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
