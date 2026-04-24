import 'package:flutter/material.dart';

class TestPhoneRegisterPage extends StatefulWidget {
  const TestPhoneRegisterPage({super.key});

  @override
  State<TestPhoneRegisterPage> createState() => _TestPhoneRegisterPageState();
}

class _TestPhoneRegisterPageState extends State<TestPhoneRegisterPage> {
  final _nameController = TextEditingController();
  final _brandController = TextEditingController();
  final _colorController = TextEditingController();
  final _imeiController = TextEditingController();
  final _notesController = TextEditingController();

  static const int maxNotesLength = 300;

  void _showImeiInfo() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              const Icon(Icons.info_outline, color: Colors.white, size: 28),
              const SizedBox(height: 12),
              const Text(
                'O que é IMEI?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'O IMEI é um número único que identifica o seu celular. '
                'Ele é essencial para bloquear o aparelho em caso de roubo.\n\n'
                'Você pode encontrar o IMEI digitando *#06# no telefone.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDCEAF7),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Entendi'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Colors.black;
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
                'Cadastrar celular',
                style: TextStyle(
                  color: primaryTextColor,
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Informe os dados do aparelho para facilitar a identificação.',
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 28),

              const _SectionLabel('Nome do aparelho'),
              const SizedBox(height: 10),
              _DarkTextField(
                controller: _nameController,
                hintText: 'Ex: iPhone 13 Pro',
              ),

              const SizedBox(height: 22),
              const _SectionLabel('Marca'),
              const SizedBox(height: 10),
              _DarkTextField(
                controller: _brandController,
                hintText: 'Ex: Apple, Samsung',
              ),

              const SizedBox(height: 22),
              const _SectionLabel('Cor'),
              const SizedBox(height: 10),
              _DarkTextField(
                controller: _colorController,
                hintText: 'Ex: Preto',
              ),

              const SizedBox(height: 24),

              /// IMEI + botão info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const _SectionLabel('IMEI'),
                  TextButton.icon(
                    onPressed: _showImeiInfo,
                    icon: const Icon(Icons.info_outline, size: 16),
                    label: const Text('O que é?'),
                    style: TextButton.styleFrom(
                      foregroundColor: accentColor,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              _DarkTextField(
                controller: _imeiController,
                hintText: 'Digite o IMEI',
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 24),
              const _SectionLabel('Observações'),
              const SizedBox(height: 6),
              const Text(
                'Descreva detalhes importantes do aparelho.',
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 10),
              _DarkTextField(
                controller: _notesController,
                hintText:
                    'Ex: Tela trincada, com capinha azul, película aplicada.',
                maxLines: 5,
                maxLength: maxNotesLength,
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Salvar celular',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
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
      onTap: () => Navigator.pop(context),
      child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
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
  final TextInputType? keyboardType;

  const _DarkTextField({
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFF8E8E8E)),
        filled: true,
        fillColor: const Color(0xFF1D1D1D),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(color: Color(0xFF2A2A2A)),
        ),
      ),
    );
  }
}
