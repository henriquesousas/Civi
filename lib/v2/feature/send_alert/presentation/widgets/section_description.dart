import 'package:flutter/material.dart';

class SectionDescription extends StatelessWidget {
  final String selectedCategory;
  final TextEditingController controller;
  final VoidCallback onMicPressed;
  final ValueChanged<String> onChanged;

  const SectionDescription({
    super.key,
    required this.selectedCategory,
    required this.controller,
    required this.onMicPressed,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Descreva the $selectedCategory alerta',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Adicione detalhes para que as pessoas próximas possam entender melhor o que está acontecendo.',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: controller,
            onChanged: onChanged,
            maxLength: 300,
            minLines: 4,
            maxLines: 8,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Digite aqui...',
              hintStyle: const TextStyle(color: Colors.white38),
              filled: true,
              fillColor: const Color(0xFF1A1A1A),
              contentPadding: const EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              counterStyle: const TextStyle(color: Colors.white54),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  onPressed: onMicPressed,
                  icon: const Icon(
                    Icons.mic_rounded,
                    color: Colors.white,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFFFF2D55),
                  ),
                ),
              ),
              suffixIconConstraints: const BoxConstraints(
                minHeight: 48,
                minWidth: 56,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
