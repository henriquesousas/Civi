import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/cards/card_exports.dart';
import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

//CreateItemWizardPage
class TestPage40 extends StatefulWidget {
  const TestPage40({super.key});

  @override
  State<TestPage40> createState() => _TestPage40State();
}

enum ItemType { car, moto, phone }

class _TestPage40State extends State<TestPage40> {
  static const _bg = Color(0xFFF5F7FD);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);

  final _picker = ImagePicker();
  final List<XFile> photos = [];

  int step = 0;

  ItemType? type;
  String? createdItemId;
  bool loading = false;

  // Controllers para Step 2 (exemplo)
  final nameCtrl = TextEditingController();
  final brandCtrl = TextEditingController();
  final colorCtrl = TextEditingController();
  final yearCtrl = TextEditingController();
  final plateCtrl = TextEditingController();
  final notesCtrl = TextEditingController();
  final imeiCtrl = TextEditingController();

  Future<void> pickPhotosFromGallery() async {
    try {
      final picked = await _picker.pickMultiImage(imageQuality: 85);
      if (picked.isEmpty) return;
      setState(() => photos.addAll(picked));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível selecionar as fotos.')),
      );
    }
  }

  Future<void> pickFromCamera() async {
    try {
      final picked =
          await _picker.pickImage(source: ImageSource.camera, imageQuality: 85);
      if (picked == null) return;
      setState(() => photos.add(picked));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível abrir a câmera.')),
      );
    }
  }

  void removePhotoAt(int index) {
    setState(() => photos.removeAt(index));
  }

  Future<void> openPhotoViewer(int index) async {
    await showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.92),
      builder: (_) =>
          _LocalPhotoViewerDialog(files: photos, initialIndex: index),
    );
  }

  Future<void> pasteImeiFromClipboard() async {
    final data = await Clipboard.getData('text/plain');
    final raw = (data?.text ?? '').trim();

    // pega só dígitos e limita 15
    final digits = raw.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) {
      _toast('Nenhum IMEI encontrado no clipboard.');
      return;
    }

    imeiCtrl.text = digits.length > 15 ? digits.substring(0, 15) : digits;
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    brandCtrl.dispose();
    colorCtrl.dispose();
    yearCtrl.dispose();
    plateCtrl.dispose();
    notesCtrl.dispose();
    imeiCtrl.dispose();
    super.dispose();
  }

  String get _title {
    switch (step) {
      case 0:
        return 'Tipo do item';
      case 1:
        return 'Informações';
      case 2:
        return 'Fotos';
      default:
        return 'Cadastrar item';
    }
  }

  String get _subtitle {
    switch (step) {
      case 0:
        return 'Escolha o tipo para continuar';
      case 1:
        return 'Preencha os dados para criar o item';
      case 2:
        return 'Envie fotos depois do cadastro concluído';
      default:
        return '';
    }
  }

  bool get isVehicle => type == ItemType.car || type == ItemType.moto;

  Future<void> _createItem() async {
    // Validação simples
    if (nameCtrl.text.trim().length < 3) {
      _toast('Informe um nome válido');
      return;
    }
    if (brandCtrl.text.trim().isEmpty) {
      _toast('Selecione uma marca');
      return;
    }

    if (isVehicle) {
      if (yearCtrl.text.trim().isEmpty) {
        _toast('Selecione o ano');
        return;
      }
      if (plateCtrl.text.trim().length != 7) {
        _toast('Informe uma placa válida (7 caracteres)');
        return;
      }
    }

    setState(() => loading = true);

    try {
      // ✅ Aqui você chama seu repository/usecase e recebe o ID
      await Future.delayed(const Duration(milliseconds: 900));

      // Exemplo de ID
      createdItemId = DateTime.now().millisecondsSinceEpoch.toString();

      if (!mounted) return;
      _toast('Item cadastrado com sucesso!');
      setState(() {
        step = 2; // vai para fotos
      });
    } catch (_) {
      _toast('Erro ao cadastrar. Tente novamente.');
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  void _toast(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _next() {
    if (step == 0) {
      if (type == null) {
        _toast('Selecione o tipo do item');
        return;
      }
      setState(() => step = 1);
      return;
    }
    if (step == 1) {
      _createItem();
      return;
    }
    if (step == 2) {
      Navigator.pop(context);
    }
  }

  void _back() {
    if (step == 0) {
      Navigator.pop(context);
      return;
    }
    setState(() => step -= 1);
  }

  Future<void> scanImeiFromCamera() async {
    final code = await Navigator.push<String?>(
      context,
      MaterialPageRoute(builder: (_) => const ImeiScannerPage()),
    );

    if (code == null) return;

    // extrai dígitos (IMEI tende a vir com caracteres extras dependendo do barcode)
    final digits = code.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.length < 14) {
      _toast('Código lido não parece um IMEI.');
      return;
    }

    imeiCtrl.text = digits.length > 15 ? digits.substring(0, 15) : digits;
  }

  @override
  Widget build(BuildContext context) {
    final canBack = step > 0;

    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: _ink),
        leading: IconButton(
          icon: Icon(canBack ? Icons.arrow_back_ios_new : Icons.close),
          onPressed: _back,
        ),
        title: Text(
          _title,
          style: const TextStyle(color: _ink, fontWeight: FontWeight.w600),
        ),
      ),
      bottomNavigationBar: _WizardBottomBar(
        step: step,
        loading: loading,
        onNext: loading ? null : _next,
        nextLabel: step == 1
            ? 'Cadastrar item'
            : (step == 2 ? 'Concluir' : 'Continuar'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 110),
        children: [
          _WizardHeader(
            step: step,
            title: _title,
            subtitle: _subtitle,
          ),
          const SizedBox(height: 14),
          if (step == 0) ...[
            const _SectionTitle('Selecione o tipo'),
            _TypeSelector(
              selected: type,
              onSelect: (t) => setState(() => type = t),
            ),
            const SizedBox(height: 14),
            // const _InfoHintCard(
            //   title: 'Dica',
            //   text:
            //       'Depois de criar o item, você poderá adicionar fotos para verificação e identificação.',
            // ),
            CardHint(
              // backgroundColor: AppColors.whiteColor,
              // iconBackgroundColor: AppColors.blackColor,
              title: "Dicas",
              message:
                  "Depois de criar o item, você poderá adicionar fotos para verificação e identificação.",
              icon: Icon(
                Icons.info_outline,
                color: _primary,
                // color: Color(0XFFFFFFFF),
                size: IconSizes.lg,
              ),
            ),
          ],
          if (step == 1) ...[
            const _SectionTitle('Dados do item'),
            _Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _SimpleTextField(
                      icon: Icons.badge_outlined,
                      label: type == ItemType.phone ? 'Modelo/Nome' : 'Nome',
                      hint: type == ItemType.phone
                          ? 'Ex: iPhone 13'
                          : 'Ex: CG Titan 150',
                      controller: nameCtrl,
                    ),
                    // _ImeiField(
                    //   controller: imeiCtrl,
                    //   onScan: scanImeiFromCamera,
                    //   onPaste: pasteImeiFromClipboard,
                    // ),
                    const SizedBox(height: 12),
                    _BrandPickerField(
                      controller: brandCtrl,
                      options: const [
                        // Carros
                        'Chevrolet', 'Citroën', 'Fiat', 'Ford', 'Honda',
                        'Hyundai', 'Jeep',
                        'Kia', 'Nissan', 'Peugeot', 'Renault', 'Toyota',
                        'Volkswagen',
                        'BMW', 'BYD', 'Chery', 'GWM', 'JAC', 'Land Rover',
                        'Mercedes-Benz',
                        'Mitsubishi', 'Volvo',

                        // Motos
                        'Dafra', 'Haojue', 'Harley-Davidson', 'Kawasaki',
                        'Royal Enfield',
                        'Shineray', 'Suzuki', 'Triumph', 'Yamaha',

                        // Celular
                        'Apple', 'Samsung', 'Motorola', 'Xiaomi', 'Realme',
                        'Asus', 'LG',
                      ],
                      onSelected: (v) => setState(() => brandCtrl.text = v),
                    ),
                    const SizedBox(height: 12),
                    _ColorPickerField(
                      controller: colorCtrl,
                      options: const [
                        ColorOption('Preto', Color(0xFF1F2A44)),
                        ColorOption('Branco', Color(0xFFFFFFFF),
                            border: Color(0xFFE6EAF6)),
                        ColorOption('Cinza', Color(0xFF9AA4B2)),
                        ColorOption('Prata', Color(0xFFC7CDD6)),
                        ColorOption('Vermelho', Color(0xFFE53935)),
                        ColorOption('Azul', Color(0xFF1E88E5)),
                        ColorOption('Verde', Color(0xFF43A047)),
                        ColorOption('Amarelo', Color(0xFFFDD835)),
                        ColorOption('Laranja', Color(0xFFFB8C00)),
                        ColorOption('Marrom', Color(0xFF6D4C41)),
                        ColorOption('Roxo', Color(0xFF8E24AA)),
                      ],
                      onSelected: (opt) =>
                          setState(() => colorCtrl.text = opt.name),
                    ),
                    if (isVehicle) ...[
                      const SizedBox(height: 12),
                      _PickerPlaceholder(
                        label: 'Ano',
                        value: yearCtrl.text.isEmpty
                            ? 'Selecionar'
                            : yearCtrl.text,
                        icon: Icons.calendar_month_outlined,
                        onTap: () async {
                          final year = await _pickYear(context, yearCtrl.text);
                          if (year != null)
                            setState(() => yearCtrl.text = '$year');
                        },
                      ),
                      const SizedBox(height: 12),
                      _SimpleInput(
                        label: 'Placa',
                        hint: 'Ex: ABC1D23',
                        controller: plateCtrl,
                        icon: Icons.confirmation_number_outlined,
                        maxLen: 7,
                        toUpperCase: true,
                      ),
                    ],
                  ],
                ),
              ),
            ),
            if (type == ItemType.phone) ...[
              const SizedBox(height: 16),
              const _SectionTitle('IMEI'),
              _ImeiCard(
                controller: imeiCtrl,
                onScan: scanImeiFromCamera,
                onPaste: pasteImeiFromClipboard,
                onClear: () => setState(() => imeiCtrl.clear()),
              ),
            ],
            const SizedBox(height: 16),
            const _SectionTitle('Observação'),
            _ObservationCard(controller: notesCtrl),
            const SizedBox(height: 14),
            const _InfoCard(
              title: 'Verificação',
              text:
                  'Após o cadastro, seu item pode ficar como “Pendente” até ser verificado e liberado pela nossa equipe.',
            ),
          ],
          if (step == 2) ...[
            // const _SectionTitle('Enviar fotos'),
            const _SectionTitle('Fotos do item'),
            _Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2B5BEE).withOpacity(0.10),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.photo_library_outlined,
                            color: Color(0xFF2B5BEE),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Adicione fotos do item',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF1F2A44),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2B5BEE).withOpacity(0.10),
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Text(
                            '${photos.length}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF2B5BEE),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Item criado com ID: ${createdItemId ?? '-'}',
                      style: const TextStyle(
                        fontSize: 12.5,
                        color: Color(0xFF8A96C8),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 14),
                    _PhotoActionsRow(
                      onAddGallery: pickPhotosFromGallery,
                      onAddCamera: pickFromCamera,
                    ),
                    const SizedBox(height: 14),
                    _PhotosGridCard(
                      files: photos,
                      onAdd: pickPhotosFromGallery,
                      onAddCamera: pickFromCamera,
                      onRemove: removePhotoAt,
                      onOpen: openPhotoViewer,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Dica: fotos nítidas ajudam a agilizar a verificação.',
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Color(0xFF8A96C8),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 14),
            const _InfoHintCard(
              title: 'Observação',
              text:
                  'As fotos são enviadas após o cadastro do item. Se preferir, você pode concluir agora e enviar depois.',
            ),

            // _Card(
            //   child: Padding(
            //     padding: const EdgeInsets.all(16),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(
            //           children: [
            //             Container(
            //               width: 40,
            //               height: 40,
            //               decoration: BoxDecoration(
            //                 color: _primary.withOpacity(0.10),
            //                 borderRadius: BorderRadius.circular(12),
            //               ),
            //               child: const Icon(Icons.photo_library_outlined,
            //                   color: _primary),
            //             ),
            //             const SizedBox(width: 12),
            //             const Expanded(
            //               child: Text(
            //                 'Agora adicione fotos do item',
            //                 style: TextStyle(
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.w800,
            //                   color: _ink,
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //         const SizedBox(height: 10),
            //         Text(
            //           'Item criado com ID: ${createdItemId ?? '-'}',
            //           style: const TextStyle(
            //             fontSize: 12.5,
            //             color: _muted,
            //             fontWeight: FontWeight.w600,
            //           ),
            //         ),
            //         const SizedBox(height: 14),

            //         // 🔧 Aqui você encaixa a sua UI de fotos + upload
            //         Container(
            //           padding: const EdgeInsets.all(14),
            //           decoration: BoxDecoration(
            //             color: const Color(0xFFF5F7FD),
            //             borderRadius: BorderRadius.circular(18),
            //             border: Border.all(color: const Color(0xFFE6EAF6)),
            //           ),
            //           child: const Row(
            //             children: [
            //               Icon(Icons.cloud_upload_outlined, color: _primary),
            //               SizedBox(width: 10),
            //               Expanded(
            //                 child: Text(
            //                   'Upload de fotos (pós-cadastro)\nConecte aqui sua tela/grade de fotos.',
            //                   style: TextStyle(
            //                     color: _muted,
            //                     fontWeight: FontWeight.w600,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         const SizedBox(height: 10),
            //         const Text(
            //           'Dica: fotos nítidas ajudam a agilizar a verificação.',
            //           style: TextStyle(
            //             fontSize: 12.5,
            //             color: _muted,
            //             fontWeight: FontWeight.w600,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ],
      ),
    );
  }

  Future<String?> _pickFromList(
    BuildContext context, {
    required String title,
    required List<String> options,
  }) async {
    return showModalBottomSheet<String>(
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
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: _ink,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: options.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, i) {
                      final o = options[i];
                      return InkWell(
                        onTap: () => Navigator.pop(context, o),
                        borderRadius: BorderRadius.circular(18),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F7FD),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: const Color(0xFFE6EAF6)),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.checklist, color: _primary),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  o,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: _ink,
                                  ),
                                ),
                              ),
                              const Icon(Icons.chevron_right,
                                  color: Color(0xFF8A96C8)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<int?> _pickYear(BuildContext context, String initial) async {
    final now = DateTime.now().year;
    final min = 1950;
    final max = now + 1;

    int selected = int.tryParse(initial) ?? now;

    return showModalBottomSheet<int>(
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
                const Text(
                  'Selecionar ano',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: _ink,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 180,
                  child: YearPicker(
                    firstDate: DateTime(min),
                    lastDate: DateTime(max),
                    selectedDate: DateTime(selected),
                    onChanged: (d) => Navigator.pop(context, d.year),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/* ------------------- UI helpers ------------------- */

class _WizardHeader extends StatelessWidget {
  final int step;
  final String title;
  final String subtitle;

  const _WizardHeader({
    required this.step,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            //StepCard
            // Container(
            //   width: 46,
            //   height: 46,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(16),
            //     gradient: const LinearGradient(
            //       colors: [Color(0xFF2B5BEE), Color(0xFF5F85FF)],
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //     ),
            //   ),
            //   child: Center(
            //     child: Text(
            //       '${step + 1}',
            //       style: const TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.w900,
            //         fontSize: 18,
            //       ),
            //     ),
            //   ),
            // ),
            CardCounter(counter: (step + 1)),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1F2A44),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF8A96C8),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WizardBottomBar extends StatelessWidget {
  final int step;
  final bool loading;
  final VoidCallback? onNext;
  final String nextLabel;

  const _WizardBottomBar({
    required this.step,
    required this.loading,
    required this.onNext,
    required this.nextLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 54,
          child: ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2B5BEE),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: loading
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.4,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    nextLabel,
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
          ),
        ),
      ),
    );
  }
}

class _TypeSelector extends StatelessWidget {
  final ItemType? selected;
  final ValueChanged<ItemType> onSelect;

  const _TypeSelector({
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TypeCard(
          title: 'Carro',
          subtitle: 'Veículo de 4 rodas',
          icon: Icons.directions_car_filled_outlined,
          selected: selected == ItemType.car,
          onTap: () => onSelect(ItemType.car),
        ),
        const SizedBox(height: 10),
        _TypeCard(
          title: 'Moto',
          subtitle: 'Moto, elétrica ou similar',
          icon: Icons.two_wheeler_outlined,
          selected: selected == ItemType.moto,
          onTap: () => onSelect(ItemType.moto),
        ),
        const SizedBox(height: 10),
        _TypeCard(
          title: 'Celular',
          subtitle: 'Smartphone e aparelhos',
          icon: Icons.smartphone_outlined,
          selected: selected == ItemType.phone,
          onTap: () => onSelect(ItemType.phone),
        ),
      ],
    );
  }
}

class _TypeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _TypeCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final border = selected ? const Color(0xFF2B5BEE) : const Color(0xFFE6EAF6);
    final bg =
        selected ? const Color(0xFF2B5BEE).withOpacity(0.08) : Colors.white;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(16),
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
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: selected
                    ? const Color(0xFF2B5BEE).withOpacity(0.16)
                    : const Color(0xFFF5F7FD),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: selected
                    ? const Color(0xFF2B5BEE)
                    : const Color(0xFF1F2A44),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1F2A44),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF8A96C8),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              selected ? Icons.check_circle : Icons.circle_outlined,
              color:
                  selected ? const Color(0xFF2B5BEE) : const Color(0xFF8A96C8),
            ),
          ],
        ),
      ),
    );
  }
}

