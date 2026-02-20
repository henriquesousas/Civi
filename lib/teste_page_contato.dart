import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestePageContato extends StatefulWidget {
  const TestePageContato({super.key});

  @override
  State<TestePageContato> createState() => _TestePageContatoState();
}

enum ContactType { bug, suggestion, question, report, other }

class _TestePageContatoState extends State<TestePageContato> {
  // ===== Tokens (mesma linha do app)
  static const _bg = Color(0xFFF5F7FD);
  static const _surface = Colors.white;
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _border = Color(0xFFE6EAF6);
  static const _primary = Color(0xFF2B5BEE);

  ContactType type = ContactType.suggestion;

  final _subjectCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();

  bool sending = false;

  // anexos (ui apenas)
  final List<String> attachments = []; // use paths/urls depois

  @override
  void dispose() {
    _subjectCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  String get _typeLabel => switch (type) {
        ContactType.bug => 'Bug',
        ContactType.suggestion => 'Sugestão',
        ContactType.question => 'Dúvida',
        ContactType.report => 'Denúncia',
        ContactType.other => 'Outro',
      };

  IconData get _typeIcon => switch (type) {
        ContactType.bug => Icons.bug_report_outlined,
        ContactType.suggestion => Icons.lightbulb_outline_rounded,
        ContactType.question => Icons.help_outline_rounded,
        ContactType.report => Icons.report_outlined,
        ContactType.other => Icons.chat_bubble_outline_rounded,
      };

  Color get _typeAccent => switch (type) {
        ContactType.bug => const Color(0xFFE53935),
        ContactType.suggestion => const Color(0xFF2B5BEE),
        ContactType.question => const Color(0xFF8B5CF6),
        ContactType.report => const Color(0xFFF59E0B),
        ContactType.other => const Color(0xFF6B7280),
      };

  bool get _canSend => _messageCtrl.text.trim().length >= 10 && !sending;

  Future<void> _pickType() async {
    final result = await showModalBottomSheet<ContactType>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _TypePickerSheet(
        current: type,
        onPick: (t) => Navigator.pop(context, t),
      ),
    );
    if (result != null) setState(() => type = result);
  }

  Future<void> _send() async {
    final subject = _subjectCtrl.text.trim();
    final msg = _messageCtrl.text.trim();

    if (msg.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Escreva uma mensagem com pelo menos 10 caracteres.')),
      );
      return;
    }

    setState(() => sending = true);

