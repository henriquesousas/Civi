import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestPage5Dark extends StatefulWidget {
  const TestPage5Dark({super.key});

  @override
  State<TestPage5Dark> createState() => _TestPage5DarkState();
}

enum ItemStatus { active, pending, canceled, stolen }

class _TestPage5DarkState extends State<TestPage5Dark> {
  String name = 'CG Titan 150';
  String brand = 'Honda';
  String color = 'Vermelha';
  String year = '2022';
  String plate = 'ABC1D23';
  String notes =
      'Placa final 7. Adesivo no paralama traseiro. Pequeno risco no tanque.';
  String location = 'Barueri • SP';
  String createdAt = 'Cadastrado em 12/03/2026';

  ItemStatus status = ItemStatus.active;

  final List<ImageProvider> photos = const [
    NetworkImage(
        'https://pub-0366da0e0a6d49998a77e988d464e762.r2.dev/products/374d51f7-b49a-4360-b5f7-3a8e5c4d995b/1773266101597.jpeg'),
    NetworkImage(
        'https://pub-0366da0e0a6d49998a77e988d464e762.r2.dev/products/374d51f7-b49a-4360-b5f7-3a8e5c4d995b/1773265782644.jpeg'),
    NetworkImage(
        'https://pub-0366da0e0a6d49998a77e988d464e762.r2.dev/products/374d51f7-b49a-4360-b5f7-3a8e5c4d995b/1773343050076.jpeg'),
  ];

  int selectedPhoto = 0;
  final _pageCtrl = PageController();

  static const _bg = Colors.black;
  static const _surface = Color(0xFF050505);
  static const _card = Color(0xFF101012);
  static const _line = Color(0xFF1C1C1E);
  static const _lineSoft = Color(0xFF232329);
  static const _ink = Colors.white;
  static const _muted = Color(0xFF8D8D93);
  static const _primary = Color(0xFF8F98FF);

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 420,
              pinned: true,
              elevation: 0,
              leading: TopCircleButton(
                icon: CupertinoIcons.back,
                onTap: () => Navigator.pop(context),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: TopCircleButton(
                    icon: CupertinoIcons.check_mark,
                    onTap: () {},
                  ),
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    /// GALERIA DE IMAGENS
                    DarkPhotosGalleryHero(
                      photos: photos,
                      selectedIndex: selectedPhoto,
                      controller: _pageCtrl,
                      onIndexChanged: (i) {
                        setState(() {
                          selectedPhoto = i;
                        });
                      },
                      onOpenZoom: (i) => _openPhotoViewer(context, photos, i),
                    ),

                    /// GRADIENT
                    // const DecoratedBox(
                    //   decoration: BoxDecoration(
                    //     gradient: LinearGradient(
                    //       begin: Alignment.topCenter,
                    //       end: Alignment.bottomCenter,
                    //       colors: [
                    //         Colors.transparent,
                    //         Colors.transparent,
                    //         Colors.transparent
                    //       ],
                    //     ),
                    //   ),
                    // ),`
                    IgnorePointer(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.12),
                              Colors.black.withValues(alpha: 0.12),
                              Colors.black.withValues(alpha: 0.12),
                              Colors.black.withValues(alpha: 0.32),
                            ],
                            stops: const [0.0, 0.35, 0.68, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },

        /// SHEET CONTENT
        body: Container(
          decoration: const BoxDecoration(
            color: _surface,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(32),
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 120),
            children: [
              /// HANDLE
              Center(
                child: Container(
                  width: 54,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              _HeaderCardDark(
                title: name,
                subtitle: 'Toque nos campos para editar',
                status: status,
                createdAt: createdAt,
                onTapStatus: () async {
                  final newStatus = await _pickStatus(context, status);
                  if (newStatus != null) {
                    setState(() => status = newStatus);
                  }
                },
              ),

              const SizedBox(height: 18),

              const _SectionTitleDark('Informações do item'),

              _CardDark(
                child: Column(
                  children: [
                    _EditableFieldTileDark(
                      icon: CupertinoIcons.cube_box,
                      label: 'Nome',
                      value: name,
                      onEdit: () {},
                    ),
                    const _SoftDividerDark(),
                    _EditableFieldTileDark(
                      icon: CupertinoIcons.tag,
                      label: 'Marca',
                      value: brand,
                      onEdit: () {},
                    ),
                    const _SoftDividerDark(),
                    _EditableFieldTileDark(
                      icon: CupertinoIcons.paintbrush,
                      label: 'Cor',
                      value: color,
                      onEdit: () {},
                    ),
                    const _SoftDividerDark(),
                    _EditableFieldTileDark(
                      icon: CupertinoIcons.calendar,
                      label: 'Ano',
                      value: year,
                      onEdit: () {},
                    ),
                    const _SoftDividerDark(),
                    _EditableFieldTileDark(
                      icon: CupertinoIcons.number,
                      label: 'Placa',
                      value: plate,
                      onEdit: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              const _SectionTitleDark('Observação'),

              _CardDark(
                child: _EditableMultilineTileDark(
                  icon: CupertinoIcons.doc_text,
                  label: 'Descrição',
                  value: notes,
                  onEdit: () {},
                ),
              ),

              const SizedBox(height: 18),

              const _SectionTitleDanger('Danger Zone'),

              _DangerZoneDark(
                onDelete: () {},
              ),
            ],
          ),
        ),
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
            color: Color(0xFF101012),
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
                      color: const Color(0xFF2A2A2D),
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
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                _StatusOptionDark(
                  status: ItemStatus.active,
                  current: current,
                  onTap: () => Navigator.pop(context, ItemStatus.active),
                ),
                _StatusOptionDark(
                  status: ItemStatus.pending,
                  current: current,
                  onTap: () => Navigator.pop(context, ItemStatus.pending),
                ),
                _StatusOptionDark(
                  status: ItemStatus.canceled,
                  current: current,
                  onTap: () => Navigator.pop(context, ItemStatus.canceled),
                ),
                _StatusOptionDark(
                  status: ItemStatus.stolen,
                  current: current,
                  onTap: () => Navigator.pop(context, ItemStatus.stolen),
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
      barrierColor: Colors.black.withOpacity(0.94),
      builder: (_) => _PhotoViewerDialogDark(
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
              color: Color(0xFF101012),
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
                        color: const Color(0xFF2A2A2D),
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
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: controller,
                    maxLength: maxLen,
                    maxLines: maxLines,
                    keyboardType: keyboardType,
                    inputFormatters: inputFormatters,
                    textCapitalization: toUpperCase
                        ? TextCapitalization.characters
                        : TextCapitalization.none,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: const TextStyle(color: Color(0xFF7F828B)),
                      counterStyle: const TextStyle(color: Color(0xFF8D8D93)),
                      filled: true,
                      fillColor: const Color(0xFF16161A),
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
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Color(0xFF2B2B30)),
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
  }
}

/* ------------------- HERO GALLERY ------------------- */

class DarkPhotosGalleryHero extends StatelessWidget {
  final List<ImageProvider> photos;
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;
  final PageController controller;
  final ValueChanged<int> onOpenZoom;

  const DarkPhotosGalleryHero({
    required this.photos,
    required this.selectedIndex,
    required this.onIndexChanged,
    required this.controller,
    required this.onOpenZoom,
  });

  @override
  Widget build(BuildContext context) {
    final hasPhotos = photos.isNotEmpty;

    if (!hasPhotos) {
      return Container(
        color: const Color(0xFF111214),
        child: const Center(
          child: Icon(
            CupertinoIcons.photo,
            color: Colors.white38,
            size: 46,
          ),
        ),
      );
    }

    return Stack(
      children: [
        PageView.builder(
          controller: controller,
          itemCount: photos.length,
          onPageChanged: onIndexChanged,
          itemBuilder: (_, i) {
            return GestureDetector(
              onTap: () => onOpenZoom(i),
              child: Image(
                image: photos[i],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            );
          },
        ),
        Positioned(
          right: 16,
          bottom: 68,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.50),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white12),
            ),
            child: const Row(
              children: [
                Icon(
                  CupertinoIcons.zoom_in,
                  size: 14,
                  color: Colors.white,
                ),
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
        Positioned(
          left: 16,
          right: 16,
          bottom: 18,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 64,
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
                                ? const Color(0x338F98FF)
                                : const Color(0x33121214),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: selected
                                  ? const Color(0xFF8F98FF)
                                  : Colors.white10,
                              width: selected ? 1.5 : 1,
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
              ),
              const SizedBox(width: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.45),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.white10),
                ),
                child: Text(
                  '${selectedIndex + 1}/${photos.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PhotoViewerDialogDark extends StatefulWidget {
  final List<ImageProvider> photos;
  final int initialIndex;

  const _PhotoViewerDialogDark({
    required this.photos,
    required this.initialIndex,
  });

  @override
  State<_PhotoViewerDialogDark> createState() => _PhotoViewerDialogDarkState();
}

class _PhotoViewerDialogDarkState extends State<_PhotoViewerDialogDark> {
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
                  child: Image(
                    image: widget.photos[i],
                    fit: BoxFit.contain,
                  ),
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
                TopCircleButton(
                  icon: CupertinoIcons.clear,
                  onTap: () => Navigator.pop(context),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(99),
                    border:
                        Border.all(color: Colors.white.withValues(alpha: 0.18)),
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

/* ------------------- HEADER ------------------- */

class _HeaderCardDark extends StatelessWidget {
  final String title;
  final String subtitle;
  final String createdAt;
  final ItemStatus status;
  final VoidCallback onTapStatus;

  const _HeaderCardDark({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.createdAt,
    required this.onTapStatus,
  });

  @override
  Widget build(BuildContext context) {
    final style = _StatusStyleDark.from(status);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF101012),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF1D1D21)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [Color(0xFF8F98FF), Color(0xFF606BFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Icon(
              CupertinoIcons.cube_box,
              color: Colors.white,
            ),
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
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: onTapStatus,
                      borderRadius: BorderRadius.circular(99),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
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
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF8D8D93),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  createdAt,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6F737C),
                    fontWeight: FontWeight.w500,
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

class _StatusStyleDark {
  final String label;
  final Color bg;
  final Color fg;
  final Color border;
  final IconData icon;

  const _StatusStyleDark({
    required this.label,
    required this.bg,
    required this.fg,
    required this.border,
    required this.icon,
  });

  factory _StatusStyleDark.from(ItemStatus status) {
    switch (status) {
      case ItemStatus.active:
        return _StatusStyleDark(
          label: 'Ativo',
          bg: const Color(0x1422C55E),
          fg: const Color(0xFF22C55E),
          border: const Color(0x5522C55E),
          icon: CupertinoIcons.check_mark_circled,
        );
      case ItemStatus.pending:
        return _StatusStyleDark(
          label: 'Pendente',
          bg: const Color(0x14F59E0B),
          fg: const Color(0xFFF59E0B),
          border: const Color(0x55F59E0B),
          icon: CupertinoIcons.time,
        );
      case ItemStatus.canceled:
        return _StatusStyleDark(
          label: 'Cancelado',
          bg: const Color(0x146B7280),
          fg: const Color(0xFF6B7280),
          border: const Color(0x556B7280),
          icon: CupertinoIcons.xmark_circle,
        );
      case ItemStatus.stolen:
        return _StatusStyleDark(
          label: 'Roubado',
          bg: const Color(0x14EF4444),
          fg: const Color(0xFFEF4444),
          border: const Color(0x55EF4444),
          icon: CupertinoIcons.exclamationmark_triangle,
        );
    }
  }
}

class _StatusOptionDark extends StatelessWidget {
  final ItemStatus status;
  final ItemStatus current;
  final VoidCallback onTap;

  const _StatusOptionDark({
    required this.status,
    required this.current,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = _StatusStyleDark.from(status);
    final selected = status == current;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: selected ? s.bg : const Color(0xFF15161A),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: selected ? s.border : const Color(0xFF26272C),
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
                    color: Colors.white,
                  ),
                ),
              ),
              if (selected)
                Icon(CupertinoIcons.checkmark, color: s.fg, size: 18)
              else
                const Icon(CupertinoIcons.chevron_right,
                    color: Color(0xFF8D8D93)),
            ],
          ),
        ),
      ),
    );
  }
}

/* ------------------- CARDS / TILES ------------------- */

class _CardDark extends StatelessWidget {
  final Widget child;

  const _CardDark({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF101012),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF1D1D21)),
      ),
      child: child,
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
          color: Color(0xFF8D8D93),
          letterSpacing: 1.15,
        ),
      ),
    );
  }
}

