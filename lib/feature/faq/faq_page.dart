import 'package:deehelp/app_name.dart';
import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/empty/empty_state.dart';
import 'faq_item.dart';
import 'faq_section.dart';
import 'widgets/faq_card.dart';
import 'widgets/faq_header_card.dart';
import 'widgets/faq_search_field.dart';
import 'widgets/faq_section_title.dart';
import 'widgets/faq_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final TextEditingController searchCtrl = TextEditingController();
  late List<FaqSection> sections = _buildSections(context);

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
      appBar: DefaultAppBar(
        press: () => context.pop(),
        title: 'Perguntas frequentes',
        showBackButton: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          FaqHeaderCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Como podemos ajudar?',
                  style: context.appTextOld.headermd.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: SpacingSize.sm),
                Text(
                  'Encontre respostas rápidas sobre cadastro de itens, ocorrências, mapa e privacidade.',
                  style: context.appTextOld.bodySmall.copyWith(
                    color: Colors.white.withValues(alpha: 0.85),
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: SpacingSize.md),
                FaqSearhField(
                  controller: searchCtrl,
                  hint: 'Pesquisar nas perguntas',
                  onChanged: (_) => setState(() {}),
                  onClear: () => setState(() {
                    searchCtrl.clear();
                  }),
                ),
              ],
            ),
          ),
          const SizedBox(height: SpacingSize.md),
          if (filtered.isEmpty) ...[
            EmptyState(
              subtitle:
                  'Não encontramos resultados para "${searchCtrl.text.trim()}". Tente outras palavras.',
              actionTitle: "Limpar pesquisa",
              press: () {
                searchCtrl.clear();
                setState(() {});
              },
            )
          ] else ...[
            for (final s in filtered) ...[
              FaqSectionTitle(s.title),
              const SizedBox(height: SpacingSize.md),
              FaqCard(
                child: Column(
                  children: [
                    for (int i = 0; i < s.items.length; i++) ...[
                      FaqTile(
                        item: s.items[i],
                        accentColor: s.accentColor,
                      ),
                      if (i != s.items.length - 1)
                        Divider(
                          height: 1,
                          indent: 18,
                          endIndent: 18,
                          color: context.outline,
                        ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: SpacingSize.md),
            ],
          ],
          const SizedBox(height: SpacingSize.md),
          // FaqSupportCard(
          //   onContact: () {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       const SnackBar(content: Text('Abrir suporte (fake)')),
          //     );
          //   },
          //   onSuggest: () {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       const SnackBar(content: Text('Enviar sugestão (fake)')),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }

  List<FaqSection> _buildSections(BuildContext context) {
    return [
      FaqSection(
        title: 'Conta & acesso',
        accentColor: context.primaryColor,
        items: const [
          FaqItem(
            question: 'Preciso fazer login para usar o app?',
            answer:
                'Não. Você pode continuar sem login. Porém, para salvar itens no seu perfil, '
                'editar ocorrências e acompanhar histórico, o login é necessário.',
          ),
          FaqItem(
            question: 'Por que o login é apenas com Google?',
            answer:
                'Nesta fase inicial (beta), usamos o Google para simplificar e aumentar a segurança do acesso. '
                'No futuro, podemos adicionar outras formas de login.',
          ),
          FaqItem(
            question: 'Esqueci meu acesso. O que faço?',
            answer:
                'Como o login é com Google, basta entrar novamente com a mesma conta Google usada anteriormente.',
          ),
        ],
      ),
      const FaqSection(
        title: 'Meus itens',
        accentColor: Color(0xFF43A047),
        items: [
          FaqItem(
            question: 'Quais itens posso cadastrar?',
            answer:
                'Você pode cadastrar veículos (carro/moto) e celular. O objetivo é facilitar '
                'a identificação em caso de roubo/furto.',
          ),
          FaqItem(
            question: 'Por que meu item fica “Pendente” após cadastrar?',
            answer:
                'Todo item cadastrado passa por uma verificação antes de aparecer no app. '
                'Isso ajuda a reduzir fraudes e melhorar a qualidade das informações.',
          ),
          FaqItem(
            question: 'Posso adicionar mais de uma foto?',
            answer:
                'Sim. Você pode adicionar 1 ou mais fotos. Fotos nítidas aumentam a chance de identificação.',
          ),
          FaqItem(
            question: 'Como funciona IMEI no cadastro de celular?',
            answer:
                'Você pode digitar o IMEI ou ler automaticamente usando a câmera (scanner). '
                'O IMEI é um identificador importante para comunicar às operadoras e autoridades.',
          ),
        ],
      ),
      FaqSection(
        title: 'Ocorrências',
        accentColor: const Color(0xFFE53935),
        items: [
          const FaqItem(
            question: 'Qual a diferença entre “Imediato” e “Detalhado”?',
            answer:
                'Imediato: para quando acabou de acontecer — registra rapidamente e você pode completar detalhes depois.\n\n'
                'Detalhado: você informa data/hora, cidade, bairro, endereço aproximado e como aconteceu.',
          ),
          const FaqItem(
            question: 'Quem pode cancelar ou marcar como recuperado?',
            answer:
                'Apenas o usuário que registrou a ocorrência pode cancelar ou marcar como recuperado. '
                'Essas ações ficam na “Danger Zone” para evitar alterações indevidas.',
          ),
          const FaqItem(
            question: 'Como compartilhar uma ocorrência?',
            answer:
                'Na tela de detalhes da ocorrência, você pode compartilhar (ex.: WhatsApp) com o resumo do caso. '
                'Isso ajuda a avisar pessoas próximas e ampliar a rede de atenção.',
          ),
          FaqItem(
            question: 'Devo fazer boletim de ocorrência?',
            answer:
                'Sim. Recomendamos fazer o BO o mais rápido possível. O ${AppName.appName} ajuda com informação e organização, '
                'mas não substitui o registro oficial.',
          ),
        ],
      ),
      // const FaqSection(
      //   title: 'Mapa & filtros',
      //   accentColor: Color(0xFFFB8C00),
      //   items: [
      //     FaqItem(
      //       question: 'O que significa “Raio local personalizado”?',
      //       answer:
      //           'Você define uma distância (ex.: 1 km, 2 km) e o mapa mostra apenas ocorrências dentro dessa área.',
      //     ),
      //     FaqItem(
      //       question: 'O que é “Filtrar por região visível”?',
      //       answer:
      //           'Mostra ocorrências com base na área que está visível no mapa. '
      //           'Ao dar zoom e arrastar, você altera a região de busca.',
      //     ),
      //     FaqItem(
      //       question: 'Por que alguns pins mostram placa e outros um ícone?',
      //       answer:
      //           'Para veículos, o pin mostra a placa. Para celular, exibimos um ícone por privacidade e clareza visual.',
      //     ),
      //   ],
      // ),
      const FaqSection(
        title: 'Privacidade & segurança',
        accentColor: Color(0xFF5F85FF),
        items: [
          FaqItem(
            question: 'Meus dados ficam públicos?',
            answer:
                'Exibimos apenas informações necessárias para alertas e identificação. '
                'Dados sensíveis podem ser ocultados/limitados dependendo do tipo de item.',
          ),
          FaqItem(
            question: 'Posso usar o app sem informar dados pessoais?',
            answer:
                'Sim. No modo sem login, você navega e consulta. Para cadastrar itens e registrar ocorrências, '
                'pode ser necessário fornecer informações mínimas.',
          ),
        ],
      ),
      const FaqSection(
        title: 'Suporte & sugestões',
        accentColor: Color(0xFF2B5BEE),
        items: [
          FaqItem(
            question: 'O app ainda está em desenvolvimento. Como posso ajudar?',
            answer: 'Use o app, compartilhe com a comunidade e envie feedback. '
                'Quanto mais pessoas usando, mais útil e preciso ele se torna.',
          ),
          FaqItem(
            question: 'Encontrei um erro. O que faço?',
            answer:
                'Envie uma descrição do problema e, se possível, prints. Isso acelera a correção.',
          ),
        ],
      ),
    ];
  }
}
