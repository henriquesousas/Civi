import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TesteNicknamePage extends StatefulWidget {
  const TesteNicknamePage({super.key});

  @override
  State<TesteNicknamePage> createState() => _TesteNicknamePageState();
}

class _TesteNicknamePageState extends State<TesteNicknamePage> {
  // ===== Design tokens (premium, pouco colorido)
  static const _bg = Color(0xFFF5F7FD);
  static const _surface = Colors.white;
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);
  static const _primary = Color(0xFF2B5BEE);

  final _ctrl = TextEditingController();
  final _focus = FocusNode();
  final _rng = Random();

  List<String> suggestions = const [];
  bool showSuggestions = false;

  @override
  void initState() {
    super.initState();
    _ctrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _focus.dispose();
    super.dispose();
  }

  bool get _canContinue => _ctrl.text.trim().length >= 3;

  void _generateSuggestions() {
    final list = _buildNicknames(10);
    setState(() {
      suggestions = list;
      showSuggestions = true;
    });

    // fecha teclado para dar foco na lista
    FocusScope.of(context).unfocus();
  }

  void _selectSuggestion(String value) {
    HapticFeedback.selectionClick();
    setState(() {
      _ctrl.text = value;
      _ctrl.selection = TextSelection.collapsed(offset: value.length);
      showSuggestions = false;
    });
  }

  List<String> _buildNicknames(int count) {
    // ✅ estilo “clean”: 1–2 palavras + número opcional
    const adjectives = [
      'Ágil',
      'Atento',
      'Sábio',
      'Leal',
      'Vigilante',
      'Discreto',
      'Forte',
      'Calmo',
      'Esperto',
      'Valente',
      'Rápido',
      'Certeiro',
      'Seguro',
      'Pronto',
      'Protetor',
      'Justo',
    ];

    const nouns = [
      'Coruja',
      'Guardião',
      'Radar',
      'Sentinela',
      'Alerta',
      'Escudo',
      'Farol',
      'Vigia',
      'Rastro',
      'Sinal',
      'Olho',
      'Ponto',
      'Ronda',
      'Trilha',
    ];

    final set = <String>{};
    while (set.length < count) {
      final a = adjectives[_rng.nextInt(adjectives.length)];
      final n = nouns[_rng.nextInt(nouns.length)];

      final useNumber = _rng.nextBool();
      final number = 10 + _rng.nextInt(89); // 10–98

      final name = useNumber ? '$a $n $number' : '$a $n';
      set.add(name);
    }

    return set.toList();
  }

  Future<void> _continue() async {
    final nick = _ctrl.text.trim();
    if (nick.length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Informe um apelido com pelo menos 3 caracteres.')),
      );
      return;
    }

    Navigator.pop(context, nick); // ✅ retorna para tela anterior
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: _surface,
        surfaceTintColor: _surface,
        iconTheme: const IconThemeData(color: _ink),
        title: const Text(
          'Seu apelido',
          style: TextStyle(color: _ink, fontWeight: FontWeight.w800),
        ),
        actions: [
          TextButton(
            onPressed: _canContinue ? _continue : null,
            style: TextButton.styleFrom(
              foregroundColor: _primary,
              disabledForegroundColor: _muted,
            ),
            child: const Text(
              'Salvar',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
        children: [
          const _InfoHeaderCard(
            title: 'Como você quer ser chamado?',
            subtitle:
                'O apelido aparece na comunidade. Evite dados pessoais como telefone ou endereço.',
          ),
          const SizedBox(height: 14),
          _Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _FieldLabel('Apelido'),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _ctrl,
                    focusNode: _focus,
                    maxLength: 24,
                    textInputAction: TextInputAction.done,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[A-Za-zÀ-ÿ0-9 '._-]"),
                      ),
                      LengthLimitingTextInputFormatter(24),
                    ],
                    decoration: InputDecoration(
                      hintText: 'Ex: Coruja Atenta',
                      counterStyle: const TextStyle(color: _muted),
                      filled: true,
                      fillColor: const Color(0xFFF5F7FD),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.person_outline_rounded),
                      suffixIcon: _ctrl.text.trim().isEmpty
                          ? null
                          : IconButton(
                              tooltip: 'Limpar',
                              onPressed: () => setState(() => _ctrl.clear()),
                              icon: const Icon(Icons.close_rounded),
                            ),
                    ),
                    onSubmitted: (_) => _continue(),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _generateSuggestions,
                          icon: const Icon(Icons.auto_awesome_rounded),
                          label: const Text('Gerar 10 sugestões'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: _ink,
                            side: const BorderSide(color: _border),
                            backgroundColor: _surface,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _canContinue ? _continue : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _primary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            disabledBackgroundColor: _primary.withOpacity(0.35),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'Continuar',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            switchInCurve: Curves.easeOut,
            switchOutCurve: Curves.easeIn,
            child: showSuggestions
                ? _Card(
                    // key: const ValueKey('suggestions'),
                    child: Column(
                      children: [
                        const _CardHeader(
                          title: 'Sugestões automáticas',
                          subtitle: 'Toque para selecionar',
                          icon: Icons.lightbulb_outline_rounded,
                        ),
                        const _ThinDivider(),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: suggestions.length,
                          separatorBuilder: (_, __) =>
                              const _ThinDivider(indent: 16),
                          itemBuilder: (_, i) {
                            final s = suggestions[i];
                            return _SuggestionRow(
                              value: s,
                              onTap: () => _selectSuggestion(s),
                            );
                          },
                        ),
                        const _ThinDivider(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
                          child: Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () =>
                                      setState(() => showSuggestions = false),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: _ink,
                                    side: const BorderSide(color: _border),
                                    backgroundColor: _surface,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: const Text(
                                    'Fechar',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _generateSuggestions,
                                  icon: const Icon(Icons.refresh_rounded),
                                  label: const Text('Gerar outras'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: _primary,
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          const SizedBox(height: 14),
          const _HintCard(
            icon: Icons.shield_outlined,
            title: 'Dica rápida',
            subtitle:
                'Use algo fácil de reconhecer, mas sem informações pessoais. Ex: “Sentinela Azul”.',
          ),
        ],
      ),
    );
  }
}

/* ==================== Components ==================== */

class _Card extends StatelessWidget {
  final Widget child;
  const _Card({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _TesteNicknamePageState._surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _InfoHeaderCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _InfoHeaderCard({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _TesteNicknamePageState._primary.withOpacity(0.10),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: _TesteNicknamePageState._primary.withOpacity(0.18),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _TesteNicknamePageState._primary.withOpacity(0.14),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.badge_outlined,
              color: _TesteNicknamePageState._primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: _TesteNicknamePageState._ink,
                    fontSize: 14.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF5B6AA6),
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: _TesteNicknamePageState._muted,
        letterSpacing: 1.2,
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _CardHeader({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: _TesteNicknamePageState._primary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: _TesteNicknamePageState._primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w900,
                    color: _TesteNicknamePageState._ink,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: _TesteNicknamePageState._muted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ThinDivider extends StatelessWidget {
  final double indent;
  const _ThinDivider({this.indent = 0});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: _TesteNicknamePageState._border,
      indent: indent,
    );
  }
}

class _SuggestionRow extends StatelessWidget {
  final String value;
  final VoidCallback onTap;

  const _SuggestionRow({
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: _TesteNicknamePageState._ink.withOpacity(0.06),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.auto_awesome_rounded,
                size: 18,
                color: _TesteNicknamePageState._ink,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: _TesteNicknamePageState._ink,
                  fontSize: 14.5,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: _TesteNicknamePageState._primary.withOpacity(0.10),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.check_rounded,
                size: 18,
                color: _TesteNicknamePageState._primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HintCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _HintCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: _TesteNicknamePageState._border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: _TesteNicknamePageState._muted),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: _TesteNicknamePageState._ink,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: _TesteNicknamePageState._muted,
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
