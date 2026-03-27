import 'package:flutter/material.dart';

class ItemPhotoStepDarkPage extends StatefulWidget {
  const ItemPhotoStepDarkPage({super.key});

  @override
  State<ItemPhotoStepDarkPage> createState() => _ItemPhotoStepDarkPageState();
}

class _ItemPhotoStepDarkPageState extends State<ItemPhotoStepDarkPage> {
  static const int maxPhotos = 3;

  final List<String> _photos = [];

  bool get _canAddMore => _photos.length < maxPhotos;

  void _onAddPhoto() async {
    if (!_canAddMore) return;

    // Aqui você conecta com câmera/galeria.
    // Mock temporário:
    setState(() {
      _photos.add('photo_${DateTime.now().millisecondsSinceEpoch}');
    });
  }

  void _removePhoto(int index) {
    setState(() {
      _photos.removeAt(index);
    });
  }

  void _onContinue() {
    debugPrint('Fotos selecionadas: ${_photos.length}');

    // Exemplo:
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => const NextStepPage(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const bgColor = Color(0xFF0B1220);
    const cardColor = Color(0xFF121A2B);
    const borderColor = Color(0xFF1F2A3D);
    const tileBg = Color(0xFF0F172A);
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
                'Adicione fotos do veículo',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: titleColor,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Envie até 3 fotos para ajudar na identificação do veículo.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: subtitleColor,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Prefira imagens nítidas, mostrando bem a frente, lateral ou traseira do veículo.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: subtitleColor,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fotos do veículo',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: softTextColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${_photos.length} de $maxPhotos adicionadas',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: subtitleColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: maxPhotos,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.82,
                      ),
                      itemBuilder: (context, index) {
                        final hasPhoto = index < _photos.length;

                        if (hasPhoto) {
                          return _DarkPhotoPreviewTile(
                            label: 'Foto ${index + 1}',
                            onRemove: () => _removePhoto(index),
                          );
                        }

                        return _DarkAddPhotoTile(
                          enabled: _canAddMore,
                          onTap: _onAddPhoto,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: tileBg,
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
                        'As fotos ajudam a reconhecer melhor o veículo em consultas e ocorrências dentro do app.',
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
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  onPressed: _onContinue,
                  style: FilledButton.styleFrom(
                    backgroundColor: primaryColor,
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

class _DarkAddPhotoTile extends StatelessWidget {
  final bool enabled;
  final VoidCallback onTap;

  const _DarkAddPhotoTile({
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFF1F2A3D);
    const primaryColor = Color(0xFF2B5BEE);
    const tileBg = Color(0xFF0F172A);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: enabled ? onTap : null,
        child: Ink(
          decoration: BoxDecoration(
            color: tileBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: borderColor),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: primaryColor.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: primaryColor.withValues(alpha: 0.18),
                  ),
                ),
                child: const Icon(
                  Icons.add_a_photo_outlined,
                  color: primaryColor,
                  size: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Adicionar',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: const Color(0xFFE2E8F0),
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DarkPhotoPreviewTile extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const _DarkPhotoPreviewTile({
    required this.label,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF16213A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF22314D)),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: const Color(0xFF1A2742),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.directions_car_filled_rounded,
                  size: 34,
                  color: Color(0xFF2B5BEE),
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Material(
              color: Colors.black.withValues(alpha: 0.55),
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: onRemove,
                child: const Padding(
                  padding: EdgeInsets.all(6),
                  child: Icon(
                    Icons.close_rounded,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 8,
            right: 8,
            bottom: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.42),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
