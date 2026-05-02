import 'dart:math';

import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:deehelp/v2/core/widgets/buttons/export_buttons.dart';
import 'package:deehelp/v2/core/widgets/cards/export_cards.dart';
import 'package:deehelp/v2/core/widgets/ui_thin_divider.dart';
import 'package:deehelp/v2/feature/profile/nickname/widgets/nickname_suggetion_row.dart';
import 'package:deehelp/v2/feature/profile/nickname/widgets/header_suggestion_nickname.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class AddNicknamePage extends StatefulWidget {
  const AddNicknamePage({super.key});

  @override
  State<AddNicknamePage> createState() => _AddNicknamePageState();
}

class _AddNicknamePageState extends State<AddNicknamePage> {
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

  void _generateSuggestions() {
    final list = _buildNicknames(10);
    setState(() {
      suggestions = list;
      showSuggestions = true;
    });

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

  // Future<void> _continue() async {
  //   final nick = _ctrl.text.trim();
  //   if (nick.length < 3) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Color(0xFF182235),
  //         content: const Text(
  //           'Informe um apelido com pelo menos 3 caracteres.',
  //           style: TextStyle(color: Color(0xFFF3F7FF)),
  //         ),
  //         behavior: SnackBarBehavior.floating,
  //       ),
  //     );
  //     return;
  //   }

  //   List<String> _buildNicknames(int count) {
  //     const adjectives = [
  //       'Ágil',
  //       'Atento',
  //       'Sábio',
  //       'Leal',
  //       'Vigilante',
  //       'Discreto',
  //       'Forte',
  //       'Calmo',
  //       'Esperto',
  //       'Valente',
  //       'Rápido',
  //       'Certeiro',
  //       'Seguro',
  //       'Pronto',
  //       'Protetor',
  //       'Justo',
  //     ];

  //     const nouns = [
  //       'Coruja',
  //       'Guardião',
  //       'Radar',
  //       'Sentinela',
  //       'Alerta',
  //       'Escudo',
  //       'Farol',
  //       'Vigia',
  //       'Rastro',
  //       'Sinal',
  //       'Olho',
  //       'Ponto',
  //       'Ronda',
  //       'Trilha',
  //     ];

  //     final set = <String>{};
  //     while (set.length < count) {
  //       final a = adjectives[_rng.nextInt(adjectives.length)];
  //       final n = nouns[_rng.nextInt(nouns.length)];

  //       final useNumber = _rng.nextBool();
  //       final number = 10 + _rng.nextInt(89);

  //       final name = useNumber ? '$a $n $number' : '$a $n';
  //       set.add(name);
  //     }

  //     return set.toList();
  //   }
  // }

  List<String> _buildNicknames(int count) {
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
      final number = 10 + _rng.nextInt(89);

      final name = useNumber ? '$a $n $number' : '$a $n';
      set.add(name);
    }

    return set.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        showBackButton: true,
        press: () => context.pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeLayoutSpacing.m),
        child: ListView(
          children: [
            Text(
              "Criar apelido",
              style: context.appText.header,
            ),
            const SizedBox(height: SizeSpacing.xs),
            Text(
              "Crie um apelido para aparecer nas interações do app.\nDica: evite usar nome completo, telefone, placa, endereço ou qualquer dado pessoal no seu apelido.",
              style: context.appText.subtitle.copyWith(
                color: context.themeColor.secundaryTextColor,
              ),
            ),
            const SizedBox(height: SizeSpacing.xl),
            //Usar o UIPrimaryTextField
            TextField(
              controller: _ctrl,
              focusNode: _focus,
              maxLength: 24,
              style: const TextStyle(
                color: Color(0xFFF3F7FF),
                fontWeight: FontWeight.w700,
              ),
              textInputAction: TextInputAction.done,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r"[A-Za-zÀ-ÿ0-9 '._-]"),
                ),
                LengthLimitingTextInputFormatter(24),
              ],
              decoration: InputDecoration(
                hintText: 'Ex: VigilanteSP, CiviUser, Radar01',
                hintStyle: TextStyle(
                  color: context.themeColor.secundaryTextColor,
                  fontWeight: FontWeight.w500,
                ),
                counterStyle: TextStyle(
                  color: context.themeColor.secundaryTextColor,
                ),
                filled: true,
                fillColor: context.themeColor.secundaryBgColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(999),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(999),
                  borderSide: BorderSide(
                    color: context.themeColor.outlineVariant,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(999),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 1.4,
                  ),
                ),
                prefixIcon: const Icon(Icons.person_outline_rounded),
                suffixIcon: _ctrl.text.trim().isEmpty
                    ? null
                    : IconButton(
                        tooltip: 'Limpar',
                        onPressed: () => setState(() => _ctrl.clear()),
                        icon: const Icon(
                          Icons.close_rounded,
                          // color: _muted,
                        ),
                      ),
              ),
              onSubmitted: (_) => {},
            ),
            const SizedBox(height: SizeSpacing.m),
            ButtonPrimary(
              text: "Continuar",
              press: () => {},
            ),
            const SizedBox(height: SizeSpacing.m),
            UIButtonIcon(
              icon: const Icon(Icons.auto_awesome_rounded),
              title: "Gerar 10 sugestões",
              tap: () => _generateSuggestions(),
            ),
            const SizedBox(height: SizeSpacing.m),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              child: showSuggestions
                  ? UICard(
                      child: Column(
                        children: [
                          const HeaderSuggestionNickname(
                            title: 'Sugestões automáticas',
                            subtitle: 'Toque para selecionar',
                            icon: Icons.lightbulb_outline_rounded,
                          ),
                          const UIThinDivider(),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: suggestions.length,
                            separatorBuilder: (_, __) => const UIThinDivider(),
                            itemBuilder: (_, i) {
                              final s = suggestions[i];
                              return NicknameSuggestionRow(
                                value: s,
                                onTap: () => _selectSuggestion(s),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
