import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

//IncidentDetailsFakePage
class TestPage7 extends StatefulWidget {
  const TestPage7({super.key});

  @override
  State<TestPage7> createState() => _TestPage7State();
}

enum IncidentStatus { open, inReview, recovered, canceled }

enum ItemType { car, moto, phone }

class _TestPage7State extends State<TestPage7> {
  static const _bg = Color(0xFFF5F7FD);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);

  // --------- FAKE DATA ----------
  final bool isOwner = true; // ✅ troque para true para ver Danger Zone

  final String incidentId = 'INC-20391';
  final ItemType itemType = ItemType.phone; // car | moto | phone

  final String itemName = 'iPhone 13';
  final String brand = 'Apple';
  final String color = 'Preto';
  final String region = 'Bairro Centro • São Paulo/SP';
  final String dateLabel = 'há 2 dias';

  final String plate = 'ABC1D23'; // veículo
  final String imei = '356789101234567'; // celular

  IncidentStatus status = IncidentStatus.open;

  String howHappened =
      'O celular foi levado enquanto eu estava em um ponto de ônibus. '
      'Aconteceu muito rápido, não consegui identificar a pessoa.';

  // Fotos fake (só para veículo)
  final List<String> vehiclePhotos = const [
    'https://images.unsplash.com/photo-1525609004556-c46c7d6cf023?auto=format&fit=crop&w=1200&q=60',
    'https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=1200&q=60',
    'https://images.unsplash.com/photo-1525609004556-c46c7d6cf023?auto=format&fit=crop&w=1200&q=60',
  ];

  bool get isVehicle => itemType == ItemType.car || itemType == ItemType.moto;
  // bool get isVehicle => true;

  String get itemTypeLabel {
    switch (itemType) {
      case ItemType.car:
        return 'Carro';
      case ItemType.moto:
        return 'Moto';
      case ItemType.phone:
        return 'Celular';
    }
  }

  String get statusLabel {
    switch (status) {
      case IncidentStatus.open:
        return 'Aberta';
      case IncidentStatus.inReview:
        return 'Em análise';
      case IncidentStatus.recovered:
        return 'Recuperado';
      case IncidentStatus.canceled:
        return 'Cancelado';
    }
  }

  // --------- Actions ----------
  String _buildShareText() {
    final plateText = isVehicle ? '\nPlaca: $plate' : '';
    final imeiText = (!isVehicle) ? '\nIMEI: $imei' : '';

    return '🚨 Ocorrência registrada\n'
        'Item: $itemName ($itemTypeLabel)\n'
        'Status: $statusLabel\n'
        'Região: $region\n'
        'Quando: $dateLabel\n'
        'ID: $incidentId'
        '$plateText$imeiText\n\n'
        '📌 Como aconteceu: ${howHappened.isEmpty ? 'Não informado.' : howHappened}';
  }

  void _shareGeneral() {
    Share.share(_buildShareText(), subject: 'Ocorrência • $itemName');
  }

  Future<void> _shareWhatsApp() async {
    final text = Uri.encodeComponent(_buildShareText());
    final uriApp = Uri.parse('whatsapp://send?text=$text');
    final uriWeb = Uri.parse('https://wa.me/?text=$text');

    if (await canLaunchUrl(uriApp)) {
      await launchUrl(uriApp);
      return;
    }
    if (await canLaunchUrl(uriWeb)) {
      await launchUrl(uriWeb, mode: LaunchMode.externalApplication);
      return;
    }

    _shareGeneral();
    _toast('WhatsApp não disponível. Usei compartilhamento padrão.');
  }

  Future<void> _callPolice() async {
    // Brasil: 190
    final uri = Uri.parse('tel:190');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      _toast('Não foi possível iniciar a chamada.');
    }
  }

  Future<void> _copyImei() async {
    await Clipboard.setData(ClipboardData(text: imei));
    _toast('IMEI copiado.');
  }

  Future<void> _onRecoveredChanged(bool value) async {
    // Liga o switch
    if (value) {
      final ok = await showDialog<bool>(
        context: context,
        barrierDismissible: true,
        builder: (_) => _RecoveredCongratsDialog(
          itemName: itemName,
          onConfirm: () => Navigator.pop(context, true),
        ),
      );

      if (ok == true) {
        setState(() => status = IncidentStatus.recovered);
      }
      return;
    }

    // Desliga o switch (opcional)
    final ok = await showDialog<bool>(
      context: context,
      barrierColor: Colors.black.withOpacity(0.45),
      builder: (_) => _RecoveredUndoDialog(
        onConfirm: () => Navigator.pop(context, true),
      ),
    );

    if (ok == true) {
      setState(() => status = IncidentStatus.open);
    }
  }

  Future<void> _editHowHappened() async {
    final edited = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _EditLongTextSheet(
        title: 'Como aconteceu',
        subtitle: 'Descreva em até 300 caracteres.',
        initial: howHappened,
        maxLen: 300,
      ),
    );
    if (edited == null) return;
    setState(() => howHappened = edited);
  }

  Future<void> _markRecovered() async {
    if (!isOwner) return;

    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => const _ConfirmDialog(
        title: 'Marcar como recuperado?',
        message:
            'Essa ação indica que o item já foi encontrado e a ocorrência ficará como “Recuperado”.',
        confirmLabel: 'Sim, marcar',
      ),
    );
    if (ok != true) return;

    setState(() => status = IncidentStatus.recovered);
  }

  Future<void> _cancelIncident() async {
    if (!isOwner) return;

    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => const _ConfirmDialog(
        title: 'Cancelar ocorrência?',
        message:
            'Use apenas se você registrou por engano. A ocorrência ficará como “Cancelado”.',
        confirmLabel: 'Sim, cancelar',
      ),
    );
    if (ok != true) return;

    setState(() => status = IncidentStatus.canceled);
  }

  Future<void> _openPhoto(int index) async {
    await showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.92),
      builder: (_) => _PhotoViewerDialog(
        photos: vehiclePhotos,
        initialIndex: index,
      ),
    );
  }

  void _toast(String msg) {
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // --------- UI ----------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: _ink),
        title: const Text(
          'Detalhes da ocorrência',
          style: TextStyle(color: _ink, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: _shareGeneral,
            icon: const Icon(Icons.share_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                      style: const TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.w900,
                        color: _ink,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$region • $dateLabel',
                      style: const TextStyle(
                        fontSize: 13.5,
                        color: _muted,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              _StatusPill(status: status),
            ],
          ),

          // ✅ Veículo => fotos em card horizontal
          if (isVehicle) ...[
            const SizedBox(height: 16),
            const _SectionTitle('Fotos do veículo'),
            _Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const _LeadingIcon(icon: Icons.photo_library_outlined),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Imagens do item',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: _ink,
                            ),
                          ),
                        ),
                        _CountPill(count: vehiclePhotos.length),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _HorizontalPhotos(
                      photos: vehiclePhotos,
                      onTap: _openPhoto,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Dica: fotos nítidas ajudam a identificar o veículo mais rápido.',
                      style: TextStyle(
                        fontSize: 12.5,
                        color: _muted,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],

          // ✅ Celular => Card IMEI (no lugar das fotos)
          if (!isVehicle) ...[
            const SizedBox(height: 16),
            const _SectionTitle('IMEI'),
            _Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const _LeadingIcon(icon: Icons.dialpad_outlined),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Identificação do aparelho',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: _ink,
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: SizedBox(
                            height: 60,
                            child: OutlinedButton.icon(
                              onPressed: _copyImei,
                              icon: const Icon(Icons.copy_outlined, size: 18),
                              label: const Text(
                                'Copiar',
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: _primary,
                                side: BorderSide(
                                    color: _primary.withOpacity(0.35)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F7FD),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: const Color(0xFFE6EAF6)),
                      ),
                      child: Text(
                        imei,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: _ink,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Você pode informar esse número às autoridades e operadoras.',
                      style: TextStyle(
                        fontSize: 12.5,
                        color: _muted,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],

          const SizedBox(height: 16),
          const _SectionTitle('Informações'),
          _Card(
            child: Column(
              children: [
                _InfoTile(
                  icon: Icons.fingerprint_outlined,
                  title: 'ID da ocorrência',
                  value: incidentId,
                ),
                const _DividerIndented(),
                _InfoTile(
                  icon: Icons.category_outlined,
                  title: 'Tipo do item',
                  value: itemTypeLabel,
                ),
                const _DividerIndented(),
                _InfoTile(
                  icon: Icons.branding_watermark_outlined,
                  title: 'Marca',
                  value: brand,
                  canEdit: isOwner,
                  onTap: () => _toast('Editar marca (owner only)'),
                ),
                const _DividerIndented(),
                _InfoTile(
                  icon: Icons.color_lens_outlined,
                  title: 'Cor',
                  value: color,
                  canEdit: isOwner,
                  onTap: () => _toast('Editar cor (owner only)'),
                ),
                const _DividerIndented(),
                _InfoTile(
                  icon: Icons.place_outlined,
                  title: 'Região',
                  value: region,
                  canEdit: isOwner,
                  onTap: () => _toast('Editar região (owner only)'),
                ),
                if (isVehicle) ...[
                  const _DividerIndented(),
                  _InfoTile(
                    icon: Icons.confirmation_number_outlined,
                    title: 'Placa',
                    value: plate,
                    canEdit: isOwner,
                    onTap: () => _toast('Editar placa (owner only)'),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 16),
          const _SectionTitle('Como aconteceu'),
          _Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const _LeadingIcon(icon: Icons.description_outlined),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Descrição (até 300 caracteres)',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: _muted,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                      if (isOwner) _EditPillButton(onTap: _editHowHappened),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    howHappened.isEmpty
                        ? 'Nenhuma descrição informada.'
                        : howHappened,
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.35,
                      color: howHappened.isEmpty ? _muted : _ink,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),
          const _SectionTitle('Ações'),
          _Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // ✅ qualquer usuário pode ligar pra polícia
                  _ActionTile(
                    icon: Icons.local_police_outlined,
                    title: 'Chamar a polícia',
                    subtitle: 'Discar 190',
                    onTap: _callPolice,
                    isPrimary: true,
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _shareWhatsApp,
                          icon: const Icon(Icons.chat_bubble_outline),
                          label: const Text(
                            'WhatsApp',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: _primary,
                            side: BorderSide(color: _primary.withOpacity(0.35)),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _shareGeneral,
                          icon: const Icon(Icons.share_outlined),
                          label: const Text(
                            'Compartilhar',
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
                ],
              ),
            ),
          ),

          // ✅ Danger zone: só dono
          if (isOwner) ...[
            const SizedBox(height: 16),
            const _SectionTitle('Danger zone'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // const _DangerZoneHeader(),

                // const SizedBox(height: 14),

                // ✅ Switch "Item recuperado"
                _Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: _RecoveredSwitchCard(
                      value: status == IncidentStatus.recovered,
                      onChanged: _onRecoveredChanged,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // ❌ Cancelar ocorrência
                _DangerCard(
                  title: 'Cancelar ocorrência',
                  subtitle: 'Use apenas se o registro foi feito por engano.',
                  icon: Icons.cancel_outlined,
                  onTap: _cancelIncident,
                  destructive: true,
                ),
              ],
            ),
          ],

          // _DangerCard(
          //   title: 'Marcar como recuperado',
          //   subtitle: 'Indica que o item já foi encontrado.',
          //   icon: Icons.verified_outlined,
          //   onTap: _markRecovered,
          // ),
        ],
      ),
    );
  }
}

/* ------------------ Components ------------------ */

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

class _LeadingIcon extends StatelessWidget {
  final IconData icon;
  const _LeadingIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF1F2A44).withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: const Color(0xFF1F2A44), size: 20),
    );
  }
}

