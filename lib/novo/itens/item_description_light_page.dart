import 'package:flutter/material.dart';

class ItemDescriptionPageLight extends StatefulWidget {
  const ItemDescriptionPageLight({super.key});

  @override
  State<ItemDescriptionPageLight> createState() =>
      _ItemDescriptionPageLightState();
}

class _ItemDescriptionPageLightState extends State<ItemDescriptionPageLight> {
  static const Color primaryColor = Color(0xFF2B5BEE);
  static const int maxLength = 300;

  final TextEditingController _controller = TextEditingController();

  int get currentLength => _controller.text.length;
  bool get canContinue => _controller.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF5F7FA),
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Cadastro de item',
          style: theme.textTheme.titleLarge?.copyWith(
            color: const Color(0xFF111827),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            /// SCROLL
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _StepHeader(
                      currentStep: 3,
                      totalSteps: 3,
                      primaryColor: primaryColor,
                    ),
                    const SizedBox(height: 28),

                    Text(
                      'Adicione uma descrição do veículo',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: const Color(0xFF111827),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Text(
                      'Informe características que possam ajudar na identificação, como amassados, adesivos, riscos ou acessórios.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF6B7280),
                        height: 1.45,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// INFO BOX
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: primaryColor.withOpacity(0.25),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: primaryColor,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Esses detalhes ajudam a reconhecer o veículo mais rápido.',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: const Color(0xFF111827),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      'Descrição',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF111827),
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// INPUT
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: currentLength > 0
                              ? primaryColor
                              : const Color(0xFFE5E7EB),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            textSelectionTheme: const TextSelectionThemeData(
                              cursorColor: Color(0xFF2B5BEE),
                              selectionColor: Color(0x332B5BEE),
                              selectionHandleColor: Color(0xFF2B5BEE),
                            ),
                          ),
                          child: TextField(
                            controller: _controller,
                            maxLength: maxLength,
                            maxLines: 6,
                            minLines: 6,
                            cursorColor: primaryColor,
                            style: const TextStyle(
                              color: Color(0xFF111827),
                              fontSize: 15,
                              height: 1.45,
                            ),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText:
                                  'Ex.: Amassado no para-choque traseiro, risco na lateral direita...',
                              hintStyle: TextStyle(
                                color: Color(0xFF9CA3AF),
                                fontSize: 15,
                                height: 1.45,
                              ),
                              counterText: '',
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.all(16),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '$currentLength/$maxLength',
                        style: TextStyle(
                          color: currentLength >= maxLength
                              ? Colors.orange
                              : const Color(0xFF9CA3AF),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      'Exemplos do que informar',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF111827),
                      ),
                    ),

                    const SizedBox(height: 12),

                    _ExampleChip(text: 'Amassado no para-lama'),
                    const SizedBox(height: 10),
                    _ExampleChip(text: 'Adesivo no vidro traseiro'),
                    const SizedBox(height: 10),
                    _ExampleChip(text: 'Risco na porta esquerda'),
                    const SizedBox(height: 10),
                    _ExampleChip(text: 'Retrovisor diferente'),
                  ],
                ),
              ),
            ),

            /// BOTÃO FIXO
            Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.black.withOpacity(0.06),
                  ),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: canContinue ? _onContinue : null,
                  style: FilledButton.styleFrom(
                    backgroundColor: primaryColor,
                    disabledBackgroundColor: const Color(0xFFE5E7EB),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Continuar',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onContinue() {
    debugPrint(_controller.text);
  }
}

class _StepHeader extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final Color primaryColor;

  const _StepHeader({
    required this.currentStep,
    required this.totalSteps,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final progress = currentStep / totalSteps;

    return Column(
      children: [
        Center(
          child: Text(
            '$currentStep de $totalSteps',
            style: const TextStyle(color: Color(0xFF6B7280)),
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: const Color(0xFFE5E7EB),
            valueColor: AlwaysStoppedAnimation(primaryColor),
          ),
        ),
      ],
    );
  }
}

class _ExampleChip extends StatelessWidget {
  final String text;

  const _ExampleChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          const Icon(Icons.check, size: 18, color: Color(0xFF2B5BEE)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF374151),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
