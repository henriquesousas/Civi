import 'package:flutter/material.dart';

class TestVehicleRegisterPage extends StatefulWidget {
  const TestVehicleRegisterPage({super.key});

  @override
  State<TestVehicleRegisterPage> createState() =>
      _TestVehicleRegisterPageState();
}

class _TestVehicleRegisterPageState extends State<TestVehicleRegisterPage> {
  final _vehicleNameController = TextEditingController();
  final _brandController = TextEditingController();
  final _colorController = TextEditingController();
  final _plateController = TextEditingController();
  final _notesController = TextEditingController();

  static const int maxNotesLength = 300;

  // Exemplo local para simular fotos adicionadas
  final List<String> mockPhotos = [];

  @override
  void dispose() {
    _vehicleNameController.dispose();
    _brandController.dispose();
    _colorController.dispose();
    _plateController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _addMockPhoto() {
    setState(() {
      mockPhotos.add('photo_${mockPhotos.length + 1}');
    });
  }

  void _removePhoto(int index) {
    setState(() {
      mockPhotos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Colors.black;
    const cardColor = Color(0xFF111111);
    const fieldColor = Color(0xFF1D1D1D);
    const fieldBorderColor = Color(0xFF2A2A2A);
    const primaryTextColor = Colors.white;
    const secondaryTextColor = Color(0xFF9E9E9E);
    const accentColor = Color(0xFFDCEAF7);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _BackButton(),
              const SizedBox(height: 18),
              const Text(
                'Cadastrar veículo',
                style: TextStyle(
                  color: primaryTextColor,
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Informe os dados do veículo para facilitar a identificação e o cadastro no app.',
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 16,
                  height: 1.35,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 28),
              const _SectionLabel('Nome do veículo'),
              const SizedBox(height: 10),
              _DarkTextField(
                controller: _vehicleNameController,
                hintText: 'Ex: Civic Touring 2020',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 22),
              const _SectionLabel('Marca'),
              const SizedBox(height: 10),
              _DarkTextField(
                controller: _brandController,
                hintText: 'Ex: Honda',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 22),
              const _SectionLabel('Cor'),
              const SizedBox(height: 10),
              _DarkTextField(
                controller: _colorController,
                hintText: 'Ex: Preto',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 22),
              const _SectionLabel('Placa'),
              const SizedBox(height: 10),
              _DarkTextField(
                controller: _plateController,
                hintText: 'Ex: ABC1D23',
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.characters,
              ),
              const SizedBox(height: 24),
              const _SectionLabel('Observações'),
              const SizedBox(height: 6),
              const Text(
                'Descreva detalhes importantes do veículo. Máximo de 300 caracteres.',
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 10),
              _DarkTextField(
                controller: _notesController,
                hintText:
                    'Ex: Possui adesivo no vidro traseiro, roda preta, pequeno risco na porta.',
                maxLines: 5,
                maxLength: maxNotesLength,
                textInputAction: TextInputAction.newline,
              ),
              const SizedBox(height: 28),
              const _SectionLabel('Fotos do veículo'),
              const SizedBox(height: 6),
              const Text(
                'Adicione 1 ou mais fotos para ajudar na identificação.',
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFF1C1C1C)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _AddPhotoTile(
                          onTap: _addMockPhoto,
                        ),
                        ...List.generate(
                          mockPhotos.length,
                          (index) => _PhotoPreviewTile(
                            label: 'Foto ${index + 1}',
                            onRemove: () => _removePhoto(index),
                          ),
                        ),
                      ],
                    ),
                    if (mockPhotos.isEmpty) ...[
                      const SizedBox(height: 14),
                      const Text(
                        'Nenhuma foto adicionada ainda.',
                        style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  onPressed: () {
                    // salvar cadastro
                  },
                  child: const Text(
                    'Salvar veículo',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
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

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => Navigator.of(context).maybePop(),
      child: const Padding(
        padding: EdgeInsets.all(4),
        child: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;

  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _DarkTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  const _DarkTextField({
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.maxLength,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      decoration: InputDecoration(
        counterStyle: const TextStyle(
          color: Color(0xFF8E8E8E),
          fontSize: 12,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF8E8E8E),
          fontSize: 15,
        ),
        filled: true,
        fillColor: const Color(0xFF1D1D1D),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(
            color: Color(0xFF2A2A2A),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(
            color: Color(0xFF4B4B4B),
          ),
        ),
      ),
    );
  }
}

class _AddPhotoTile extends StatelessWidget {
  final VoidCallback onTap;

  const _AddPhotoTile({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 104,
        height: 104,
        decoration: BoxDecoration(
          color: const Color(0xFF1D1D1D),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFF2A2A2A),
            style: BorderStyle.solid,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_a_photo_outlined,
              color: Colors.white,
              size: 28,
            ),
            SizedBox(height: 8),
            Text(
              'Adicionar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhotoPreviewTile extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const _PhotoPreviewTile({
    required this.label,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 104,
          height: 104,
          decoration: BoxDecoration(
            color: const Color(0xFF242424),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF2A2A2A)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.directions_car_filled_rounded,
                color: Colors.white70,
                size: 30,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -6,
          right: -6,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF2A2A2A)),
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