class _CountPill extends StatelessWidget {
  final int count;
  const _CountPill({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF2B5BEE).withOpacity(0.10),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        '$count',
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w900,
          color: Color(0xFF2B5BEE),
        ),
      ),
    );
  }
}

class _HorizontalPhotos extends StatelessWidget {
  final List<String> photos;
  final void Function(int index) onTap;

  const _HorizontalPhotos({required this.photos, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: photos.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          final url = photos[i];
          return InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () => onTap(i),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: AspectRatio(
                aspectRatio: 1.2,
                child: Image.network(url, fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PhotoViewerDialog extends StatefulWidget {
  final List<String> photos;
  final int initialIndex;
  const _PhotoViewerDialog({required this.photos, required this.initialIndex});

  @override
  State<_PhotoViewerDialog> createState() => _PhotoViewerDialogState();
}

class _PhotoViewerDialogState extends State<_PhotoViewerDialog> {
  late final PageController controller =
      PageController(initialPage: widget.initialIndex);
  int index = 0;

  @override
  void initState() {
    super.initState();
    index = widget.initialIndex;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller,
            onPageChanged: (i) => setState(() => index = i),
            itemCount: widget.photos.length,
            itemBuilder: (_, i) => InteractiveViewer(
              child: Center(
                child: Image.network(widget.photos[i], fit: BoxFit.contain),
              ),
            ),
          ),
          Positioned(
            top: 18,
            left: 16,
            child: _TopBadge(text: '${index + 1}/${widget.photos.length}'),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopBadge extends StatelessWidget {
  final String text;
  const _TopBadge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.45),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 12,
        ),
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

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final bool canEdit;
  final VoidCallback? onTap;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.value,
    this.canEdit = false,
    this.onTap,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: canEdit ? onTap : null,
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
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
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
                      fontWeight: FontWeight.w800,
                      color: _ink,
                    ),
                  ),
                ],
              ),
            ),
            if (canEdit)
              const Icon(Icons.edit_outlined, color: _muted)
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isPrimary;