class _SimpleInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final IconData icon;
  final int? maxLen;
  final bool toUpperCase;

  const _SimpleInput({
    required this.label,
    required this.hint,
    required this.controller,
    required this.icon,
    this.maxLen,
    this.toUpperCase = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF1F2A44).withOpacity(0.08),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFF1F2A44), size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TextField(
            controller: controller,
            maxLength: maxLen,
            decoration: InputDecoration(
              counterText: '',
              labelText: label,
              hintText: hint,
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
              if (up != v) controller.text = up;
              controller.selection =
                  TextSelection.collapsed(offset: controller.text.length);
            },
          ),
        ),
      ],
    );
  }
}

class _PickerPlaceholder extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  const _PickerPlaceholder({
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final muted = value == 'Selecionar';

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF1F2A44).withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF1F2A44), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F7FD),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '$label: $value',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: muted
                            ? const Color(0xFF8A96C8)
                            : const Color(0xFF1F2A44),
                      ),
                    ),
                  ),
                  const Icon(Icons.expand_more, color: Color(0xFF8A96C8)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* Cards base */

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
  final String text;
  const _InfoCard({required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF2B5BEE).withOpacity(0.10),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.verified_user_outlined,
                  color: Color(0xFF2B5BEE), size: 20),
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
                    text,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.35,
                      color: Color(0xFF8A96C8),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SimpleTextField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String hint;
  final TextEditingController controller;
  final int? maxLen;
  final bool toUpperCase;

  const _SimpleTextField({
    required this.icon,
    required this.label,
    required this.hint,
    required this.controller,
    this.maxLen,
    this.toUpperCase = false,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    return Row(
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
        const SizedBox(width: 12),
        Expanded(
          child: TextField(
            controller: controller,
            maxLength: maxLen,
            decoration: InputDecoration(
              counterText: '',
              labelText: label,
              hintText: hint,
              labelStyle: const TextStyle(
                color: _muted,
                fontWeight: FontWeight.w800,
              ),
              filled: true,
              fillColor: const Color(0xFFF5F7FD),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            ),
            onChanged: (v) {
              if (!toUpperCase) return;
              final up = v.toUpperCase();
              if (up != v) {
                controller.text = up;
                controller.selection =
                    TextSelection.collapsed(offset: controller.text.length);
              }
            },
          ),
        ),
      ],
    );
  }
}

