import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/buttons/button_primary.dart';
import 'package:deehelp/core/ui/widgets/cards/card_exports.dart';
import 'package:deehelp/core/ui/widgets/icon/export_icon.dart';
import 'package:deehelp/core/ui/widgets/textfield/upper_case_text_formatter.dart';
import 'package:deehelp/feature/home/widgets/incident_row_item.dart';
import 'package:deehelp/feature/home/widgets/thini_divider.dart';
import 'package:deehelp/feature/incidents/incident_router.dart';
import 'package:deehelp/feature/incidents/providers/incident_selected_provider.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/section_title.dart';
import 'package:deehelp/feature/search/search_args.dart';
import 'package:deehelp/feature/search/search_viewmodel.dart';
import 'package:deehelp/feature/search/search_viewmodel_provider.dart';
import 'package:deehelp/feature/search/widgets/detection_line.dart';
import 'package:deehelp/feature/search/widgets/load_skeleton.dart';
import 'package:deehelp/feature/search/widgets/mode_toogle.dart';
import 'package:deehelp/feature/search/widgets/search_empty_state.dart';
import 'package:deehelp/core/extension/dialog_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum DetectedType { plate, imei, incidentCode, unknown }

class SearchPage extends ConsumerStatefulWidget {
  final SearchArgs? args;
  const SearchPage({super.key, this.args});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  SearchMode mode = SearchMode.auto;
  final TextEditingController queryCtrl = TextEditingController();
  // bool _isEmpty = false;

  @override
  void initState() {
    super.initState();
    queryCtrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    queryCtrl.dispose();
    super.dispose();
  }

  IconData get _leadingIcon {
    switch (mode) {
      case SearchMode.auto:
        return Icons.manage_search_rounded;
      case SearchMode.plate:
        return Icons.confirmation_number_outlined;
      case SearchMode.imei:
        return Icons.dialpad_outlined;
      case SearchMode.incidentCode:
        return Icons.tag_rounded;
    }
  }

  SearchMode get _effectiveMode {
    if (mode != SearchMode.auto) return mode;
    switch (_detected) {
      case DetectedType.plate:
        return SearchMode.plate;
      case DetectedType.imei:
        return SearchMode.imei;
      case DetectedType.incidentCode:
        return SearchMode.incidentCode;
      case DetectedType.unknown:
        return SearchMode.auto;
    }
  }

  String get _label {
    switch (mode) {
      case SearchMode.auto:
        return 'Buscar';
      case SearchMode.plate:
        return 'Placa';
      case SearchMode.imei:
        return 'IMEI';
      case SearchMode.incidentCode:
        return 'Código da ocorrência';
    }
  }

  String get _hint {
    if (mode == SearchMode.auto) {
      return 'Placa (ABC1D23), IMEI (15 dígitos) ou Código (#12345 / INC-123)';
    }
    switch (mode) {
      case SearchMode.plate:
        return 'Ex: ABC1D23';
      case SearchMode.imei:
        return 'IMEI (15 dígitos)';
      case SearchMode.incidentCode:
        return 'Ex: #12345 ou INC-12345';
      default:
        return '';
    }
  }

  void _clear() {
    setState(() {
      queryCtrl.clear();
      // results = [];
    });
  }

  TextInputType get _keyboardType {
    debugPrint("$mode");
    if (mode == SearchMode.imei) return TextInputType.number;
    if (mode == SearchMode.auto && _effectiveMode == SearchMode.imei) {
      return TextInputType.number;
    }
    return TextInputType.text;
  }

  List<TextInputFormatter> get _formatters {
    if (mode == SearchMode.auto) {
      return [
        LengthLimitingTextInputFormatter(24),
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9#-]')),
        UpperCaseTextFormatter(),
      ];
    }

    if (mode == SearchMode.plate) {
      return [
        LengthLimitingTextInputFormatter(7),
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
        UpperCaseTextFormatter(),
      ];
    }

    if (mode == SearchMode.imei) {
      return [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(15),
      ];
    }

    // incidentCode
    return [
      LengthLimitingTextInputFormatter(24),
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9#-]')),
      UpperCaseTextFormatter(),
    ];
  }

