import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestPage5_1 extends StatefulWidget {
  final EditFieldArgs args;
  const TestPage5_1({super.key, required this.args});

  @override
  State<TestPage5_1> createState() => _TestPage5_1State();
}

class _TestPage5_1State extends State<TestPage5_1> {
  static const _bg = Color(0xFFF5F7FD);
  static const _surface = Colors.white;
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);
  static const _primary = Color(0xFF2B5BEE);

  late final TextEditingController _ctrl;
  late final FocusNode _focus;

  bool _dirty = false;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController(text: widget.args.initialValue);
    _focus = FocusNode();

    _ctrl.addListener(() {
      final v = _ctrl.text;
      final isDirty = v != widget.args.initialValue;
      if (isDirty != _dirty) setState(() => _dirty = isDirty);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focus.requestFocus();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _focus.dispose();
    super.dispose();
  }

  String _normalize(String v) {
    var out = v.trim();
    if (widget.args.toUpperCase) out = out.toUpperCase();
    return out;
  }

  bool get _isValid {
    final v = _normalize(_ctrl.text);
    if (v.isEmpty) return false;
    if (v.length > widget.args.maxLen) return false;
    return true;
  }

  void _save() {
    final v = _normalize(_ctrl.text);
    if (v.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha o campo antes de salvar.')),
      );
      return;
    }
    Navigator.pop(context, v);
  }

  Future<bool> _onWillPop() async {
    if (!_dirty) return true;

    final shouldLeave = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Descartar alterações?'),
        content: const Text('Você fez mudanças que ainda não foram salvas.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Continuar editando'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Descartar'),
          ),
        ],
      ),
    );

    return shouldLeave ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final a = widget.args;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: _bg,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: _surface,
          surfaceTintColor: _surface,
          iconTheme: const IconThemeData(color: _ink),
          title: Text(
            a.title,
            style: const TextStyle(
              color: _ink,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            TextButton.icon(
              onPressed: _isValid ? _save : null,
              icon: const Icon(Icons.check_rounded),
              label: const Text('Salvar'),
              style: TextButton.styleFrom(
                foregroundColor: _primary,
                disabledForegroundColor: _muted,
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
          children: [
            _InfoCard(
              title: a.label,
              helper: a.helper ??
                  'Atualize esta informação para manter seus dados corretos.',
              example: a.example,
            ),
            const SizedBox(height: 12),
            _InputCard(
              child: TextField(
                controller: _ctrl,
                focusNode: _focus,
                maxLength: a.maxLen,
                maxLines: a.maxLines,
                keyboardType: a.keyboardType,
                inputFormatters: a.inputFormatters,
                textCapitalization: a.toUpperCase
                    ? TextCapitalization.characters
                    : TextCapitalization.none,
                decoration: InputDecoration(
                  hintText: a.hint,
                  counterStyle: const TextStyle(color: _muted),
                  filled: true,
                  fillColor: const Color(0xFFF5F7FD),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (v) {
                  if (!a.toUpperCase) return;
                  final up = v.toUpperCase();
                  if (up != v) {
                    _ctrl.value = _ctrl.value.copyWith(
                      text: up,
                      selection: TextSelection.collapsed(offset: up.length),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 12),
            _HintRow(
              left: _dirty ? 'Alterações não salvas' : 'Sem mudanças',
              right: _isValid ? 'Pronto para salvar' : 'Preencha corretamente',
            ),
          ],
        ),

        // bottom action premium
        bottomSheet: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
          child: SafeArea(
            top: false,
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () async {
                      final canLeave = await _onWillPop();
                      if (canLeave && mounted) Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _ink,
                      side: const BorderSide(color: _border),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: _surface,
                    ),
                    child: const Text('Cancelar'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isValid ? _save : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primary,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: _primary.withOpacity(0.35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Salvar alterações',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
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

/* ---------- UI pieces ---------- */

class _InfoCard extends StatelessWidget {
  final String title;
  final String helper;
  final String? example;

  const _InfoCard({
    required this.title,
    required this.helper,
    this.example,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _ink.withOpacity(0.08),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.edit_note_rounded, color: _ink),
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
                    fontWeight: FontWeight.w800,
                    color: _ink,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  helper,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.25,
                    color: _muted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (example != null) ...[
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F7FD),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE6EAF6)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.lightbulb_outline_rounded,
                            size: 18, color: _muted),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            example!,
                            style: const TextStyle(
                              fontSize: 12.5,
                              height: 1.25,
                              color: _muted,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _InputCard extends StatelessWidget {
  final Widget child;
  const _InputCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
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

class _HintRow extends StatelessWidget {
  final String left;
  final String right;

  const _HintRow({required this.left, required this.right});

  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            left,
            style: const TextStyle(
              color: _muted,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ),
        Text(
          right,
          style: const TextStyle(
            color: _muted,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

enum EditFieldType { name, brand, color, year, plate, notes }

class EditFieldArgs {
  final String title;
  final String label;
  final String hint;
  final String initialValue;
  final int maxLen;
  final int maxLines;
  final bool toUpperCase;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final String? helper; // texto curto premium
  final String? example; // exemplo opcional

  const EditFieldArgs({
    required this.title,
    required this.label,
    required this.hint,
    required this.initialValue,
    required this.maxLen,
    this.maxLines = 1,
    this.toUpperCase = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const [],
    this.helper,
    this.example,
  });
}

/// Chame isso no onTap do seu tile:
Future<String?> openEditFieldPage(BuildContext context, EditFieldArgs args) {
  return Navigator.push<String>(
    context,
    MaterialPageRoute(
      builder: (_) => TestPage5_1(args: args),
    ),
  );
}
