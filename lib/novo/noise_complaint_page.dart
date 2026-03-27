import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum NoiseDisturbanceType {
  loudMusic,
  party,
  businessNoise,
  construction,
  loudVehicle,
  other,
}

enum DisturbanceDurationType {
  now,
  thirtyMinutes,
  oneHourOrMore,
  recurring,
}

class NoiseComplaintPage extends StatefulWidget {
  const NoiseComplaintPage({super.key});

  @override
  State<NoiseComplaintPage> createState() => _NoiseComplaintPageState();
}

class _NoiseComplaintPageState extends State<NoiseComplaintPage> {
  NoiseDisturbanceType? selectedType;
  DisturbanceDurationType? selectedDuration;
  bool isStillHappening = true;

  final TextEditingController descriptionController = TextEditingController();

  final disturbanceOptions = const [
    (NoiseDisturbanceType.loudMusic, 'Som alto'),
    (NoiseDisturbanceType.party, 'Festa barulhenta'),
    (NoiseDisturbanceType.businessNoise, 'Bar ou comércio'),
    (NoiseDisturbanceType.construction, 'Obra / maquinário'),
    (NoiseDisturbanceType.loudVehicle, 'Veículo com som alto'),
    (NoiseDisturbanceType.other, 'Outro'),
  ];

  final durationOptions = const [
    (DisturbanceDurationType.now, 'Agora'),
    (DisturbanceDurationType.thirtyMinutes, '30 min+'),
    (DisturbanceDurationType.oneHourOrMore, '1h+'),
    (DisturbanceDurationType.recurring, 'Recorrente'),
  ];

  bool get canPublish {
    return selectedType != null &&
        selectedDuration != null &&
        descriptionController.text.trim().isNotEmpty;
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

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
          'Perturbação do sossego',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      bottomNavigationBar: _PublishButton(
        enabled: canPublish,
        onTap: _onPublish,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informe um barulho excessivo ou situação que esteja incomodando a região.',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.70),
                fontSize: 13.5,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),
            const _SectionTitle('Local do alerta'),
            const SizedBox(height: 10),
            const _LocationCard(),
            const SizedBox(height: 22),
            const _SectionTitle('Tipo da perturbação'),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: disturbanceOptions.map((e) {
                final isSelected = selectedType == e.$1;
                return _SelectableChip(
                  label: e.$2,
                  selected: isSelected,
                  onTap: () {
                    setState(() {
                      selectedType = e.$1;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 22),
            const _SectionTitle('Quando começou?'),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: durationOptions.map((e) {
                final isSelected = selectedDuration == e.$1;
                return _SelectableChip(
                  label: e.$2,
                  selected: isSelected,
                  onTap: () {
                    setState(() {
                      selectedDuration = e.$1;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 22),
            const _SectionTitle('Ainda está acontecendo?'),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _BinaryOptionCard(
                    label: 'Sim',
                    selected: isStillHappening,
                    onTap: () {
                      setState(() {
                        isStillHappening = true;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _BinaryOptionCard(
                    label: 'Não',
                    selected: !isStillHappening,
                    onTap: () {
                      setState(() {
                        isStillHappening = false;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            const _SectionTitle('Descreva rapidamente'),
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
                onChanged: (_) => setState(() {}),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText:
                      'Ex: som muito alto vindo de um bar desde o início da noite',
                  hintStyle: TextStyle(
                    color: Colors.white.withValues(alpha: 0.40),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(14),
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
                          color: Colors.white.withValues(alpha: 0.70),
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
                color: Colors.white.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    CupertinoIcons.info_circle,
                    size: 16,
                    color: Colors.white70,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Use este alerta para situações reais de excesso de ruído ou incômodo recorrente na região.',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.60),
                        fontSize: 12,
                        height: 1.35,
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

class _SelectableChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _SelectableChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF2B5BEE)
              : Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: selected
                ? const Color(0xFF2B5BEE)
                : Colors.white.withValues(alpha: 0.08),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12.8,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _BinaryOptionCard extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _BinaryOptionCard({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF2B5BEE).withValues(alpha: 0.16)
              : Colors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected
                ? const Color(0xFF2B5BEE)
                : Colors.white.withValues(alpha: 0.06),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  const _LocationCard();

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