  String get _detectedLabel {
    if (_rawQuery.isEmpty) return 'Digite para detectar';
    if (mode != SearchMode.auto) {
      switch (mode) {
        case SearchMode.plate:
          return 'Modo: Placa';
        case SearchMode.imei:
          return 'Modo: IMEI';
        case SearchMode.incidentCode:
          return 'Modo: Código';
        case SearchMode.auto:
          return '';
      }
    }

    switch (_detected) {
      case DetectedType.plate:
        return 'Detectado: Placa';
      case DetectedType.imei:
        return 'Detectado: IMEI';
      case DetectedType.incidentCode:
        return 'Detectado: Código';
      case DetectedType.unknown:
        return 'Não foi possível detectar (use Auto ou escolha um tipo)';
    }
  }

  bool get _canSearch {
    final raw = _rawQuery;
    if (raw.isEmpty) return false;

    final eff = _effectiveMode;
    final q = _normalizedQueryFor(eff, raw);

    switch (eff) {
      case SearchMode.plate:
        return q.length == 7 && RegExp(r'^[A-Z0-9]{7}$').hasMatch(q);
      case SearchMode.imei:
        return q.length == 15 && RegExp(r'^\d{15}$').hasMatch(q);
      case SearchMode.incidentCode:
        // regras simples: mínimo 4, máximo 24, pode ter # e -
        final cleaned = q.replaceAll(RegExp(r'[^A-Z0-9#-]'), '');
        return cleaned.length >= 4 && cleaned.length <= 24;
      case SearchMode.auto:
        // Em auto, só habilita quando detecta algo válido
        return _detected != DetectedType.unknown;
    }
  }

  String _normalizedQueryFor(SearchMode m, String q) {
    final t = q.trim().toUpperCase();

    if (m == SearchMode.imei) {
      return t.replaceAll(RegExp(r'[^0-9]'), '');
    }
    if (m == SearchMode.plate) {
      return t.replaceAll(RegExp(r'[^A-Z0-9]'), '');
    }
    if (m == SearchMode.incidentCode) {
      // aceita "#123", "INC-123", "123"
      return t.replaceAll(' ', '');
    }
    return t;
  }

  String get _rawQuery => queryCtrl.text.trim();

  DetectedType get _detected => _detectType(_rawQuery);

