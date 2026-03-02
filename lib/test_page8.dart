import 'dart:async';
import 'package:flutter/material.dart';

//ReportIncidentPage
class TestPage8 extends StatefulWidget {
  const TestPage8({super.key});

  @override
  State<TestPage8> createState() => _TestPage8State();
}

enum ReportMode { none, immediate, detailed }

class _TestPage8State extends State<TestPage8> {
  static const _bg = Color(0xFFF5F7FD);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);

  // Fake items do usuário
  final List<_UserItem> _items = const [
    _UserItem(
        name: 'CG Titan 150',
        subtitle: 'Honda • Vermelha • 2018',
        photoUrl:
            'https://images.unsplash.com/photo-1525609004556-c46c7d6cf023?auto=format&fit=crop&w=1200&q=60',
        type: 'Moto'),
    _UserItem(
      photoUrl:
          'https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=1200&q=60',
      name: 'Onix LT',
      subtitle: 'Chevrolet • Branco • 2020',
      type: 'Carro',
    ),
    _UserItem(
      name: 'iPhone 13',
      subtitle: 'Apple • Preto • IMEI cadastrado',
      type: 'Celular',
    ),
  ];

  _UserItem? selectedItem;
  ReportMode mode = ReportMode.none;

  // Detailed form
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final cityCtrl = TextEditingController();
  final districtCtrl = TextEditingController();
  final howCtrl = TextEditingController();
  final addressCtrl = TextEditingController();

  // Immediate hold-to-confirm
  double holdProgress = 0.0;
  Timer? holdTimer;
  bool immediateDone = false;

  @override
  void dispose() {
    cityCtrl.dispose();
    districtCtrl.dispose();
    howCtrl.dispose();
    holdTimer?.cancel();
    addressCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickItem() async {
    final picked = await showModalBottomSheet<_UserItem>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _ItemPickerSheet(items: _items),
    );

    if (picked == null) return;

    setState(() {
      selectedItem = picked;
      mode = ReportMode.none;
      _resetImmediate();
    });
  }

  void _resetImmediate() {
    holdProgress = 0;
    immediateDone = false;
    holdTimer?.cancel();
    holdTimer = null;
  }

  void _selectMode(ReportMode m) {
    if (selectedItem == null) {
      _toast('Selecione um item primeiro.');
      return;
    }
    setState(() {
      mode = m;
      _resetImmediate();
    });
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final result = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(now.year - 2),
      lastDate: DateTime(now.year + 1),
      helpText: 'Selecionar data',
    );
    if (result == null) return;
    setState(() => selectedDate = result);
  }

  Future<void> _pickTime() async {
    final result = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      helpText: 'Selecionar horário',
    );
    if (result == null) return;
    setState(() => selectedTime = result);
  }

  void _startHold() {
    if (immediateDone) return;

    holdTimer?.cancel();
    holdProgress = 0;

    // 1.6s ~ “segurar alguns segundos”
    const totalMs = 1600;
    const tickMs = 16;
    final steps = totalMs ~/ tickMs;
    int tick = 0;

    holdTimer = Timer.periodic(const Duration(milliseconds: tickMs), (t) {
      tick++;
      setState(() => holdProgress = tick / steps);
      if (tick >= steps) {
        t.cancel();
        setState(() => immediateDone = true);
        _toast('Incidente reportado com sucesso.');
      }
    });
  }

  void _cancelHold() {
    if (immediateDone) return;
    holdTimer?.cancel();
    holdTimer = null;
    setState(() => holdProgress = 0);
  }

  void _submitDetailed() {
    if (selectedItem == null) {
      _toast('Selecione um item.');
      return;
    }
    if (selectedDate == null) {
      _toast('Selecione a data.');
      return;
    }
    if (selectedTime == null) {
      _toast('Selecione o horário.');
      return;
    }
    if (cityCtrl.text.trim().isEmpty) {
      _toast('Informe a cidade.');
      return;
    }
    if (districtCtrl.text.trim().isEmpty) {
      _toast('Informe o bairro.');
      return;
    }
    if (howCtrl.text.trim().isEmpty) {
      _toast('Descreva como aconteceu.');
      return;
    }

    _toast('Registro detalhado enviado para análise.');
    // aqui você chamaria seu provider/usecase
  }

  String _formatDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';

  String _formatTime(TimeOfDay t) =>
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';

  void _toast(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), behavior: SnackBarBehavior.floating),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasItem = selectedItem != null;

    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: _ink),
        title: const Text(
          'Reportar incidente',
          style: TextStyle(color: _ink, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          _InfoBanner(
            icon: Icons.info_outline,
            title: 'Selecione um item',
            subtitle:
                'Para reportar um incidente, escolha um item já cadastrado no seu perfil.',
          ),
          const SizedBox(height: 12),
          _Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: _pickItem,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    if (selectedItem != null)
                      _ItemAvatar(item: selectedItem!)
                    else
                      _LeadingIcon(
                          icon: Icons.inventory_2_outlined, tone: _primary),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hasItem ? selectedItem!.name : 'Escolher item',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: _ink,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            hasItem
                                ? '${selectedItem!.type} • ${selectedItem!.subtitle}'
                                : 'Toque para selecionar um item cadastrado',
                            style: const TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600,
                              color: _muted,
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
          if (hasItem) ...[
            const SizedBox(height: 18),
            const _SectionTitle('Tipo de registro'),
            // _ModeCard(
            //   selected: mode == ReportMode.immediate,
            //   title: 'Imediato',
            //   subtitle:
            //       'Registra rápido com 1 toque. Ideal quando você precisa agir agora.',
            //   badge: 'RÁPIDO',
            //   icon: Icons.flash_on_outlined,
            //   onTap: () => _selectMode(ReportMode.immediate),
            // ),
            _ExpandableModeCard(
              selected: mode == ReportMode.immediate,
              title: 'Imediato',
              badge: 'RÁPIDO',
              icon: Icons.flash_on_outlined,
              subtitle:
                  'Use quando acabou de acontecer. Registre agora e complete os detalhes depois.',
              onTap: () => _selectMode(ReportMode.immediate),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    _InfoInline(
                      icon: Icons.update_outlined,
                      text:
                          'Você poderá complementar data, local e descrição posteriormente.',
                    ),
                    const SizedBox(height: 12),
                    _HoldToConfirmButton(
                      progress: holdProgress,
                      done: immediateDone,
                      onHoldStart: _startHold,
                      onHoldCancel: _cancelHold,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // _ModeCard(
            //   selected: mode == ReportMode.detailed,
            //   title: 'Detalhado',
            //   subtitle:
            //       'Inclui data, horário e contexto. Recomendado para um registro completo.',
            //   badge: 'COMPLETO',
            //   icon: Icons.assignment_outlined,
            //   onTap: () => _selectMode(ReportMode.detailed),
            // ),
            _ExpandableModeCard(
              selected: mode == ReportMode.detailed,
              title: 'Detalhado',
              badge: 'COMPLETO',
              icon: Icons.assignment_outlined,
              subtitle:
                  'Inclui data, horário e contexto. Recomendado para um registro completo.',
              onTap: () => _selectMode(ReportMode.detailed),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    _FieldTile(
                      icon: Icons.calendar_month_outlined,
                      label: 'Data',
                      value: selectedDate == null
                          ? 'Selecionar'
                          : _formatDate(selectedDate!),
                      onTap: _pickDate,
                    ),
                    const _DividerIndented(),
                    _FieldTile(
                      icon: Icons.schedule_outlined,
                      label: 'Horário',
                      value: selectedTime == null
                          ? 'Selecionar'
                          : _formatTime(selectedTime!),
                      onTap: _pickTime,
                    ),
                    const _DividerIndented(),
                    _TextInputTile(
                      icon: Icons.location_city_outlined,
                      label: 'Cidade',
                      controller: cityCtrl,
                      hint: 'Ex.: São Paulo',
                      textInputAction: TextInputAction.next,
                    ),
                    const _DividerIndented(),
                    _TextInputTile(
                      icon: Icons.place_outlined,
                      label: 'Bairro',
                      controller: districtCtrl,
                      hint: 'Ex.: Centro',
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 14),
                    const _DividerIndented(),
                    _TextInputTile(
                      icon: Icons.signpost_outlined,
                      label: 'Endereço aproximado',
                      controller: addressCtrl,
                      hint: 'Ex.: Próx. à Av. Paulista, 1200',
                      textInputAction: TextInputAction.next,
                    ),
                    _LongTextCard(
                      title: 'Como aconteceu',
                      subtitle: 'Descreva em até 300 caracteres.',
                      controller: howCtrl,
                      maxLen: 300,
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: _submitDetailed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          'Salvar',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          // if (mode == ReportMode.immediate) ...[
          //   const SizedBox(height: 18),
          //   const _SectionTitle('Confirmar registro'),
          //   _Card(
          //     child: Padding(
          //       padding: const EdgeInsets.all(16),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.stretch,
          //         children: [
          //           Row(
          //             children: const [
          //               _LeadingIcon(icon: Icons.lock_clock_outlined),
          //               SizedBox(width: 12),
          //               Expanded(
          //                 child: Text(
          //                   'Segure para reportar',
          //                   style: TextStyle(
          //                     fontSize: 14,
          //                     fontWeight: FontWeight.w900,
          //                     color: _ink,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //           const SizedBox(height: 10),
          //           const Text(
          //             'Segure o botão por alguns segundos para evitar envio acidental.',
          //             style: TextStyle(
          //               fontSize: 12.5,
          //               color: _muted,
          //               fontWeight: FontWeight.w600,
          //             ),
          //           ),
          //           const SizedBox(height: 14),
          //           _HoldToConfirmButton(
          //             progress: holdProgress,
          //             done: immediateDone,
          //             onHoldStart: _startHold,
          //             onHoldCancel: _cancelHold,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ],
          // if (mode == ReportMode.detailed) ...[
          //   const SizedBox(height: 18),
          //   const _SectionTitle('Detalhes do incidente'),
          //   _Card(
          //     child: Padding(
          //       padding: const EdgeInsets.all(16),
          //       child: Column(
          //         children: [
          //           _FieldTile(
          //             icon: Icons.calendar_month_outlined,
          //             label: 'Data',
          //             value: selectedDate == null
          //                 ? 'Selecionar'
          //                 : _formatDate(selectedDate!),
          //             onTap: _pickDate,
          //           ),
          //           const _DividerIndented(),
          //           _FieldTile(
          //             icon: Icons.schedule_outlined,
          //             label: 'Horário',
          //             value: selectedTime == null
          //                 ? 'Selecionar'
          //                 : _formatTime(selectedTime!),
          //             onTap: _pickTime,
          //           ),
          //           const _DividerIndented(),
          //           _TextInputTile(
          //             icon: Icons.location_city_outlined,
          //             label: 'Cidade',
          //             controller: cityCtrl,
          //             hint: 'Ex.: São Paulo',
          //             textInputAction: TextInputAction.next,
          //           ),
          //           const _DividerIndented(),
          //           _TextInputTile(
          //             icon: Icons.place_outlined,
          //             label: 'Bairro',
          //             controller: districtCtrl,
          //             hint: 'Ex.: Centro',
          //             textInputAction: TextInputAction.next,
          //           ),
          //           const SizedBox(height: 14),
          //           _LongTextCard(
          //             title: 'Como aconteceu',
          //             subtitle: 'Descreva em até 300 caracteres.',
          //             controller: howCtrl,
          //             maxLen: 300,
          //           ),
          //           const SizedBox(height: 14),
          //           SizedBox(
          //             width: double.infinity,
          //             height: 54,
          //             child: ElevatedButton(
          //               onPressed: _submitDetailed,
          //               style: ElevatedButton.styleFrom(
          //                 backgroundColor: _primary,
          //                 foregroundColor: Colors.white,
          //                 elevation: 0,
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(18),
          //                 ),
          //               ),
          //               child: const Text(
          //                 'Salvar',
          //                 style: TextStyle(fontWeight: FontWeight.w900),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ],
        ],
      ),
    );
  }
}

/* ---------------- UI Components ---------------- */

class _UserItem {
  final String name;
  final String subtitle;
  final String type;
  final String? photoUrl; // ✅ foto principal (para veículos)

  const _UserItem(
      {required this.name,
      required this.subtitle,
      required this.type,
      this.photoUrl});

  bool get isVehicle =>
      type.toLowerCase() == 'moto' || type.toLowerCase() == 'carro';
  bool get isPhone => type.toLowerCase() == 'celular';
}

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
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Color(0xFF8A96C8),
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _LeadingIcon extends StatelessWidget {
  final IconData icon;
  final Color? tone;
  const _LeadingIcon({required this.icon, this.tone});

  @override
  Widget build(BuildContext context) {
    final color = tone ?? const Color(0xFF1F2A44);
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color.withOpacity(0.10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.12)),
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }
}

class _InfoBanner extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoBanner({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF4FF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF2B5BEE).withOpacity(0.18)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF2B5BEE).withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xFF2B5BEE)),
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
                    color: _ink,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: _muted,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.5,
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