  const _ActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isPrimary = false,
  });

  static const _primary = Color(0xFF2B5BEE);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color:
              isPrimary ? _primary.withOpacity(0.08) : const Color(0xFFF5F7FD),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isPrimary
                ? _primary.withOpacity(0.20)
                : const Color(0xFFE6EAF6),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isPrimary
                    ? _primary.withOpacity(0.14)
                    : _ink.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: isPrimary ? _primary : _ink, size: 20),
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

class _DangerCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final bool destructive;

  const _DangerCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.destructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = destructive ? Colors.redAccent : const Color(0xFFFB8C00);

    return InkWell(
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
          border: Border.all(color: color.withOpacity(0.22)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: color),
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
                        color: Color(0xFF1F2A44),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12.5,
                        color: Color(0xFF8A96C8),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Color(0xFF8A96C8)),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  final IncidentStatus status;
  const _StatusPill({required this.status});

  Color get _color {
    switch (status) {
      case IncidentStatus.open:
        return const Color(0xFFE53935);
      case IncidentStatus.inReview:
        return const Color(0xFFFB8C00);
      case IncidentStatus.recovered:
        return const Color(0xFF43A047);
      case IncidentStatus.canceled:
        return const Color(0xFF8A96C8);
    }
  }

  String get _label {
    switch (status) {
      case IncidentStatus.open:
        return 'ABERTA';
      case IncidentStatus.inReview:
        return 'EM ANÁLISE';
      case IncidentStatus.recovered:
        return 'RECUPERADO';
      case IncidentStatus.canceled:
        return 'CANCELADO';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: _color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: _color.withOpacity(0.22)),
      ),
      child: Text(
        _label,
        style: TextStyle(
          color: _color,
          fontWeight: FontWeight.w900,
          fontSize: 12,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}

/* ---------------- Dialogs / Sheet ---------------- */

class _ConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmLabel;

  const _ConfirmDialog({
    required this.title,
    required this.message,
    required this.confirmLabel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(confirmLabel),
        ),
      ],
    );
  }
}