class _ObservationCard extends StatelessWidget {
  final TextEditingController controller;

  const _ObservationCard({required this.controller});

  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                _LeadingIcon(icon: Icons.notes_outlined),
                SizedBox(width: 12),
                Expanded(
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
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              maxLength: 300,
              maxLines: 7,
              decoration: InputDecoration(
                hintText: 'Digite detalhes que ajudem a identificar o item…',
                counterStyle: const TextStyle(color: _muted),
                filled: true,
                fillColor: const Color(0xFFF5F7FD),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BrandPickerField extends StatelessWidget {
  final TextEditingController controller;
  final List<String> options;
  final ValueChanged<String> onSelected;

  const _BrandPickerField({
    required this.controller,
    required this.options,
    required this.onSelected,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    final value =
        controller.text.isEmpty ? 'Selecionar marca' : controller.text;

    return InkWell(
      onTap: () async {
        final picked = await showModalBottomSheet<String>(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (_) => _BrandBottomSheet(
            current: controller.text,
            options: (options.toSet().toList()..sort()),
          ),
        );
        if (picked != null) onSelected(picked);
      },
      borderRadius: BorderRadius.circular(18),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _ink.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.branding_watermark_outlined,
                color: _ink, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F7FD),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Marca: $value',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: controller.text.isEmpty ? _muted : _ink,
                      ),
                    ),
                  ),
                  const Icon(Icons.expand_more, color: Color(0xFF8A96C8)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BrandBottomSheet extends StatefulWidget {
  final String current;
  final List<String> options;

  const _BrandBottomSheet({
    required this.current,
    required this.options,
  });

  @override
  State<_BrandBottomSheet> createState() => _BrandBottomSheetState();
}

class _BrandBottomSheetState extends State<_BrandBottomSheet> {
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);

  final _searchCtrl = TextEditingController();
  String query = '';

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    final filtered = widget.options.where((b) {
      if (query.trim().isEmpty) return true;
      return b.toLowerCase().contains(query.toLowerCase());
    }).toList();

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
                  const Expanded(
                    child: Text(
                      'Selecionar marca',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: _ink,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Fechar',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _searchCtrl,
                onChanged: (v) => setState(() => query = v),
                decoration: InputDecoration(
                  hintText: 'Buscar marca...',
                  prefixIcon: const Icon(Icons.search, color: _muted),
                  filled: true,
                  fillColor: const Color(0xFFF5F7FD),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                ),
              ),
              const SizedBox(height: 12),
              Flexible(
                child: filtered.isEmpty
                    ? Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F7FD),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: const Color(0xFFE6EAF6)),
                        ),
                        child: const Text(
                          'Nenhuma marca encontrada.',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: _muted,
                          ),
                        ),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        itemCount: filtered.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (_, i) {
                          final brand = filtered[i];
                          final selected = brand.toLowerCase() ==
                              widget.current.toLowerCase();

                          return InkWell(
                            onTap: () => Navigator.pop(context, brand),
                            borderRadius: BorderRadius.circular(18),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              decoration: BoxDecoration(
                                color: selected
                                    ? _primary.withOpacity(0.10)
                                    : const Color(0xFFF5F7FD),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: selected
                                      ? _primary.withOpacity(0.35)
                                      : const Color(0xFFE6EAF6),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: _primary.withOpacity(0.10),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: _primary.withOpacity(0.18)),
                                    ),
                                    child: const Icon(
                                      Icons.directions_car_filled_outlined,
                                      color: _primary,
                                      size: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      brand,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        color: _ink,
                                      ),
                                    ),
                                  ),
                                  if (selected)
                                    const Icon(Icons.check,
                                        color: _primary, size: 18)
                                  else
                                    const Icon(Icons.chevron_right,
                                        color: Color(0xFF8A96C8)),
                                ],
                              ),
                            ),
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

