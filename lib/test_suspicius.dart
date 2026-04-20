import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloodAlertPage extends StatefulWidget {
  final String locationLabel;
  final VoidCallback? onPublish;
  final VoidCallback? onAddPhoto;

  const FloodAlertPage({
    super.key,
    required this.locationLabel,
    this.onPublish,
    this.onAddPhoto,
  });

  @override
  State<FloodAlertPage> createState() => _FloodAlertPageState();
}

class _FloodAlertPageState extends State<FloodAlertPage> {
  final TextEditingController _descriptionController = TextEditingController();

  File? _selectedImage;

  bool get _canPublish => _descriptionController.text.trim().isNotEmpty;

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  void _handlePublish() {
    if (!_canPublish) return;
    widget.onPublish?.call();
  }

  void _handlePhotoTap() {
    widget.onAddPhoto?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0E14),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            CupertinoIcons.chevron_left,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Alagamento',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.2,
          ),
        ),
      ),
      bottomNavigationBar: _BottomPublishBar(
        enabled: _canPublish,
        onTap: _handlePublish,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF123A74),
                    Color(0xFF0E1C35),
                  ],
                ),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.08),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.22),
                    blurRadius: 24,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.10),
                      ),
                    ),
                    child: const Icon(
                      CupertinoIcons.drop_fill,
                      color: Color(0xFF8FC3FF),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Avise a comunidade rapidamente',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.25,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Seu local atual será usado automaticamente para informar pessoas próximas sobre o alagamento.',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.72),
                            fontSize: 13.2,
                            height: 1.4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            /// LOCAL
            const _SectionTitle(
              title: 'Local do alerta',
              subtitle: 'Esse alerta será vinculado à sua posição atual',
            ),
            const SizedBox(height: 10),
            _LockedLocationCard(locationLabel: widget.locationLabel),

            const SizedBox(height: 22),

            /// DESCRIÇÃO
            const _SectionTitle(
              title: 'Descreva rapidamente',
              subtitle: 'Explique o que está acontecendo de forma objetiva',
            ),
            const SizedBox(height: 10),
            _DescriptionCard(
              controller: _descriptionController,
              onChanged: (_) => setState(() {}),
            ),

            const SizedBox(height: 22),

            /// FOTO OPCIONAL
            const _SectionTitle(
              title: 'Foto (opcional)',
              subtitle:
                  'Uma imagem pode ajudar outras pessoas a entender a situação',
            ),
            const SizedBox(height: 10),
            _FloodImageCard(
              imageFile: _selectedImage,
              onTap: _handlePhotoTap,
            ),

            const SizedBox(height: 18),

            /// INFO
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.06),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    CupertinoIcons.info_circle_fill,
                    size: 18,
                    color: Colors.white.withValues(alpha: 0.76),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Evite atravessar áreas alagadas e publique apenas situações reais observadas por você.',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.66),
                        fontSize: 12.5,
                        height: 1.4,
                        fontWeight: FontWeight.w500,
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
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionTitle({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.2,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.56),
            fontSize: 12.4,
            height: 1.35,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _LockedLocationCard extends StatelessWidget {
  final String locationLabel;

  const _LockedLocationCard({
    required this.locationLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.045),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.06),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFF2B5BEE).withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xFF2B5BEE).withValues(alpha: 0.28),
              ),
            ),
            child: const Icon(
              CupertinoIcons.location_solid,
              color: Color(0xFF82A7FF),
              size: 21,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Local detectado',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  locationLabel,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.72),
                    fontSize: 12.8,
                    height: 1.35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.06),
              ),
            ),
            child: Text(
              'Atual',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.78),
                fontSize: 11.5,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DescriptionCard extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const _DescriptionCard({
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.white.withValues(alpha: 0.045),
          // borderRadius: BorderRadius.circular(20),
          // border: Border.all(
          //   color: Colors.white.withValues(alpha: 0.06),
          // ),
          ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        maxLines: 5,
        minLines: 5,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          height: 1.4,
        ),
        decoration: InputDecoration(
          hintText:
              'Ex: água acumulada na rua, carros reduzindo a velocidade e parte da via com dificuldade de passagem',
          hintStyle: TextStyle(
            color: Colors.white.withValues(alpha: 0.38),
            fontSize: 13.5,
            height: 1.4,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}

class _FloodImageCard extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onTap;

  const _FloodImageCard({
    required this.imageFile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasImage = imageFile != null;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.045),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.06),
          ),
          image: hasImage
              ? DecorationImage(
                  image: FileImage(imageFile!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: hasImage
            ? Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.42),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: const Text(
                    'Alterar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.8,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.06),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      CupertinoIcons.camera_fill,
                      color: Colors.white70,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Adicionar foto',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Opcional, mas útil para dar mais contexto',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.58),
                      fontSize: 12.3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _BottomPublishBar extends StatelessWidget {
  final bool enabled;
  final VoidCallback onTap;

  const _BottomPublishBar({
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: GestureDetector(
          onTap: enabled ? onTap : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: enabled
                  ? const Color(0xFF2B5BEE)
                  : Colors.white.withValues(alpha: 0.08),
              boxShadow: enabled
                  ? [
                      BoxShadow(
                        color: const Color(0xFF2B5BEE).withValues(alpha: 0.22),
                        blurRadius: 24,
                        offset: const Offset(0, 10),
                      ),
                    ]
                  : null,
            ),
            child: Center(
              child: Text(
                'Publicar alerta',
                style: TextStyle(
                  color: enabled
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.38),
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