class _ModeCard extends StatelessWidget {
  final bool selected;
  final String title;
  final String subtitle;
  final String badge;
  final IconData icon;
  final VoidCallback onTap;

  const _ModeCard({
    required this.selected,
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.icon,
    required this.onTap,
  });

  static const _primary = Color(0xFF2B5BEE);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    final border =
        selected ? _primary.withOpacity(0.32) : const Color(0xFFE6EAF6);
    final bg = selected ? _primary.withOpacity(0.06) : Colors.white;

    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: border),
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
                  color: _primary.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: _primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: _ink,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: _primary,
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Text(
                            badge,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12.5,
                        color: _muted,
                        fontWeight: FontWeight.w600,
                        height: 1.25,
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

class _HoldToConfirmButton extends StatelessWidget {
  final double progress;
  final bool done;
  final VoidCallback onHoldStart;
  final VoidCallback onHoldCancel;

  const _HoldToConfirmButton({
    required this.progress,
    required this.done,
    required this.onHoldStart,
    required this.onHoldCancel,
  });

  static const _primary = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (_) => onHoldStart(),
      onLongPressEnd: (_) => onHoldCancel(),
      child: Stack(
        children: [
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: done ? const Color(0xFF43A047) : _primary,
              borderRadius: BorderRadius.circular(18),
            ),
            alignment: Alignment.center,
            child: Text(
              done ? 'Registro concluído' : 'Segure para reportar',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 14,
              ),
            ),
          ),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: done ? 1 : progress.clamp(0, 1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.18),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DividerIndented extends StatelessWidget {
  const _DividerIndented();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      indent: 72,
      color: Color(0xFFE6EAF6),
    );
  }
}

