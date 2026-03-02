import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestPage5 extends StatefulWidget {
  const TestPage5({super.key});

  @override
  State<TestPage5> createState() => _TestPage5State();
}

enum ItemStatus { active, pending, canceled }

class _TestPage5State extends State<TestPage5> {
  String name = 'CG Titan 150';
  String brand = 'Honda';
  String color = 'Vermelha';
  String year = '2020';
  String plate = 'ABC1D23';
  String notes =
      'Placa final 7. Adesivo no paralama traseiro. Pequeno risco no tanque.';

  ItemStatus status = ItemStatus.active;

  final List<ImageProvider> photos = const [
    NetworkImage('https://picsum.photos/seed/titan1/900/900'),
    NetworkImage('https://picsum.photos/seed/titan2/900/900'),
    NetworkImage('https://picsum.photos/seed/titan3/900/900'),
  ];

  int selectedPhoto = 0;

  static const _bg = Color(0xFFF5F7FD);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);

  final _pageCtrl = PageController();

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: _ink),
        title: const Text(
          'Detalhes do item',
          style: TextStyle(
            color: _ink,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Salvar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Alterações salvas (exemplo).')),
              );
            },
            icon: const Icon(Icons.check_circle_outline),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          _PhotosGalleryCard(
            photos: photos,
            selectedIndex: selectedPhoto,
            onIndexChanged: (i) => setState(() => selectedPhoto = i),
            controller: _pageCtrl,
            onOpenZoom: (i) => _openPhotoViewer(context, photos, i),
          ),
          const SizedBox(height: 14),

          // ✅ Header com badge de status
          _HeaderCard(
            title: name,
            subtitle: 'Toque nos campos para editar',
            status: status,
            onTapStatus: () async {
              final newStatus = await _pickStatus(context, status);
              if (newStatus != null) setState(() => status = newStatus);
            },
          ),

          const SizedBox(height: 16),

          const _SectionTitle('Informações do item'),
          _Card(
            child: Column(
              children: [
                _EditableFieldTile(
                  icon: Icons.badge_outlined,
                  label: 'Nome',
                  value: name,
                  onEdit: () => _editText(
                    context,
                    title: 'Editar nome',
                    hint: 'Ex: CG Titan 150',
                    initialValue: name,
                    maxLen: 60,
                    onSave: (v) => setState(() => name = v),
                  ),
                ),
                const _SoftDivider(),
                _EditableFieldTile(
                  icon: Icons.branding_watermark_outlined,
                  label: 'Marca',
                  value: brand,
                  onEdit: () => _editText(
                    context,
                    title: 'Editar marca',
                    hint: 'Ex: Honda',
                    initialValue: brand,
                    maxLen: 40,
                    onSave: (v) => setState(() => brand = v),
                  ),
                ),
                const _SoftDivider(),
                _EditableFieldTile(
                  icon: Icons.color_lens_outlined,
                  label: 'Cor',
                  value: color,
                  onEdit: () => _editText(
                    context,
                    title: 'Editar cor',
                    hint: 'Ex: Vermelha',
                    initialValue: color,
                    maxLen: 30,
                    onSave: (v) => setState(() => color = v),
                  ),
                ),
                const _SoftDivider(),
                _EditableFieldTile(
                  icon: Icons.calendar_month_outlined,
                  label: 'Ano',
                  value: year,
                  onEdit: () => _editText(
                    context,
                    title: 'Editar ano',
                    hint: 'Ex: 2020',
                    initialValue: year,
                    maxLen: 4,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    onSave: (v) => setState(() => year = v),
                  ),
                ),
                const _SoftDivider(),
                _EditableFieldTile(
                  icon: Icons.confirmation_number_outlined,
                  label: 'Placa',
                  value: plate,
                  onEdit: () => _editText(
                    context,
                    title: 'Editar placa',
                    hint: 'Ex: ABC1D23',
                    initialValue: plate,
                    maxLen: 7,
                    toUpperCase: true,
                    onSave: (v) => setState(() => plate = v.toUpperCase()),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          const _SectionTitle('Observação'),
          // ✅ Card maior (mais espaço + mais linhas)
          _Card(
            child: _EditableMultilineTile(
              icon: Icons.notes_outlined,
              label: 'Descrição (até 300 caracteres)',
              value: notes,
              minHeight: 150, // 👈 deixa visualmente maior
              maxPreviewLines: 8, // 👈 mostra mais conteúdo antes do "..."
              onEdit: () => _editText(
                context,
                title: 'Editar observação',
                hint: 'Digite detalhes que ajudem a identificar o item…',
                initialValue: notes,
                maxLen: 300,
                maxLines: 7,
                onSave: (v) => setState(() => notes = v),
              ),
            ),
          ),

          const SizedBox(height: 18),

          // ✅ Card excluir (mantido)
          _DangerZone(
            onDelete: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Remover item?'),
                  content: const Text(
                    'Essa ação não pode ser desfeita. Deseja continuar?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                    FilledButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Item removido (exemplo).')),
                        );
                      },
                      child: const Text('Remover'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<ItemStatus?> _pickStatus(BuildContext context, ItemStatus current) {
    return showModalBottomSheet<ItemStatus>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
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
                  'Status do item',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: _ink,
                  ),
                ),
                const SizedBox(height: 8),
                _StatusOption(
                  status: ItemStatus.active,
                  current: current,
                  onTap: () => Navigator.pop(context, ItemStatus.active),
                ),
                _StatusOption(
                  status: ItemStatus.pending,
                  current: current,
                  onTap: () => Navigator.pop(context, ItemStatus.pending),
                ),
                _StatusOption(
                  status: ItemStatus.canceled,
                  current: current,
                  onTap: () => Navigator.pop(context, ItemStatus.canceled),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _openPhotoViewer(
    BuildContext context,
    List<ImageProvider> photos,
    int initialIndex,
  ) async {
    await showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.92),
      builder: (_) => _PhotoViewerDialog(
        photos: photos,
        initialIndex: initialIndex,
      ),
    );
  }

  Future<void> _editText(
    BuildContext context, {
    required String title,
    required String hint,
    required String initialValue,
    required int maxLen,
    required ValueChanged<String> onSave,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    bool toUpperCase = false,
  }) async {
    final controller = TextEditingController(text: initialValue);
    final focus = FocusNode();

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        final bottomInset = MediaQuery.of(context).viewInsets.bottom;
        return Padding(
          padding: EdgeInsets.only(bottom: bottomInset),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
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
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: _ink,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: controller,
                    focusNode: focus,
                    maxLength: maxLen,
                    maxLines: maxLines,
                    keyboardType: keyboardType,
                    inputFormatters: inputFormatters,
                    textCapitalization: toUpperCase
                        ? TextCapitalization.characters
                        : TextCapitalization.none,
                    decoration: InputDecoration(
                      hintText: hint,
                      counterStyle: const TextStyle(color: _muted),
                      filled: true,
                      fillColor: const Color(0xFFF5F7FD),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (v) {
                      if (!toUpperCase) return;
                      final up = v.toUpperCase();
                      if (up != v) {
                        controller.value = controller.value.copyWith(
                          text: up,
                          selection: TextSelection.collapsed(offset: up.length),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: _ink,
                            side: const BorderSide(color: Color(0xFFE6EAF6)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text('Cancelar'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            final v = controller.text.trim();
                            onSave(v.isEmpty ? initialValue : v);
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Salvar',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    await Future.delayed(const Duration(milliseconds: 120));
    if (mounted) focus.requestFocus();
  }
}

/* ------------------- GALERIA DE FOTOS ------------------- */

class _PhotosGalleryCard extends StatelessWidget {
  final List<ImageProvider> photos;
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;
  final PageController controller;
  final ValueChanged<int> onOpenZoom;

  const _PhotosGalleryCard({
    required this.photos,
    required this.selectedIndex,
    required this.onIndexChanged,
    required this.controller,
    required this.onOpenZoom,
  });

  static const _primary = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    final hasPhotos = photos.isNotEmpty;

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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Fotos do item',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1F2A44),
                    ),
                  ),
                ),
                if (hasPhotos)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: _primary.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Text(
                      '${selectedIndex + 1}/${photos.length}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: _primary,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: AspectRatio(
                aspectRatio: 16 / 10,
                child: hasPhotos
                    ? Stack(
                        children: [
                          PageView.builder(
                            controller: controller,
                            itemCount: photos.length,
                            onPageChanged: onIndexChanged,
                            itemBuilder: (_, i) {
                              return GestureDetector(
                                onTap: () => onOpenZoom(i),
                                child: Container(
                                  color: const Color(0xFFF5F7FD),
                                  child: Image(
                                      image: photos[i], fit: BoxFit.cover),
                                ),
                              );
                            },
                          ),
                          Positioned(
                            right: 10,
                            bottom: 10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.35),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.zoom_in,
                                      color: Colors.white, size: 16),
                                  SizedBox(width: 6),
                                  Text(
                                    'Ampliar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : const _EmptyPhotos(),
              ),
            ),
            if (hasPhotos) ...[
              const SizedBox(height: 12),
              SizedBox(
                height: 62,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: photos.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (_, i) {
                    final selected = i == selectedIndex;
                    return GestureDetector(
                      onTap: () {
                        controller.animateToPage(
                          i,
                          duration: const Duration(milliseconds: 260),
                          curve: Curves.easeOut,
                        );
                        onIndexChanged(i);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: selected
                              ? _primary.withOpacity(0.18)
                              : const Color(0xFFF5F7FD),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color:
                                selected ? _primary : const Color(0xFFE6EAF6),
                            width: selected ? 1.6 : 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image(image: photos[i], fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _EmptyPhotos extends StatelessWidget {
  const _EmptyPhotos();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F7FD),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.photo_library_outlined,
                  size: 34, color: Color(0xFF8A96C8)),
              SizedBox(height: 10),
              Text(
                'Nenhuma foto adicionada',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1F2A44),
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Adicione fotos para facilitar a identificação.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Color(0xFF8A96C8)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhotoViewerDialog extends StatefulWidget {
  final List<ImageProvider> photos;
  final int initialIndex;

  const _PhotoViewerDialog({
    required this.photos,
    required this.initialIndex,
  });

  @override
  State<_PhotoViewerDialog> createState() => _PhotoViewerDialogState();
}

class _PhotoViewerDialogState extends State<_PhotoViewerDialog> {
  late final PageController _ctrl;
  late int index;

  @override
  void initState() {
    super.initState();
    index = widget.initialIndex;
    _ctrl = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          PageView.builder(
            controller: _ctrl,
            itemCount: widget.photos.length,
            onPageChanged: (i) => setState(() => index = i),
            itemBuilder: (_, i) {
              return InteractiveViewer(
                minScale: 1.0,
                maxScale: 4.0,
                child: Center(
                  child: Image(image: widget.photos[i], fit: BoxFit.contain),
                ),
              );
            },
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 14,
            right: 14,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.white),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(99),
                    border: Border.all(color: Colors.white.withOpacity(0.18)),
                  ),
                  child: Text(
                    '${index + 1}/${widget.photos.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
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

/* ------------------- HEADER + STATUS BADGE ------------------- */

class _HeaderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final ItemStatus status;
  final VoidCallback onTapStatus;

  const _HeaderCard({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.onTapStatus,
  });

  @override
  Widget build(BuildContext context) {
    final style = _StatusStyle.from(status);

    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [Color(0xFF2B5BEE), Color(0xFF5F85FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Icon(Icons.inventory_2_outlined, color: Colors.white),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1F2A44),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: onTapStatus,
                      borderRadius: BorderRadius.circular(99),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: style.bg,
                          borderRadius: BorderRadius.circular(99),
                          border: Border.all(color: style.border),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(style.icon, size: 14, color: style.fg),
                            const SizedBox(width: 6),
                            Text(
                              style.label,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: style.fg,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style:
                      const TextStyle(fontSize: 13, color: Color(0xFF8A96C8)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusStyle {
  final String label;
  final Color bg;
  final Color fg;
  final Color border;
  final IconData icon;

  const _StatusStyle({
    required this.label,
    required this.bg,
    required this.fg,
    required this.border,
    required this.icon,
  });

  factory _StatusStyle.from(ItemStatus status) {
    switch (status) {
      case ItemStatus.active:
        return _StatusStyle(
          label: 'Ativo',
          bg: const Color(0xFF2B5BEE).withOpacity(0.12),
          fg: const Color(0xFF2B5BEE),
          border: const Color(0xFF2B5BEE).withOpacity(0.35),
          icon: Icons.check_circle_outline,
        );
      case ItemStatus.pending:
        return _StatusStyle(
          label: 'Pendente',
          bg: const Color(0xFFFFB020).withOpacity(0.14),
          fg: const Color(0xFFB06A00),
          border: const Color(0xFFFFB020).withOpacity(0.35),
          icon: Icons.schedule,
        );
      case ItemStatus.canceled:
        return _StatusStyle(
          label: 'Cancelado',
          bg: Colors.redAccent.withOpacity(0.12),
          fg: Colors.redAccent,
          border: Colors.redAccent.withOpacity(0.30),
          icon: Icons.block,
        );
    }
  }
}

class _StatusOption extends StatelessWidget {
  final ItemStatus status;
  final ItemStatus current;
  final VoidCallback onTap;

  const _StatusOption({
    required this.status,
    required this.current,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = _StatusStyle.from(status);
    final selected = status == current;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: selected ? s.bg : const Color(0xFFF5F7FD),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: selected ? s.border : const Color(0xFFE6EAF6),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: s.bg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: s.border),
                ),
                child: Icon(s.icon, color: s.fg, size: 18),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  s.label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1F2A44),
                  ),
                ),
              ),
              if (selected)
                Icon(Icons.check, color: s.fg, size: 18)
              else
                const Icon(Icons.chevron_right, color: Color(0xFF8A96C8)),
            ],
          ),
        ),
      ),
    );
  }
}

/* ------------------- TILES / CARDS ------------------- */

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

class _EditableFieldTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onEdit;

  const _EditableFieldTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.onEdit,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      splashColor: _primary.withOpacity(0.06),
      onTap: onEdit,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _ink.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: _ink, size: 20),
            ),
            const SizedBox(width: 14),
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
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value.isEmpty ? 'Não informado' : value,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: _ink,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: _primary.withOpacity(0.10),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.edit_outlined, color: _primary, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class _EditableMultilineTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onEdit;

  final double minHeight;
  final int maxPreviewLines;

  const _EditableMultilineTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.onEdit,
    this.minHeight = 120,
    this.maxPreviewLines = 6,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      splashColor: _primary.withOpacity(0.06),
      onTap: onEdit,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _ink.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: _ink, size: 20),
            ),
            const SizedBox(width: 14),
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
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    value.isEmpty
                        ? 'Toque para adicionar uma observação…'
                        : value,
                    maxLines: maxPreviewLines,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.35,
                      fontWeight: FontWeight.w600,
                      color: value.isEmpty ? _muted : _ink,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: _primary.withOpacity(0.10),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.edit_outlined, color: _primary, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class _SoftDivider extends StatelessWidget {
  const _SoftDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      indent: 70,
      color: Color(0xFFE6EAF6),
    );
  }
}

class _DangerZone extends StatelessWidget {
  final VoidCallback onDelete;

  const _DangerZone({required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
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
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onDelete,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: const [
              Icon(Icons.delete_outline, color: Colors.redAccent),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Remover item',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, color: Color(0xFF8A96C8)),
            ],
          ),
        ),
      ),
    );
  }
}