class _SectionTitleDanger extends StatelessWidget {
  final String text;

  const _SectionTitleDanger(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 10),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Color(0xFFFF7373),
          letterSpacing: 1.15,
        ),
      ),
    );
  }
}

class _EditableFieldTileDark extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onEdit;

  const _EditableFieldTileDark({
    required this.icon,
    required this.label,
    required this.value,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onEdit,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1F),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 20),
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
                      color: Color(0xFF8D8D93),
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value.isEmpty ? 'Não informado' : value,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
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
                color: const Color(0x148F98FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                CupertinoIcons.pencil,
                color: Color(0xFF8F98FF),
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EditableMultilineTileDark extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onEdit;
  final double minHeight;
  final int maxPreviewLines;

  const _EditableMultilineTileDark({
    required this.icon,
    required this.label,
    required this.value,
    required this.onEdit,
    this.minHeight = 120,
    this.maxPreviewLines = 6,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
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
                color: const Color(0xFF1A1A1F),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 20),
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
                      color: Color(0xFF8D8D93),
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
                      height: 1.4,
                      fontWeight: FontWeight.w600,
                      color: value.isEmpty
                          ? const Color(0xFF8D8D93)
                          : Colors.white,
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
                color: const Color(0x148F98FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                CupertinoIcons.pencil,
                color: Color(0xFF8F98FF),
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SoftDividerDark extends StatelessWidget {
  const _SoftDividerDark();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      indent: 70,
      color: Color(0xFF1C1C1E),
    );
  }
}

class _DangerZoneDark extends StatelessWidget {
  final VoidCallback onDelete;

  const _DangerZoneDark({required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF151010),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF3A1E22)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onDelete,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: [
              Icon(CupertinoIcons.trash, color: Color(0xFFEF4444)),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Remover item',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFEF4444),
                  ),
                ),
              ),
              Icon(CupertinoIcons.chevron_right, color: Color(0xFF8D8D93)),
            ],
          ),
        ),
      ),
    );
  }
}

class TopCircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const TopCircleButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.34),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 42,
          height: 42,
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