class _FieldTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  const _FieldTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: [
            _LeadingIcon(icon: icon),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: _muted,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
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
    );
  }
}

class _TextInputTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextEditingController controller;
  final String hint;
  final TextInputAction textInputAction;

  const _TextInputTile({
    required this.icon,
    required this.label,
    required this.controller,
    required this.hint,
    required this.textInputAction,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _LeadingIcon(icon: icon),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: _muted,
                  ),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: controller,
                  textInputAction: textInputAction,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: const TextStyle(color: _muted),
                    filled: true,
                    fillColor: const Color(0xFFF5F7FD),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
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

class _LongTextCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextEditingController controller;
  final int maxLen;

  const _LongTextCard({
    required this.title,
    required this.subtitle,
    required this.controller,
    required this.maxLen,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FD),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE6EAF6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: _muted,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12.5,
              color: _muted,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller,
            maxLength: maxLen,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Digite aqui…',
              hintStyle: const TextStyle(color: _muted),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}

/* ---------------- Picker Bottom Sheet ---------------- */

class _ItemPickerSheet extends StatefulWidget {
  final List<_UserItem> items;
  const _ItemPickerSheet({required this.items});

  @override
  State<_ItemPickerSheet> createState() => _ItemPickerSheetState();
}

class _ItemPickerSheetState extends State<_ItemPickerSheet> {
  final ctrl = TextEditingController();

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    final q = ctrl.text.trim().toLowerCase();
    final list = q.isEmpty
        ? widget.items
        : widget.items
            .where((e) =>
                e.name.toLowerCase().contains(q) ||
                e.subtitle.toLowerCase().contains(q) ||
                e.type.toLowerCase().contains(q))
            .toList();

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 44,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6EAF6),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Selecionar item',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF1F2A44),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Fechar'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                controller: ctrl,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Buscar item…',
                  filled: true,
                  fillColor: const Color(0xFFF5F7FD),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: list.length,
                  separatorBuilder: (_, __) =>
                      const Divider(height: 1, color: Color(0xFFE6EAF6)),
                  itemBuilder: (_, i) {
                    final item = list[i];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                      title: Text(
                        item.name,
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                      subtitle: Text(item.subtitle),
                      leading: Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2B5BEE).withOpacity(0.10),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(Icons.inventory_2_outlined,
                            color: Color(0xFF2B5BEE)),
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => Navigator.pop(context, item),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoInline extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoInline({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FD),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE6EAF6)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFF8A96C8)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12.5,
                color: Color(0xFF6B7AAE),
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

class _ExpandableModeCard extends StatelessWidget {
  final bool selected;
  final String title;
  final String subtitle;
  final String badge;
  final IconData icon;
  final VoidCallback onTap;
  final Widget child;

  const _ExpandableModeCard({
    required this.selected,
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.icon,
    required this.onTap,
    required this.child,
  });

  static const _primary = Color(0xFF2B5BEE);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    final border =
        selected ? _primary.withOpacity(0.32) : const Color(0xFFE6EAF6);
    final bg = selected ? _primary.withOpacity(0.06) : Colors.white;

    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: border),
          boxShadow: const [
            BoxShadow(
              color: Color(0x142B5BEE),
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: _primary.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(icon, color: _primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: _ink,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: _primary,
                                borderRadius: BorderRadius.circular(99),
                              ),
                              child: Text(
                                badge,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 12.5,
                            color: _muted,
                            fontWeight: FontWeight.w600,
                            height: 1.25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: selected ? 0.25 : 0,
                    duration: const Duration(milliseconds: 180),
                    child: const Icon(Icons.chevron_right, color: _muted),
                  ),
                ],
              ),
            ),
            if (selected) ...[
              const Divider(height: 1, color: Color(0xFFE6EAF6)),
              child,
            ],
          ],
        ),
      ),
    );
  }
}

class _ItemAvatar extends StatelessWidget {
  final _UserItem item;
  const _ItemAvatar({required this.item});

  static const _primary = Color(0xFF2B5BEE);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    final shouldShowPhoto =
        item.isVehicle && (item.photoUrl?.isNotEmpty ?? false);

    if (shouldShowPhoto) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: 44,
          height: 44,
          color: const Color(0xFFF5F7FD),
          child: Image.network(
            item.photoUrl!,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => _fallbackIcon(),
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return const Center(
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            },
          ),
        ),
      );
    }

    // Celular (ou veículo sem foto): mantém como estava
    return _fallbackIcon();
  }

  Widget _fallbackIcon() {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: _primary.withOpacity(0.10),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _primary.withOpacity(0.12)),
      ),
      child: Icon(
        item.isPhone
            ? Icons.phone_iphone_outlined
            : Icons.directions_car_outlined,
        color: item.isPhone ? _ink : _primary,
        size: 22,
      ),
    );
  }
}