  Future<void> _search(SearchViewmodel viewModel) async {
    debugPrint("$mode");
    debugPrint("Tipo detectado = $_detected");
    FocusScope.of(context).unfocus();
    if (!_canSearch) {
      // _toast('Informe um valor válido para buscar.');
      _clear();
      debugPrint("Informe um valor válido para buscar.");
      // context.showSnackBar("Informe um valor válido para buscar.",
      context.showTopNotice(
        "Informe um valor válido para buscar.",
        type: DialogType.normal,
      );
      return;
    }

    final eff = _effectiveMode;
    final query = _normalizedQueryFor(eff, _rawQuery);

    // final viewModel = ref.read(searchViewmodelProvider.notifier);

    final searchMode =
        _detected == DetectedType.incidentCode ? SearchMode.incidentCode : mode;
    debugPrint("Searchmode enviado $searchMode");
    debugPrint("Searchmode enviado $searchMode");
    viewModel.search(query, searchMode);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(searchViewmodelProvider.notifier);
    final state = ref.watch(searchViewmodelProvider);

    final showClear = queryCtrl.text.isNotEmpty;
    return Scaffold(
      appBar: DefaultAppBar(
        showBackButton:
            widget.args == null ? false : widget.args!.showBackButton,
        title: "Consultar incidentes",
        press: () => context.pop(),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          CardHint(
            icon: Icon(
              Icons.info_outline,
              color: context.primaryColor,
              size: IconSizes.md,
            ),
            title: "Como funciona",
            message:
                'Digite Placa, IMEI ou Código da ocorrência para localizar registros relacionados. '
                'Se preferir, consulte tudo que foi registrado nos últimos 30 dias.',
          ),
          const SizedBox(height: SpacingSize.lg),
          const SectionTitle('Pesquisa'),
          PageCard(
            child: Padding(
              padding: const EdgeInsets.all(LayoutSpacingSize.container),
              child: Column(
                children: [
                  ModeToggle(
                    value: mode,
                    onChanged: (m) {
                      FocusScope.of(context).unfocus();
                      setState(
                        () {
                          debugPrint("Trocou para o modo $mode");
                          mode = m;
                          // results = [];
                        },
                      );
                    },
                  ),
                  const SizedBox(height: SpacingSize.md),
                  Row(
                    children: [
                      HighlightIcon(
                        bgColor: context.onSurface.withValues(alpha: 0.08),
                        icon: Icon(
                          _leadingIcon,
                          color: context.onSurface,
                          size: IconSizes.sm,
                        ),
                      ),
                      const SizedBox(width: SpacingSize.xs),
                      Expanded(
                        child: TextField(
                          controller: queryCtrl,
                          inputFormatters: _formatters,
                          keyboardType: _keyboardType,
                          decoration: InputDecoration(
                            labelText: _label,
                            hintText: _hint,
                            labelStyle: TextStyle(
                              color: context.secondaryColor,
                              fontWeight: FontWeight.w800,
                            ),
                            filled: true,
                            fillColor: context.secondaryContainer,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            suffixIcon: !showClear
                                ? null
                                : IconButton(
                                    onPressed: _clear,
                                    icon: const Icon(Icons.close),
                                    color: context.secondaryColor,
                                  ),
                          ),
                          onSubmitted: (_) => _search(viewModel),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: SpacingSize.sm),
                  DetectionLine(
                    text: _detectedLabel,
                    isOk: mode != SearchMode.auto
                        ? _canSearch
                        : _detected != DetectedType.unknown,
                  ),
                  const SizedBox(height: SpacingSize.md),
                  ButtonPrimary(
                    loading: state.isLoading,
                    press: () => _search(viewModel),
                    text: "Buscar",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: SpacingSize.lg),
          const SectionTitle('Resultados'),
          state.when(
            data: (data) {
              if (data.isEmpty) {
                return SearchEmptyState(
                  title: 'Nenhum resultado ainda',
                  subtitle:
                      'Faça uma busca ou consulte as ocorrências recentes.',
                  actionLabel: 'Ver últimos 30 dias',
                  onAction: () => viewModel.getlast(),
                );
              }
              return PageCard(
                child: Column(
                  children: [
                    ...data.map(
                      (r) => IncidentRowItem(
                        incident: r,
                        onTap: () {
                          ref.watch(incidentSelectedProvider.notifier).state =
                              r;
                          context.push(IncidentRouter.detail);
                        },
                      ),
                    ),
                    const ThinDivider(),
                  ],
                ),
              );
            },
            error: (error, stackTrace) {
              return SearchEmptyState(
                title: 'Nenhum resultado ainda',
                subtitle: 'Faça uma busca ou consulte as ocorrências recentes.',
                actionLabel: 'Ver últimos 30 dias',
                onAction: () => viewModel.getlast(),
              );
            },
            loading: () {
              // const SizedBox(height: SpacingSize.sm)
              return const LoadingResultsSkeleton(
                size: 5,
              );
            },
          ),
        ],
      ),
    );
  }

  DetectedType _detectType(String q) {
    final raw = q.trim();
    if (raw.isEmpty) return DetectedType.unknown;

    final up = raw.toUpperCase().replaceAll(' ', '');

    // IMEI: 15 dígitos
    final onlyDigits = up.replaceAll(RegExp(r'[^0-9]'), '');
    if (onlyDigits.length == 15) return DetectedType.imei;

    // Placa: 7 alfanumérico (Mercosul/antiga) — heurística simples
    final plateCandidate = up.replaceAll(RegExp(r'[^A-Z0-9]'), '');
    if (plateCandidate.length == 7 &&
        RegExp(r'^[A-Z0-9]{7}$').hasMatch(plateCandidate)) {
      // Evita classificar "1234567" como placa; mas se quiser permitir, remova esta regra.
      final hasLetter = RegExp(r'[A-Z]').hasMatch(plateCandidate);
      if (hasLetter) return DetectedType.plate;
    }

    // Código: aceita #, INC-, números curtos, etc.
    final codeCandidate = up.replaceAll(RegExp(r'[^A-Z0-9#-]'), '');
    final looksLikeCode = codeCandidate.length >= 4 &&
        codeCandidate.length <= 24 &&
        (codeCandidate.startsWith('#') ||
            codeCandidate.contains('-') ||
            RegExp(r'^[0-9]{4,12}$').hasMatch(codeCandidate) ||
            RegExp(r'^[A-Z]{2,5}[0-9]{2,}$').hasMatch(codeCandidate));
    if (looksLikeCode) return DetectedType.incidentCode;

    return DetectedType.unknown;
  }
}
