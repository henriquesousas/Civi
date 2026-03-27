import 'package:flutter/material.dart';

class ItemDescriptionPage extends StatefulWidget {
  const ItemDescriptionPage({super.key});

  @override
  State<ItemDescriptionPage> createState() => _ItemDescriptionPageState();
}

class _ItemDescriptionPageState extends State<ItemDescriptionPage> {
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
      backgroundColor: const Color(0xFF121417),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF121417),
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Cadastro de item',
          style: theme.textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
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
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Informe características que possam ajudar na identificação, como amassados, adesivos, riscos, arranhões, acessórios ou qualquer detalhe visível.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white70,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: primaryColor.withOpacity(0.28),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            color: primaryColor,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Esses detalhes podem fazer diferença para reconhecer o veículo com mais rapidez.',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.white,
                                height: 1.45,
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
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.035),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: currentLength > 0
                              ? primaryColor.withOpacity(0.75)
                              : Colors.white.withOpacity(0.08),
                        ),
                      ),
                      child: TextField(
                        controller: _controller,
                        maxLength: maxLength,
                        maxLines: 7,
                        minLines: 7,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          height: 1.45,
                        ),
                        decoration: InputDecoration(
                          hintText:
                              'Ex.: Possui amassado no para-choque traseiro, risco na lateral direita e adesivo no vidro traseiro.',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.38),
                            height: 1.45,
                          ),
                          counterText: '',
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '$currentLength/$maxLength',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: currentLength >= maxLength
                              ? Colors.orangeAccent
                              : Colors.white54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    Text(
                      'Exemplos do que informar',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _ExampleChip(
                      text: 'Amassado no para-lama',
                      primaryColor: primaryColor,
                    ),
                    const SizedBox(height: 10),
                    _ExampleChip(
                      text: 'Adesivo no vidro traseiro',
                      primaryColor: primaryColor,
                    ),
                    const SizedBox(height: 10),
                    _ExampleChip(
                      text: 'Risco na porta esquerda',
                      primaryColor: primaryColor,
                    ),
                    const SizedBox(height: 10),
                    _ExampleChip(
                      text: 'Retrovisor diferente do original',
                      primaryColor: primaryColor,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            /// botão fixo no rodapé
            Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              decoration: BoxDecoration(
                color: const Color(0xFF121417),
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withOpacity(0.06),
                  ),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: canContinue ? _onContinue : null,
                  style: FilledButton.styleFrom(
                    backgroundColor: primaryColor,
                    disabledBackgroundColor: Colors.white.withOpacity(0.08),
                    foregroundColor: Colors.white,
                    disabledForegroundColor: Colors.white38,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Continuar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
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
    final description = _controller.text.trim();
    debugPrint('Descrição: $description');
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
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: Colors.white.withOpacity(0.08),
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
          ),
        ),
      ],
    );
  }
}

class _ExampleChip extends StatelessWidget {
  final String text;
  final Color primaryColor;

  const _ExampleChip({
    required this.text,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.07),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_outline_rounded,
            color: primaryColor,
            size: 18,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
