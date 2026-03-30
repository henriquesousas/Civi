import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SuspiciousType {
  person,
  vehicle,
  group,
  observing,
  other,
}

class SuspiciousActivityPageLight extends StatefulWidget {
  const SuspiciousActivityPageLight({super.key});

  @override
  State<SuspiciousActivityPageLight> createState() =>
      _SuspiciousActivityPageLightState();
}

class _SuspiciousActivityPageLightState
    extends State<SuspiciousActivityPageLight> {
  SuspiciousType? selectedType;
  final TextEditingController descriptionController = TextEditingController();

  final types = const [
    (SuspiciousType.person, 'Pessoa suspeita'),
    (SuspiciousType.vehicle, 'Veículo suspeito'),
    (SuspiciousType.group, 'Grupo suspeito'),
    (SuspiciousType.observing, 'Observando imóveis'),
    (SuspiciousType.other, 'Outro'),
  ];

  static const _primaryBlue = Color(0xFF2B5BEE);
  static const _background = Color(0xFFF7F9FC);
  static const _card = Colors.white;
  static const _border = Color(0xFFE6EBF2);
  static const _textPrimary = Color(0xFF111827);
  static const _textSecondary = Color(0xFF6B7280);
  static const _hint = Color(0xFF9CA3AF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      appBar: AppBar(
        backgroundColor: _background,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.chevron_left,
            color: _textPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Atividade suspeita',
          style: TextStyle(
            color: _textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
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
            Text(
              'Informe rapidamente o que você observou na região.',
              style: const TextStyle(
                color: _textSecondary,
                fontSize: 13.5,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),
            const _SectionTitle('Local do alerta'),
            const SizedBox(height: 10),
            const _LocationCard(),
            const SizedBox(height: 22),
            const _SectionTitle('O que você percebeu?'),
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
                      color: isSelected ? const Color(0xFFEAF0FF) : _card,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: isSelected ? _primaryBlue : _border,
                      ),
                    ),
                    child: Text(
                      e.$2,
                      style: TextStyle(
                        color: isSelected ? _primaryBlue : _textPrimary,
                        fontSize: 12.8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 22),
            const _SectionTitle('O que chamou sua atenção?'),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: _card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: _border),
              ),
              child: TextField(
                controller: descriptionController,
                maxLines: 4,
                style: const TextStyle(color: _textPrimary),
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(
                  hintText:
                      'Ex: veículo parado há muito tempo observando as casas da rua',
                  hintStyle: TextStyle(
                    color: _hint,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(14),
                ),
              ),
            ),
            const SizedBox(height: 22),
            const _SectionTitle('Adicionar foto (opcional)'),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // TODO: abrir picker
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: _card,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: _border),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.camera,
                        color: _textSecondary,
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Adicionar imagem',
                        style: TextStyle(
                          color: _textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F6FB),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: _border),
              ),
              child: const Row(
                children: [
                  Icon(
                    CupertinoIcons.info_circle,
                    size: 16,
                    color: _textSecondary,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Evite se expor. Publique apenas situações reais.',
                      style: TextStyle(
                        color: _textSecondary,
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

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  static const _textPrimary = Color(0xFF111827);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: _textPrimary,
        fontSize: 14.5,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  const _LocationCard();

  static const _card = Colors.white;
  static const _border = Color(0xFFE6EBF2);
  static const _textPrimary = Color(0xFF111827);
  static const _primaryBlue = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _border),
      ),
      child: Row(
        children: [
          const Icon(
            CupertinoIcons.location_solid,
            color: _primaryBlue,
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Rua Antônio Agú, Centro - Osasco',
              style: TextStyle(
                color: _textPrimary,
                fontSize: 13,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // TODO: abrir mapa
            },
            child: const Text(
              'Ajustar',
              style: TextStyle(
                color: _primaryBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
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

  static const _primaryBlue = Color(0xFF2B5BEE);

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
              color: enabled ? _primaryBlue : const Color(0xFFDCE3ED),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                'Publicar alerta',
                style: TextStyle(
                  color: enabled ? Colors.white : const Color(0xFF7B8794),
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