class _EditLongTextSheet extends StatefulWidget {
  final String title;
  final String subtitle;
  final String initial;
  final int maxLen;

  const _EditLongTextSheet({
    required this.title,
    required this.subtitle,
    required this.initial,
    required this.maxLen,
  });

  @override
  State<_EditLongTextSheet> createState() => _EditLongTextSheetState();
}

class _EditLongTextSheetState extends State<_EditLongTextSheet> {
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);

  late final TextEditingController ctrl =
      TextEditingController(text: widget.initial);

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
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
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: _ink,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Fechar'),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.subtitle,
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: _muted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: ctrl,
                maxLength: widget.maxLen,
                maxLines: 7,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF5F7FD),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Digite aqui…',
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context, ctrl.text.trim()),
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
    );
  }
}

class _EditPillButton extends StatelessWidget {
  final VoidCallback onTap;
  const _EditPillButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(99),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F7FD),
          borderRadius: BorderRadius.circular(99),
          border: Border.all(color: const Color(0xFFE6EAF6)),
        ),
        child: const Row(
          children: [
            Icon(Icons.edit_outlined, size: 16, color: Color(0xFF8A96C8)),
            SizedBox(width: 6),
            Text(
              'Editar',
              style: TextStyle(
                color: Color(0xFF8A96C8),
                fontWeight: FontWeight.w900,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecoveredSwitchCard extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const _RecoveredSwitchCard({
    required this.value,
    required this.onChanged,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    final bg = value
        ? const Color(0xFF43A047).withOpacity(0.10)
        : const Color(0xFFF5F7FD);
    final border = value
        ? const Color(0xFF43A047).withOpacity(0.22)
        : const Color(0xFFE6EAF6);
    final iconBg = value
        ? const Color(0xFF43A047).withOpacity(0.14)
        : _ink.withOpacity(0.08);
    final iconColor = value ? const Color(0xFF43A047) : _ink;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: border),
      ),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: iconColor.withOpacity(0.18)),
            ),
            child: Icon(
              Icons.verified_outlined,
              color: iconColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item recuperado',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: _ink,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Ative se você já encontrou o item.',
                  style: TextStyle(
                    color: _muted,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.5,
                  ),
                ),
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

class _RecoveredCongratsDialog extends StatelessWidget {
  final String itemName;
  final VoidCallback onConfirm;

  const _RecoveredCongratsDialog({
    required this.itemName,
    required this.onConfirm,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF6B7AAE);
  static const _green = Color(0xFF43A047);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white, // ✅ força branco
      elevation: 16,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // ✅ garante fundo
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Color(0x22000000),
              blurRadius: 24,
              offset: Offset(0, 12),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Ícone
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: _green.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: _green.withOpacity(0.20)),
                ),
                child: const Icon(
                  Icons.celebration_outlined,
                  color: _green,
                  size: 26,
                ),
              ),

              const SizedBox(height: 16),

              // Título
              const Text(
                'Que ótima notícia! 🎉',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: _ink,
                ),
              ),

              const SizedBox(height: 10),

              // Texto
              Text(
                'Ficamos muito felizes que você recuperou o\n'
                '$itemName.\n\n'
                'Esperamos que ele esteja em bom estado.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: _muted,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),

              // Botões
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context, false),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _ink,
                        side: BorderSide(color: _ink.withOpacity(0.18)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        'Agora não',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onConfirm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _green,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        'Confirmar',
                        style: TextStyle(fontWeight: FontWeight.w900),
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
  }
}