    try {
      // ✅ Aqui você liga com seu backend / supabase / email service
      await Future.delayed(const Duration(milliseconds: 900));

      if (!mounted) return;

      HapticFeedback.lightImpact();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Mensagem enviada em ${_typeLabel.toLowerCase()}! Obrigado 🙌'),
        ),
      );

      _subjectCtrl.clear();
      _messageCtrl.clear();
      setState(() {
        attachments.clear();
        type = ContactType.suggestion;
      });
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Não foi possível enviar. Tente novamente.')),
      );
    } finally {
      if (mounted) setState(() => sending = false);
    }
  }

  void _addAttachmentMock() {
    // troque por ImagePicker / FilePicker depois
    setState(() => attachments.add('screenshot_${attachments.length + 1}.png'));
  }

  void _removeAttachment(int i) {
    setState(() => attachments.removeAt(i));
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
          'Fale conosco',
          style: TextStyle(
            color: _ink,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _canSend ? _send : null,
            style: TextButton.styleFrom(
              foregroundColor: _primary,
              disabledForegroundColor: _muted,
            ),
            child: sending
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Enviar'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
        children: [
          _InfoCard(
            title: 'Apoio rápido e direto',
            subtitle:
                'Envie sua mensagem com detalhes. Normalmente respondemos em até 24h.',
          ),
          const SizedBox(height: 14),
          _SectionTitle('Tipo'),
          _Card(
            child: InkWell(
              onTap: _pickType,
              borderRadius: BorderRadius.circular(22),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  children: [
                    _LeadingIconBox(
                      icon: _typeIcon,
                      bg: _typeAccent.withOpacity(0.12),
                      fg: _typeAccent,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Categoria',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: _muted,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _typeLabel,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: _ink,
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
          ),
          const SizedBox(height: 14),
          _SectionTitle('Detalhes'),
          _Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                children: [
                  _LabeledField(
                    label: 'Assunto (opcional)',
                    child: TextField(
                      controller: _subjectCtrl,
                      textInputAction: TextInputAction.next,
                      maxLength: 60,
                      decoration: _inputDecoration(
                        hint: 'Ex: Tela de cadastro travando',
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _LabeledField(
                    label: 'Mensagem',
                    helper:
                        'Inclua passos para reproduzir (se for bug) ou detalhes da ideia (se for sugestão).',
                    child: TextField(
                      controller: _messageCtrl,
                      maxLength: 500,
                      maxLines: 7,
                      decoration: _inputDecoration(
                        hint: 'Digite sua mensagem…',
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          _SectionTitle('Anexos'),
          _Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Se quiser, anexe uma captura de tela',
                    style: TextStyle(
                      color: _ink,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Isso ajuda a gente a entender melhor o que aconteceu.',
                    style: TextStyle(
                      color: _muted,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.5,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (attachments.isNotEmpty) ...[
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(attachments.length, (i) {
                        return _AttachmentChip(
                          title: attachments[i],
                          onRemove: () => _removeAttachment(i),
                        );
                      }),
                    ),
                    const SizedBox(height: 12),
                  ],
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: sending ? null : _addAttachmentMock,
                          icon: const Icon(Icons.add_photo_alternate_outlined),
                          label: const Text('Adicionar'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: _ink,
                            side: const BorderSide(color: _border),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor: _surface,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _canSend ? _send : null,
                          icon: sending
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                )
                              : const Icon(Icons.send_rounded),
                          label: Text(sending ? 'Enviando…' : 'Enviar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _primary,
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: _primary.withOpacity(0.35),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
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
          _SecurityNote(),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration({required String hint}) {
    return InputDecoration(
      hintText: hint,
      counterStyle: const TextStyle(color: _muted),
      filled: true,
      fillColor: const Color(0xFFF5F7FD),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
    );
  }
}

/* =================== Components =================== */

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

class _InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _InfoCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2B5BEE).withOpacity(0.10),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFF2B5BEE).withOpacity(0.18)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF2B5BEE).withOpacity(0.14),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.support_agent_rounded,
                color: Color(0xFF2B5BEE)),
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
                    color: Color(0xFF1F2A44),
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

class _LeadingIconBox extends StatelessWidget {
  final IconData icon;
  final Color bg;
  final Color fg;

  const _LeadingIconBox(
      {required this.icon, required this.bg, required this.fg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(icon, color: fg),
    );
  }
}

class _LabeledField extends StatelessWidget {
  final String label;
  final String? helper;
  final Widget child;

  const _LabeledField({
    required this.label,
    required this.child,
    this.helper,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Color(0xFF8A96C8),
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 8),
        child,
        if (helper != null) ...[
          const SizedBox(height: 6),
          Text(
            helper!,
            style: const TextStyle(
              fontSize: 12.5,
              color: Color(0xFF8A96C8),
              height: 1.25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }
}

class _AttachmentChip extends StatelessWidget {
  final String title;
  final VoidCallback onRemove;

  const _AttachmentChip({required this.title, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FD),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE6EAF6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.image_outlined, size: 18, color: Color(0xFF8A96C8)),
          const SizedBox(width: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 180),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                color: Color(0xFF1F2A44),
                fontSize: 12.5,
              ),
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: onRemove,
            borderRadius: BorderRadius.circular(99),
            child: const Padding(
              padding: EdgeInsets.all(2),
              child:
                  Icon(Icons.close_rounded, size: 16, color: Color(0xFF8A96C8)),
            ),
          ),
        ],
      ),
    );
  }
}

class _SecurityNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE6EAF6)),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lock_outline_rounded, color: Color(0xFF8A96C8)),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Privacidade: não envie senhas ou dados sensíveis. '
              'Se for uma denúncia, descreva apenas o necessário.',
              style: TextStyle(
                color: Color(0xFF8A96C8),
                fontWeight: FontWeight.w600,
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* =================== Bottom sheet =================== */

class _TypePickerSheet extends StatelessWidget {
  final ContactType current;
  final ValueChanged<ContactType> onPick;

  const _TypePickerSheet({required this.current, required this.onPick});

  static const _ink = Color(0xFF1F2A44);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 44,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6EAF6),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Selecione o tipo',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: _ink,
              ),
            ),
            const SizedBox(height: 10),
            _TypeOption(
              label: 'Bug',
              icon: Icons.bug_report_outlined,
              selected: current == ContactType.bug,
              onTap: () => onPick(ContactType.bug),
            ),
            _TypeOption(
              label: 'Sugestão',
              icon: Icons.lightbulb_outline_rounded,
              selected: current == ContactType.suggestion,
              onTap: () => onPick(ContactType.suggestion),
            ),
            _TypeOption(
              label: 'Dúvida',
              icon: Icons.help_outline_rounded,
              selected: current == ContactType.question,
              onTap: () => onPick(ContactType.question),
            ),
            _TypeOption(
              label: 'Denúncia',
              icon: Icons.report_outlined,
              selected: current == ContactType.report,
              onTap: () => onPick(ContactType.report),
            ),
            _TypeOption(
              label: 'Outro',
              icon: Icons.chat_bubble_outline_rounded,
              selected: current == ContactType.other,
              onTap: () => onPick(ContactType.other),
            ),
          ],
        ),
      ),
    );
  }
}

class _TypeOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _TypeOption({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: selected
                ? const Color(0xFF2B5BEE).withOpacity(0.10)
                : const Color(0xFFF5F7FD),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: selected
                  ? const Color(0xFF2B5BEE).withOpacity(0.25)
                  : const Color(0xFFE6EAF6),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: selected
                      ? const Color(0xFF2B5BEE).withOpacity(0.14)
                      : const Color(0xFF1F2A44).withOpacity(0.06),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 18,
                  color: selected
                      ? const Color(0xFF2B5BEE)
                      : const Color(0xFF1F2A44),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1F2A44),
                  ),
                ),
              ),
              if (selected)
                const Icon(Icons.check, color: Color(0xFF2B5BEE), size: 18)
              else
                const Icon(Icons.chevron_right, color: Color(0xFF8A96C8)),
            ],
          ),
        ),
      ),
    );
  }
}
