import 'package:flutter/material.dart';

class TestPageDark extends StatefulWidget {
  const TestPageDark({super.key});

  @override
  State<TestPageDark> createState() => _TestPageDarkState();
}

class _TestPageDarkState extends State<TestPageDark> {
  // Dark palette (Kotto)
  static const _bg = Color(0xFF0B1220);
  static const _surface = Color(0xFF111B2E);
  static const _surface2 = Color(0xFF0F1728);

  static const _ink = Color(0xFFEAF0FF);
  static const _muted = Color(0xFF9AA8D1);

  static const _primary = Color(0xFF2157F8);
  static const _divider = Color(0xFF1C2A46);
  static const _outline = Color(0xFF1B2742);

  final TextEditingController searchCtrl = TextEditingController();
  late final List<_FaqSection> sections = _buildSections();

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final q = searchCtrl.text.trim().toLowerCase();

    final filtered = sections
        .map((s) {
          final items = s.items.where((i) {
            final t = '${i.question} ${i.answer}'.toLowerCase();
            return q.isEmpty || t.contains(q);
          }).toList();
          return s.copyWith(items: items);
        })
        .where((s) => s.items.isNotEmpty)
        .toList();

    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: _surface2,
        title: const Text(
          'Perguntas frequentes',
          style: TextStyle(
            color: _ink,
            fontWeight: FontWeight.w800,
          ),
        ),
        iconTheme: const IconThemeData(color: _ink),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          _HeaderCardDark(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Como podemos ajudar?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Pesquise e encontre respostas rápidas sobre cadastro de itens, '
                  'ocorrências, mapa, filtros e privacidade.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(255, 255, 255, 0.85),
                  ),
                ),
                const SizedBox(height: 16),
                _SearchFieldDark(
                  controller: searchCtrl,
                  hint: 'Pesquisar nas perguntas…',
                  onChanged: (_) => setState(() {}),
                  onClear: () {
                    searchCtrl.clear();
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          if (filtered.isEmpty) ...[
            _EmptyStateDark(
              query: searchCtrl.text.trim(),
              onClear: () {
                searchCtrl.clear();
                setState(() {});
              },
            ),
          ] else ...[
            for (final s in filtered) ...[
              _SectionTitleDark(s.title),
              _FaqCardDark(
                child: Column(
                  children: [
                    for (int i = 0; i < s.items.length; i++) ...[
                      _FaqTileDark(
                        item: s.items[i],
                        accentColor: s.accentColor,
                      ),
                      if (i != s.items.length - 1)
                        const Divider(
                          height: 1,
                          indent: 18,
                          endIndent: 18,
                          color: _divider,
                        ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ],
          const SizedBox(height: 8),
          _SupportCardDark(
            onContact: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Abrir suporte (fake)')),
              );
            },
            onSuggest: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Enviar sugestão (fake)')),
              );
            },
          ),
        ],
      ),
    );
  }

  List<_FaqSection> _buildSections() {
    return [
      _FaqSection(
        title: 'Conta & acesso',
        accentColor: _primary,
        items: const [
          _FaqItem(
            question: 'Preciso fazer login para usar o app?',
            answer:
                'Não. Você pode continuar sem login. Porém, para salvar itens no seu perfil, '
                'editar ocorrências e acompanhar histórico, o login é necessário.',
          ),
          _FaqItem(
            question: 'Por que o login é apenas com Google?',
            answer:
                'Nesta fase inicial (beta), usamos o Google para simplificar e aumentar a segurança do acesso. '
                'No futuro, podemos adicionar outras formas de login.',
          ),
          _FaqItem(
            question: 'Esqueci meu acesso. O que faço?',
            answer:
                'Como o login é com Google, basta entrar novamente com a mesma conta Google usada anteriormente.',
          ),
        ],
      ),
      _FaqSection(
        title: 'Meus itens',
        accentColor: const Color(0xFF43A047),
        items: const [
          _FaqItem(
            question: 'Quais itens posso cadastrar?',
            answer:
                'Você pode cadastrar veículos (carro/moto) e celular. O objetivo é facilitar '
                'a identificação em caso de roubo/furto.',
          ),
          _FaqItem(
            question: 'Por que meu item fica “Pendente” após cadastrar?',
            answer:
                'Todo item cadastrado passa por uma verificação antes de aparecer no app. '
                'Isso ajuda a reduzir fraudes e melhorar a qualidade das informações.',
          ),
          _FaqItem(
            question: 'Posso adicionar mais de uma foto?',
            answer:
                'Sim. Você pode adicionar 1 ou mais fotos. Fotos nítidas aumentam a chance de identificação.',
          ),
          _FaqItem(
            question: 'Como funciona IMEI no cadastro de celular?',
            answer:
                'Você pode digitar o IMEI ou ler automaticamente usando a câmera (scanner). '
                'O IMEI é um identificador importante para comunicar às operadoras e autoridades.',
          ),
        ],
      ),
      _FaqSection(
        title: 'Ocorrências',
        accentColor: const Color(0xFFE53935),
        items: const [
          _FaqItem(
            question: 'Qual a diferença entre “Imediato” e “Detalhado”?',
            answer:
                'Imediato: para quando acabou de acontecer — registra rapidamente e você pode completar detalhes depois.\n\n'
                'Detalhado: você informa data/hora, cidade, bairro, endereço aproximado e como aconteceu.',
          ),
          _FaqItem(
            question: 'Quem pode cancelar ou marcar como recuperado?',
            answer:
                'Apenas o usuário que registrou a ocorrência pode cancelar ou marcar como recuperado. '
                'Essas ações ficam na “Danger Zone” para evitar alterações indevidas.',
          ),
          _FaqItem(
            question: 'Como compartilhar uma ocorrência?',
            answer:
                'Na tela de detalhes da ocorrência, você pode compartilhar (ex.: WhatsApp) com o resumo do caso. '
                'Isso ajuda a avisar pessoas próximas e ampliar a rede de atenção.',
          ),
          _FaqItem(
            question: 'Devo fazer boletim de ocorrência?',
            answer:
                'Sim. Recomendamos fazer o BO o mais rápido possível. O Kotto ajuda com informação e organização, '
                'mas não substitui o registro oficial.',
          ),
        ],
      ),
      _FaqSection(
        title: 'Mapa & filtros',
        accentColor: const Color(0xFFFB8C00),
        items: const [
          _FaqItem(
            question: 'O que significa “Raio local personalizado”?',
            answer:
                'Você define uma distância (ex.: 1 km, 2 km) e o mapa mostra apenas ocorrências dentro dessa área.',
          ),
          _FaqItem(
            question: 'O que é “Filtrar por região visível”?',
            answer:
                'Mostra ocorrências com base na área que está visível no mapa. '
                'Ao dar zoom e arrastar, você altera a região de busca.',
          ),
          _FaqItem(
            question: 'Por que alguns pins mostram placa e outros um ícone?',
            answer:
                'Para veículos, o pin mostra a placa. Para celular, exibimos um ícone por privacidade e clareza visual.',
          ),
        ],
      ),
      _FaqSection(
        title: 'Privacidade & segurança',
        accentColor: const Color(0xFF5F85FF),
        items: const [
          _FaqItem(
            question: 'Meus dados ficam públicos?',
            answer:
                'Exibimos apenas informações necessárias para alertas e identificação. '
                'Dados sensíveis podem ser ocultados/limitados dependendo do tipo de item.',
          ),
          _FaqItem(
            question: 'Posso usar o app sem informar dados pessoais?',
            answer:
                'Sim. No modo sem login, você navega e consulta. Para cadastrar itens e registrar ocorrências, '
                'pode ser necessário fornecer informações mínimas.',
          ),
        ],
      ),
      _FaqSection(
        title: 'Suporte & sugestões',
        accentColor: const Color(0xFF2B5BEE),
        items: const [
          _FaqItem(
            question: 'O app ainda está em desenvolvimento. Como posso ajudar?',
            answer: 'Use o app, compartilhe com a comunidade e envie feedback. '
                'Quanto mais pessoas usando, mais útil e preciso ele se torna.',
          ),
          _FaqItem(
            question: 'Encontrei um erro. O que faço?',
            answer:
                'Envie uma descrição do problema e, se possível, prints. Isso acelera a correção.',
          ),
        ],
      ),
    ];
  }
}

