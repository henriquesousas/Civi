import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestPage2 extends StatefulWidget {
  const TestPage2({super.key});

  @override
  State<TestPage2> createState() => _TestPage2State();
}

enum SearchMode { auto, plate, imei, incidentCode }

enum _DetectedType { plate, imei, incidentCode, unknown }

class _TestPage2State extends State<TestPage2> {
  static const _bg = Color(0xFFF5F7FD);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);

  SearchMode mode = SearchMode.auto;
  final TextEditingController queryCtrl = TextEditingController();

  bool loading = false;

  // Mock results (trocar pela resposta da API)
  List<_IncidentResult> results = [];

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

  String get _rawQuery => queryCtrl.text.trim();

  _DetectedType get _detected => _detectType(_rawQuery);

  SearchMode get _effectiveMode {
    if (mode != SearchMode.auto) return mode;
    switch (_detected) {
      case _DetectedType.plate:
        return SearchMode.plate;
      case _DetectedType.imei:
        return SearchMode.imei;
      case _DetectedType.incidentCode:
        return SearchMode.incidentCode;
      case _DetectedType.unknown:
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

  /// Formatters:
  /// - AUTO: permissivo (permite colar qualquer um dos 3)
  /// - PLACA: 7 chars + uppercase + alfanumérico
  /// - IMEI: só dígitos, 15
  /// - CÓDIGO: alfanumérico + # e -
  List<TextInputFormatter> get _formatters {
    if (mode == SearchMode.auto) {
      return [
        LengthLimitingTextInputFormatter(24),
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9#-]')),
        _UpperCaseTextFormatter(),
      ];
    }

    if (mode == SearchMode.plate) {
      return [
        LengthLimitingTextInputFormatter(7),
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
        _UpperCaseTextFormatter(),
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
      _UpperCaseTextFormatter(),
    ];
  }

  TextInputType get _keyboardType {
    if (mode == SearchMode.imei) return TextInputType.number;
    if (mode == SearchMode.auto && _effectiveMode == SearchMode.imei) {
      return TextInputType.number;
    }
    return TextInputType.text;
  }

  /// Normaliza o valor dependendo do tipo efetivo:
  /// - IMEI: remove tudo que não for dígito
  /// - PLACA: uppercase + remove chars inválidos
  /// - CÓDIGO: uppercase + remove espaços + remove prefixos extras
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

  /// Validação que controla habilitação do botão (melhor UX).
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
        return _detected != _DetectedType.unknown;
    }
  }

  String get _detectedLabel {
    if (_rawQuery.isEmpty) return 'Digite para detectar';
    if (mode != SearchMode.auto) {
      // quando força modo, exibe o modo selecionado
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
      case _DetectedType.plate:
        return 'Detectado: Placa';
      case _DetectedType.imei:
        return 'Detectado: IMEI';
      case _DetectedType.incidentCode:
        return 'Detectado: Código';
      case _DetectedType.unknown:
        return 'Não foi possível detectar (use Auto ou escolha um tipo)';
    }
  }

  Future<void> _search() async {
    if (!_canSearch) {
      _toast('Informe um valor válido para buscar.');
      return;
    }

    final eff = _effectiveMode;
    final q = _normalizedQueryFor(eff, _rawQuery);

    setState(() {
      loading = true;
      results = [];
    });

    try {
      // TODO: chamar sua API/usecase conforme eff:
      // - plate -> searchByPlate(q)
      // - imei -> searchByImei(q)
      // - incidentCode -> searchByIncidentCode(q)
      await Future.delayed(const Duration(milliseconds: 700));

      // Mock results
      setState(() {
        results = [
          _IncidentResult(
            title: eff == SearchMode.plate
                ? 'Roubo de veículo – Placa $q'
                : eff == SearchMode.imei
                    ? 'Roubo de celular – IMEI $q'
                    : 'Ocorrência – Código $q',
            subtitle: 'Registrado por usuário • Bairro Centro',
            dateLabel: 'há 3 dias',
            status: _IncidentStatus.open,
            kind: eff == SearchMode.plate
                ? _IncidentKind.vehicle
                : eff == SearchMode.imei
                    ? _IncidentKind.phone
                    : _IncidentKind.incident,
          ),
          _IncidentResult(
            title: 'Furto – ocorrência relacionada',
            subtitle: 'Registrado por usuário • Bairro Jardim',
            dateLabel: 'há 12 dias',
            status: _IncidentStatus.recovered,
            kind: _IncidentKind.incident,
          ),
        ];
      });
    } catch (_) {
      _toast('Não foi possível buscar. Tente novamente.');
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  Future<void> _fetchLast30Days() async {
    setState(() {
      loading = true;
      results = [];
    });

    try {
      // TODO: chamar sua API/usecase: getIncidentsLast30Days()
      await Future.delayed(const Duration(milliseconds: 800));

      // Mock list
      setState(() {
        results = List.generate(
          6,
          (i) => _IncidentResult(
            title: 'Ocorrência #${1200 + i} • Roubo',
            subtitle:
                'Bairro ${i.isEven ? 'Centro' : 'Jardim'} • ${i + 1}km de você',
            dateLabel: i == 0 ? 'hoje' : 'há ${i * 3} dias',
            status:
                i % 3 == 0 ? _IncidentStatus.open : _IncidentStatus.inReview,
            kind: i.isEven ? _IncidentKind.vehicle : _IncidentKind.phone,
          ),
        );
      });
    } catch (_) {
      _toast('Não foi possível carregar as ocorrências.');
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  void _toast(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _clear() {
    setState(() {
      queryCtrl.clear();
      results = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final showClear = queryCtrl.text.isNotEmpty;

    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: _ink),
        title: const Text(
          'Consultar incidentes',
          style: TextStyle(
            color: _ink,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          const _InfoHintCard(
            title: 'Como funciona',
            text:
                'Digite Placa, IMEI ou Código da ocorrência para localizar registros relacionados. '
                'Se preferir, consulte tudo que foi registrado nos últimos 30 dias.',
          ),
          const SizedBox(height: 14),
          const _SectionTitle('Pesquisa'),
          _Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _ModeToggle(
                    value: mode,
                    onChanged: (m) {
                      setState(() {
                        mode = m;
                        results = [];
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: _ink.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(_leadingIcon, color: _ink, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: queryCtrl,
                          inputFormatters: _formatters,
                          keyboardType: _keyboardType,
                          decoration: InputDecoration(
                            labelText: _label,
                            hintText: _hint,
                            labelStyle: const TextStyle(
                              color: _muted,
                              fontWeight: FontWeight.w800,
                            ),
                            filled: true,
                            fillColor: _bg,
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
                                    color: _muted,
                                  ),
                          ),
                          onSubmitted: (_) => _search(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Linha “Detectado”
                  _DetectionLine(
                    text: _detectedLabel,
                    isOk: mode != SearchMode.auto
                        ? _canSearch
                        : _detected != _DetectedType.unknown,
                  ),

                  const SizedBox(height: 12),

                  // Ação primária
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: (loading || !_canSearch) ? null : _search,
                          icon: loading
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                )
                              : const Icon(Icons.search_rounded),
                          label: const Text(
                            'Buscar',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _primary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Ação secundária em formato de card (mais elegante)
                  _SecondaryActionCard(
                    title: 'Ocorrências recentes',
                    subtitle: 'Ver tudo que foi registrado nos últimos 30 dias',
                    icon: Icons.history_rounded,
                    onTap: loading ? null : _fetchLast30Days,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const _SectionTitle('Resultados'),
          if (loading) ...[
            const SizedBox(height: 8),
            const _LoadingResultsSkeleton(),
          ] else if (results.isEmpty) ...[
            const SizedBox(height: 8),
            _EmptyState(
              title: 'Nenhum resultado ainda',
              subtitle: 'Faça uma busca ou consulte as ocorrências recentes.',
              actionLabel: 'Ver últimos 30 dias',
              onAction: _fetchLast30Days,
            ),
          ] else ...[
            const SizedBox(height: 8),
            ...results.map((r) => _IncidentCard(
                  data: r,
                  onTap: () {
                    // TODO: navegar para detalhes da ocorrência
                    _toast('Abrir detalhes da ocorrência');
                  },
                )),
          ],
        ],
      ),
    );
  }

  _DetectedType _detectType(String q) {
    final raw = q.trim();
    if (raw.isEmpty) return _DetectedType.unknown;

    final up = raw.toUpperCase().replaceAll(' ', '');

    // IMEI: 15 dígitos
    final onlyDigits = up.replaceAll(RegExp(r'[^0-9]'), '');
    if (onlyDigits.length == 15) return _DetectedType.imei;

    // Placa: 7 alfanumérico (Mercosul/antiga) — heurística simples
    final plateCandidate = up.replaceAll(RegExp(r'[^A-Z0-9]'), '');
    if (plateCandidate.length == 7 &&
        RegExp(r'^[A-Z0-9]{7}$').hasMatch(plateCandidate)) {
      // Evita classificar "1234567" como placa; mas se quiser permitir, remova esta regra.
      final hasLetter = RegExp(r'[A-Z]').hasMatch(plateCandidate);
      if (hasLetter) return _DetectedType.plate;
    }

    // Código: aceita #, INC-, números curtos, etc.
    final codeCandidate = up.replaceAll(RegExp(r'[^A-Z0-9#-]'), '');
    final looksLikeCode = codeCandidate.length >= 4 &&
        codeCandidate.length <= 24 &&
        (codeCandidate.startsWith('#') ||
            codeCandidate.contains('-') ||
            RegExp(r'^[0-9]{4,12}$').hasMatch(codeCandidate) ||
            RegExp(r'^[A-Z]{2,5}[0-9]{2,}$').hasMatch(codeCandidate));
    if (looksLikeCode) return _DetectedType.incidentCode;

    return _DetectedType.unknown;
  }
}

/* ----------------------- UI Components ----------------------- */

class _ModeToggle extends StatelessWidget {
  final SearchMode value;
  final ValueChanged<SearchMode> onChanged;

  const _ModeToggle({
    required this.value,
    required this.onChanged,
  });

  static const _primary = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FD),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE6EAF6)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _ToggleChip(
              selected: value == SearchMode.auto,
              label: 'Auto',
              icon: Icons.manage_search_rounded,
              onTap: () => onChanged(SearchMode.auto),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _ToggleChip(
              selected: value == SearchMode.plate,
              label: 'Placa',
              icon: Icons.confirmation_number_outlined,
              onTap: () => onChanged(SearchMode.plate),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _ToggleChip(
              selected: value == SearchMode.imei,
              label: 'IMEI',
              icon: Icons.dialpad_outlined,
              onTap: () => onChanged(SearchMode.imei),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _ToggleChip(
              selected: value == SearchMode.incidentCode,
              label: 'Código',
              icon: Icons.tag_rounded,
              onTap: () => onChanged(SearchMode.incidentCode),
            ),
          ),
        ],
      ),
    );
  }
}

class _ToggleChip extends StatelessWidget {
  final bool selected;
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _ToggleChip({
    required this.selected,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  static const _primary = Color(0xFF2B5BEE);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? _primary.withOpacity(0.12) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color:
                selected ? _primary.withOpacity(0.30) : const Color(0xFFE6EAF6),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: selected ? _primary : _muted),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: selected ? _primary : _ink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetectionLine extends StatelessWidget {
  final String text;
  final bool isOk;

  const _DetectionLine({required this.text, required this.isOk});

  @override
  Widget build(BuildContext context) {
    final color = isOk ? const Color(0xFF43A047) : const Color(0xFF8A96C8);
    final icon = isOk ? Icons.verified_outlined : Icons.info_outline;

    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12.5,
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _SecondaryActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;

  const _SecondaryActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  static const _primary = Color(0xFF2B5BEE);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE6EAF6)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: _primary.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: _primary, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: _ink,
                        fontWeight: FontWeight.w900,
                        fontSize: 13.5,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: _muted,
                        fontWeight: FontWeight.w600,
                        height: 1.25,
                        fontSize: 12.5,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: _muted),
            ],
          ),
        ),
      ),
    );
  }
}

class _IncidentCard extends StatelessWidget {
  final _IncidentResult data;
  final VoidCallback onTap;

  const _IncidentCard({
    required this.data,
    required this.onTap,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Color(0x142B5BEE),
                blurRadius: 16,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _StatusIcon(status: data.status, kind: data.kind),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              data.title,
                              style: const TextStyle(
                                fontSize: 14.5,
                                fontWeight: FontWeight.w900,
                                color: _ink,
                              ),
                            ),
                          ),
                          _StatusBadge(status: data.status),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        data.subtitle,
                        style: const TextStyle(
                          fontSize: 13,
                          color: _muted,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.schedule, size: 16, color: _muted),
                          const SizedBox(width: 6),
                          Text(
                            data.dateLabel,
                            style: const TextStyle(
                              fontSize: 12.5,
                              color: _muted,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.chevron_right, color: _muted),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusIcon extends StatelessWidget {
  final _IncidentStatus status;
  final _IncidentKind kind;
  const _StatusIcon({required this.status, required this.kind});

  Color get _color {
    switch (status) {
      case _IncidentStatus.open:
        return const Color(0xFFE53935);
      case _IncidentStatus.inReview:
        return const Color(0xFFFB8C00);
      case _IncidentStatus.recovered:
        return const Color(0xFF43A047);
    }
  }

  IconData get _icon {
    // mistura status + tipo (dá sensação mais “informativa”)
    if (status == _IncidentStatus.recovered) return Icons.verified_outlined;

    switch (kind) {
      case _IncidentKind.vehicle:
        return Icons.directions_car_filled_outlined;
      case _IncidentKind.phone:
        return Icons.smartphone_outlined;
      case _IncidentKind.incident:
        return status == _IncidentStatus.inReview
            ? Icons.hourglass_top_rounded
            : Icons.report_gmailerrorred_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: _color.withOpacity(0.10),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _color.withOpacity(0.22)),
      ),
      child: Icon(_icon, color: _color),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final _IncidentStatus status;
  const _StatusBadge({required this.status});

  Color get _color {
    switch (status) {
      case _IncidentStatus.open:
        return const Color(0xFFE53935);
      case _IncidentStatus.inReview:
        return const Color(0xFFFB8C00);
      case _IncidentStatus.recovered:
        return const Color(0xFF43A047);
    }
  }

  String get _label {
    switch (status) {
      case _IncidentStatus.open:
        return 'Aberta';
      case _IncidentStatus.inReview:
        return 'Em análise';
      case _IncidentStatus.recovered:
        return 'Recuperado';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: _color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: _color.withOpacity(0.22)),
      ),
      child: Text(
        _label,
        style: TextStyle(
          fontSize: 12,
          color: _color,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _LoadingResultsSkeleton extends StatelessWidget {
  const _LoadingResultsSkeleton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        3,
        (i) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          height: 96,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Color(0x142B5BEE),
                blurRadius: 16,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F7FD),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE6EAF6)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 14,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F7FD),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 12,
                        width: 220,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F7FD),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 12,
                        width: 120,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F7FD),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String title;
  final String subtitle;
  final String actionLabel;
  final VoidCallback onAction;

  const _EmptyState({
    required this.title,
    required this.subtitle,
    required this.actionLabel,
    required this.onAction,
  });

  static const _primary = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: _primary.withOpacity(0.10),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Icon(Icons.search_off_outlined,
                  color: _primary, size: 26),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF1F2A44),
                fontWeight: FontWeight.w900,
                fontSize: 14.5,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF8A96C8),
                fontWeight: FontWeight.w600,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: onAction,
              icon: const Icon(Icons.history_rounded),
              label: Text(
                actionLabel,
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: _primary,
                side: BorderSide(color: _primary.withOpacity(0.35)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ----------------------- Base UI ----------------------- */

class _Card extends StatelessWidget {
  final Widget child;
  const _Card({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 10),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color(0xFF8A96C8),
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _InfoHintCard extends StatelessWidget {
  final String title;
  final String text;

  const _InfoHintCard({required this.title, required this.text});

  static const _primary = Color(0xFF2B5BEE);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF6B7AAE);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _primary.withOpacity(0.20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: _primary.withOpacity(0.14),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: _primary.withOpacity(0.18)),
            ),
            child: const Icon(Icons.info_outline, color: _primary, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: _ink,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.35,
                    color: _muted,
                    fontWeight: FontWeight.w600,
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

class _UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

/* ----------------------- Models ----------------------- */

enum _IncidentStatus { open, inReview, recovered }

enum _IncidentKind { vehicle, phone, incident }

class _IncidentResult {
  final String title;
  final String subtitle;
  final String dateLabel;
  final _IncidentStatus status;
  final _IncidentKind kind;

  const _IncidentResult({
    required this.title,
    required this.subtitle,
    required this.dateLabel,
    required this.status,
    required this.kind,
  });
}