class _RecoveredUndoDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const _RecoveredUndoDialog({
    required this.onConfirm,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF6B7AAE);
  static const _orange = Color(0xFFFB8C00);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 16,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Color(0x22000000),
              blurRadius: 24,
              offset: Offset(0, 12),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Ícone
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: _orange.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: _orange.withOpacity(0.20)),
                ),
                child: const Icon(
                  Icons.undo_rounded,
                  color: _orange,
                  size: 26,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'Desfazer recuperação?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: _ink,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Ao confirmar, a ocorrência voltará para o status\n'
                '“Aberta” e poderá ser visualizada novamente\n'
                'como um item não recuperado.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: _muted,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context, false),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _ink,
                        side: BorderSide(color: _ink.withOpacity(0.18)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        'Manter recuperado',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onConfirm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _orange,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        'Desmarcar',
                        style: TextStyle(fontWeight: FontWeight.w900),
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
  }
}

class _DangerZoneContainer extends StatelessWidget {
  final Widget child;

  const _DangerZoneContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEBEE)
            .withValues(alpha: 0.2), // 🔴 vermelho bem claro
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: const Color(0xFFE53935).withOpacity(0.1),
        ),
      ),
      child: child,
    );
  }
}

class _DangerZoneHeader extends StatelessWidget {
  const _DangerZoneHeader();

  static const _red = Color(0xFFE53935);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF6B7AAE);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _red.withOpacity(0.12),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: _red.withOpacity(0.22)),
          ),
          child: const Icon(
            Icons.warning_amber_rounded,
            color: _red,
            size: 22,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Zona de risco',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  color: _ink,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Ações sensíveis que alteram o status da ocorrência.',
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: _muted,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