/* ------------------------------ Dark Widgets ------------------------------ */

class _HeaderCardDark extends StatelessWidget {
  final Widget child;
  const _HeaderCardDark({required this.child});

  static const _primary = Color(0xFF2157F8);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _primary,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: _primary.withOpacity(0.22),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: child,
      ),
    );
  }
}

class _SearchFieldDark extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const _SearchFieldDark({
    required this.controller,
    required this.hint,
    required this.onChanged,
    required this.onClear,
  });

  static const _primary = Color(0xFF2157F8);
  static const _ink = Color(0xFFEAF0FF);
  static const _muted = Color(0xFF9AA8D1);

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Builder(
        builder: (context) {
          final hasFocus = Focus.of(context).hasFocus;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFF0F1728), // dark "input"
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: hasFocus
                    ? Colors.white.withOpacity(0.50)
                    : Colors.white.withOpacity(0.18),
                width: 1.2,
              ),
            ),
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                color: _ink,
                fontSize: 13.5,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                prefixIcon: const Icon(Icons.search, color: _muted),
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.70),
                  fontWeight: FontWeight.w600,
                ),
                suffixIcon: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: controller,
                  builder: (_, value, __) {
                    if (value.text.isEmpty) return const SizedBox.shrink();
                    return IconButton(
                      onPressed: onClear,
                      icon: const Icon(Icons.close,
                          size: 18, color: Colors.white70),
                      splashRadius: 18,
                      tooltip: 'Limpar',
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SectionTitleDark extends StatelessWidget {
  final String text;
  const _SectionTitleDark(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 10),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Color(0xFF9AA8D1),
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _FaqCardDark extends StatelessWidget {
  final Widget child;
  const _FaqCardDark({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111B2E),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF1B2742)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _FaqTileDark extends StatefulWidget {
  final _FaqItem item;
  final Color accentColor;

  const _FaqTileDark({required this.item, required this.accentColor});

  @override
  State<_FaqTileDark> createState() => _FaqTileDarkState();
}

class _FaqTileDarkState extends State<_FaqTileDark> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        onExpansionChanged: (v) => setState(() => expanded = v),
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
        leading: _LeadingIconDark(
          color: widget.accentColor,
          expanded: expanded,
        ),
        title: Text(
          widget.item.question,
          style: const TextStyle(
            fontSize: 13.8,
            fontWeight: FontWeight.w900,
            color: Color(0xFFEAF0FF),
            height: 1.2,
          ),
        ),
        trailing: Icon(
          expanded ? Icons.remove : Icons.add,
          color: const Color(0xFF9AA8D1),
        ),
        children: [
          Text(
            widget.item.answer,
            style: const TextStyle(
              fontSize: 13.2,
              height: 1.35,
              fontWeight: FontWeight.w600,
              color: Color(0xFF9AA8D1),
            ),
          ),
        ],
      ),
    );
  }
}