class ColorOption {
  final String name;
  final Color color;
  final Color? border;

  const ColorOption(this.name, this.color, {this.border});
}

class _ColorPickerField extends StatelessWidget {
  final TextEditingController controller;
  final List<ColorOption> options;
  final ValueChanged<ColorOption> onSelected;

  const _ColorPickerField({
    required this.controller,
    required this.options,
    required this.onSelected,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    final value = controller.text.isEmpty ? 'Selecionar cor' : controller.text;

    return InkWell(
      onTap: () async {
        final picked = await showModalBottomSheet<ColorOption>(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (_) => _ColorBottomSheet(
            current: controller.text,
            options: options,
          ),
        );
        if (picked != null) onSelected(picked);
      },
      borderRadius: BorderRadius.circular(18),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _ink.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.color_lens_outlined, color: _ink, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F7FD),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  _ColorDot(
                    option: options.firstWhere(
                      (o) =>
                          o.name.toLowerCase() == controller.text.toLowerCase(),
                      orElse: () => const ColorOption('—', Color(0xFFE6EAF6)),
                    ),
                    size: 14,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Cor: $value',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: controller.text.isEmpty ? _muted : _ink,
                      ),
                    ),
                  ),
                  const Icon(Icons.expand_more, color: Color(0xFF8A96C8)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ColorBottomSheet extends StatelessWidget {
  final String current;
  final List<ColorOption> options;

  const _ColorBottomSheet({
    required this.current,
    required this.options,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _primary = Color(0xFF2B5BEE);

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
                const Expanded(
                  child: Text(
                    'Selecionar cor',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: _ink,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: options.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, i) {
                  final opt = options[i];
                  final selected =
                      opt.name.toLowerCase() == current.toLowerCase();

                  return InkWell(
                    onTap: () => Navigator.pop(context, opt),
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: selected
                            ? opt.color.withOpacity(0.10)
                            : const Color(0xFFF5F7FD),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: selected
                              ? opt.color.withOpacity(0.35)
                              : const Color(0xFFE6EAF6),
                        ),
                      ),
                      child: Row(
                        children: [
                          _ColorDot(option: opt, size: 18),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              opt.name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: _ink,
                              ),
                            ),
                          ),
                          if (selected)
                            Icon(Icons.check, color: opt.color, size: 18)
                          else
                            const Icon(Icons.chevron_right,
                                color: Color(0xFF8A96C8)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorDot extends StatelessWidget {
  final ColorOption option;
  final double size;

  const _ColorDot({required this.option, this.size = 16});

  @override
  Widget build(BuildContext context) {
    final border = option.border ?? option.color.withOpacity(0.25);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: option.color,
        shape: BoxShape.circle,
        border: Border.all(color: border, width: 1),
      ),
    );
  }
}

class _YearPickerField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<int> onChanged;

  const _YearPickerField({
    required this.controller,
    required this.onChanged,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  @override
  Widget build(BuildContext context) {
    final value = controller.text.isEmpty ? 'Selecionar ano' : controller.text;

    return InkWell(
      onTap: () async {
        final picked = await _showYearPicker(context, controller.text);
        if (picked != null) onChanged(picked);
      },
      borderRadius: BorderRadius.circular(18),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _ink.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.calendar_month_outlined,
                color: _ink, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F7FD),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Ano: $value',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: controller.text.isEmpty ? _muted : _ink,
                      ),
                    ),
                  ),
                  const Icon(Icons.expand_more, color: Color(0xFF8A96C8)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<int?> _showYearPicker(BuildContext context, String initial) {
    final now = DateTime.now().year;
    final min = 1950;
    final max = now + 1;

    int selected = int.tryParse(initial) ?? now;
    if (selected < min) selected = min;
    if (selected > max) selected = max;

    return showModalBottomSheet<int>(
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
                const Text(
                  'Selecionar ano',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: _ink,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 180,
                  child: YearPicker(
                    firstDate: DateTime(min),
                    lastDate: DateTime(max),
                    selectedDate: DateTime(selected),
                    onChanged: (d) => Navigator.pop(context, d.year),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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

class _InfoHintCard extends StatelessWidget {
  final String title;
  final String text;

  const _InfoHintCard({
    required this.title,
    required this.text,
  });

  static const _primary = Color(0xFF2B5BEE);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF6B7AAE);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _primary.withOpacity(0.08), // ✅ “cara de informação”
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
            child: const Icon(
              Icons.info_outline,
              color: _primary,
              size: 20,
            ),
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

class _PhotoActionsRow extends StatelessWidget {
  final VoidCallback onAddGallery;
  final VoidCallback onAddCamera;

  const _PhotoActionsRow({
    required this.onAddGallery,
    required this.onAddCamera,
  });

  static const _primary = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onAddGallery,
            icon: const Icon(Icons.photo_library_outlined),
            label: const Text(
              'Galeria',
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
            onPressed: onAddCamera,
            icon: const Icon(Icons.photo_camera_outlined),
            label: const Text(
              'Câmera',
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
    );
  }
}

class _PhotosGridCard extends StatelessWidget {
  final List<XFile> files;
  final VoidCallback onAdd;
  final VoidCallback onAddCamera;
  final void Function(int index) onRemove;
  final void Function(int index) onOpen;

  const _PhotosGridCard({
    required this.files,
    required this.onAdd,
    required this.onAddCamera,
    required this.onRemove,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    final tile = _tileSize(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FD),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE6EAF6)),
      ),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          _AddPhotoTile(
            size: tile,
            onTapGallery: onAdd,
            onTapCamera: onAddCamera,
          ),
          ...List.generate(files.length, (i) {
            return _PhotoTile(
              size: tile,
              file: files[i],
              onRemove: () => onRemove(i),
              onOpen: () => onOpen(i),
            );
          }),
        ],
      ),
    );
  }

  double _tileSize(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final usable = w - 32; // padding do ListView
    return (usable - 10 * 2 - 24) /
        3; // 3 colunas + espaçamentos + padding do card
  }
}

class _AddPhotoTile extends StatelessWidget {
  final double size;
  final VoidCallback onTapGallery;
  final VoidCallback onTapCamera;

  const _AddPhotoTile({
    required this.size,
    required this.onTapGallery,
    required this.onTapCamera,
  });

  static const _primary = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () async {
          await showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (_) => Container(
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
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Adicionar foto',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF1F2A44),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _SheetAction(
                      icon: Icons.photo_library_outlined,
                      title: 'Galeria',
                      onTap: () {
                        Navigator.pop(context);
                        onTapGallery();
                      },
                    ),
                    _SheetAction(
                      icon: Icons.photo_camera_outlined,
                      title: 'Câmera',
                      onTap: () {
                        Navigator.pop(context);
                        onTapCamera();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE6EAF6)),
          ),
          child: const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add_photo_alternate_outlined,
                    color: _primary, size: 26),
                SizedBox(height: 8),
                Text(
                  'Adicionar',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w900,
                    color: _primary,
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

class _PhotoTile extends StatelessWidget {
  final double size;
  final XFile file;
  final VoidCallback onRemove;
  final VoidCallback onOpen;

  const _PhotoTile({
    required this.size,
    required this.file,
    required this.onRemove,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            Positioned.fill(
              child: Material(
                color: const Color(0xFFF5F7FD),
                child: InkWell(
                  onTap: onOpen,
                  child: Image.file(
                    File(file.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: InkWell(
                onTap: onRemove,
                borderRadius: BorderRadius.circular(99),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.45),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: const Icon(Icons.close, color: Colors.white, size: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocalPhotoViewerDialog extends StatefulWidget {
  final List<XFile> files;
  final int initialIndex;

  const _LocalPhotoViewerDialog({
    required this.files,
    required this.initialIndex,
  });

  @override
  State<_LocalPhotoViewerDialog> createState() =>
      _LocalPhotoViewerDialogState();
}

class _LocalPhotoViewerDialogState extends State<_LocalPhotoViewerDialog> {
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
            itemCount: widget.files.length,
            onPageChanged: (i) => setState(() => index = i),
            itemBuilder: (_, i) {
              return InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: Center(
                  child: Image.file(
                    File(widget.files[i].path),
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
                    '${index + 1}/${widget.files.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
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

class _SheetAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _SheetAction({
    required this.icon,
    required this.title,
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
            color: const Color(0xFFF5F7FD),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE6EAF6)),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFF2B5BEE).withOpacity(0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: const Color(0xFF2B5BEE), size: 18),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1F2A44),
                  ),
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

class _ImeiField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onScan;
  final VoidCallback onPaste;

  const _ImeiField({
    required this.controller,
    required this.onScan,
    required this.onPaste,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _ink.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.dialpad_outlined, color: _ink, size: 20),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'IMEI (opcional)',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: _muted,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: _primary.withOpacity(0.10),
                borderRadius: BorderRadius.circular(99),
              ),
              child: const Text(
                '15 dígitos',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: _primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(15),
          ],
          decoration: InputDecoration(
            hintText: 'Digite o IMEI',
            filled: true,
            fillColor: const Color(0xFFF5F7FD),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onScan,
                icon: const Icon(Icons.qr_code_scanner_outlined),
                label: const Text(
                  'Ler automaticamente',
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
              child: OutlinedButton.icon(
                onPressed: onPaste,
                icon: const Icon(Icons.content_paste_outlined),
                label: const Text(
                  'Colar',
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
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Dica: você pode obter o IMEI em *#06* ou na caixa do aparelho.',
          style: TextStyle(
            fontSize: 12.5,
            color: _muted,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _ImeiScannerPage extends StatelessWidget {
  const _ImeiScannerPage();

  static const _bg = Color(0xFFF5F7FD);
  static const _ink = Color(0xFF1F2A44);
  static const _primary = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: _ink),
        title: const Text(
          'Ler IMEI',
          style: TextStyle(color: _ink, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                MobileScanner(
                  onDetect: (capture) {
                    final barcodes = capture.barcodes;
                    if (barcodes.isEmpty) return;
                    final raw = barcodes.first.rawValue;
                    if (raw == null || raw.trim().isEmpty) return;
                    Navigator.pop(context, raw);
                  },
                ),

                // Overlay simples
                Center(
                  child: Container(
                    width: 260,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: _primary.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:
                      const Icon(Icons.info_outline, color: _primary, size: 20),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Aponte a câmera para o código de barras na caixa/etiqueta do aparelho.',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.3,
                      color: Color(0xFF6B7AAE),
                      fontWeight: FontWeight.w600,
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

class ImeiScannerPage extends StatelessWidget {
  const ImeiScannerPage({super.key});

  static const _primary = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Ler IMEI',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: Stack(
        children: [
          /// 📷 CÂMERA (preview real)
          MobileScanner(
            fit: BoxFit.cover,
            onDetect: (capture) {
              final barcodes = capture.barcodes;
              if (barcodes.isEmpty) return;

              final raw = barcodes.first.rawValue;
              if (raw == null || raw.trim().isEmpty) return;

              Navigator.pop(context, raw);
            },
          ),

          /// 🔲 OVERLAY ESCURO COM RECORTE CENTRAL
          _ScannerOverlay(),

          /// ℹ️ INSTRUÇÕES
          Positioned(
            bottom: 24,
            left: 20,
            right: 20,
            child: _ScannerHint(),
          ),
        ],
      ),
    );
  }
}

class _ScannerOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          final scanWidth = width * 0.78;
          final scanHeight = scanWidth * 0.55;

          final left = (width - scanWidth) / 2;
          final top = (height - scanHeight) / 2;

          return Stack(
            children: [
              // Top
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: top,
                child: _OverlayBlock(),
              ),
              // Bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: top,
                child: _OverlayBlock(),
              ),
              // Left
              Positioned(
                top: top,
                left: 0,
                width: left,
                height: scanHeight,
                child: _OverlayBlock(),
              ),
              // Right
              Positioned(
                top: top,
                right: 0,
                width: left,
                height: scanHeight,
                child: _OverlayBlock(),
              ),

              // Moldura
              Positioned(
                top: top,
                left: left,
                child: Container(
                  width: scanWidth,
                  height: scanHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _OverlayBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.65),
    );
  }
}

class _ScannerHint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.55),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Row(
        children: [
          Icon(Icons.info_outline, color: Colors.white, size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Aponte a câmera para o código de barras do IMEI na caixa ou etiqueta do aparelho.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.5,
                height: 1.3,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImeiCard extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onScan;
  final VoidCallback onPaste;
  final VoidCallback onClear;

  const _ImeiCard({
    required this.controller,
    required this.onScan,
    required this.onPaste,
    required this.onClear,
  });

  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);
  static const _primary = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: _primary.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: _primary.withOpacity(0.18)),
                  ),
                  child: const Icon(
                    Icons.qr_code_scanner_outlined,
                    color: _primary,
                    size: 20,
                  ),
                ),
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
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: _primary.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: const Text(
                    'Opcional',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: _primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(15),
              ],
              decoration: InputDecoration(
                labelText: 'IMEI (15 dígitos)',
                labelStyle: const TextStyle(
                  color: _muted,
                  fontWeight: FontWeight.w800,
                ),
                hintText: 'Digite ou leia automaticamente',
                filled: true,
                fillColor: const Color(0xFFF5F7FD),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: controller.text.isEmpty
                    ? null
                    : IconButton(
                        onPressed: onClear,
                        icon: const Icon(Icons.close),
                        color: const Color(0xFF8A96C8),
                      ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onScan,
                    icon: const Icon(Icons.qr_code_scanner_outlined),
                    label: const Text(
                      'Ler automaticamente',
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
                  child: OutlinedButton.icon(
                    onPressed: onPaste,
                    icon: const Icon(Icons.content_paste_outlined),
                    label: const Text(
                      'Colar',
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
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: _primary.withOpacity(0.18)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: _primary, size: 18),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Você pode encontrar o IMEI em *#06* ou na caixa do aparelho.',
                      style: TextStyle(
                        fontSize: 12.5,
                        height: 1.3,
                        color: Color(0xFF6B7AAE),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