class _LeadingIconDark extends StatelessWidget {
  final Color color;
  final bool expanded;

  const _LeadingIconDark({required this.color, required this.expanded});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: expanded ? color.withOpacity(0.18) : const Color(0xFF0F1728),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: expanded ? color.withOpacity(0.35) : const Color(0xFF1B2742),
        ),
      ),
      child: Icon(
        expanded ? Icons.question_answer_outlined : Icons.help_outline,
        color: expanded ? color : const Color(0xFFEAF0FF),
        size: 20,
      ),
    );
  }
}

class _SupportCardDark extends StatelessWidget {
  final VoidCallback onContact;
  final VoidCallback onSuggest;

  const _SupportCardDark({
    required this.onContact,
    required this.onSuggest,
  });

  static const _primary = Color(0xFF2157F8);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF111B2E),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF1B2742)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.support_agent, color: _primary),
              SizedBox(width: 10),
              Text(
                'Ainda com dúvidas?',
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFEAF0FF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Envie uma mensagem para o suporte ou compartilhe uma sugestão para melhorar o app.',
            style: TextStyle(
              fontSize: 13,
              height: 1.35,
              fontWeight: FontWeight.w600,
              color: Color(0xFF9AA8D1),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onSuggest,
                  icon: const Icon(Icons.lightbulb_outline, size: 18),
                  label: const Text(
                    'Sugestão',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: _primary,
                    side: BorderSide(color: _primary.withOpacity(0.35)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onContact,
                  icon: const Icon(Icons.chat_outlined, size: 18),
                  label: const Text(
                    'Suporte',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EmptyStateDark extends StatelessWidget {
  final String query;
  final VoidCallback onClear;

  const _EmptyStateDark({required this.query, required this.onClear});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF111B2E),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF1B2742)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFF0F1728),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFF1B2742)),
            ),
            child:
                const Icon(Icons.search_off_outlined, color: Color(0xFF9AA8D1)),
          ),
          const SizedBox(height: 12),
          const Text(
            'Nada encontrado',
            style: TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.w900,
              color: Color(0xFFEAF0FF),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Não encontramos resultados para "$query". Tente outras palavras.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              height: 1.35,
              fontWeight: FontWeight.w600,
              color: Color(0xFF9AA8D1),
            ),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: onClear,
            child: const Text(
              'Limpar pesquisa',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}

/* ------------------------------ Models ------------------------------ */

class _FaqSection {
  final String title;
  final Color accentColor;
  final List<_FaqItem> items;

  const _FaqSection({
    required this.title,
    required this.accentColor,
    required this.items,
  });

  _FaqSection copyWith({List<_FaqItem>? items}) {
    return _FaqSection(
      title: title,
      accentColor: accentColor,
      items: items ?? this.items,
    );
  }
}

class _FaqItem {
  final String question;
  final String answer;

  const _FaqItem({
    required this.question,
    required this.answer,
  });
}
