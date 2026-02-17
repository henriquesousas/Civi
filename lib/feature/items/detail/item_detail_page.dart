import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/badge/export_badge.dart';
import 'package:deehelp/core/ui/widgets/image/export_image.dart';
import 'package:deehelp/feature/items/detail/widgets/danger_zone.dart';
import 'package:deehelp/feature/items/detail/widgets/editable_field_tile.dart';
import 'package:deehelp/feature/items/detail/widgets/header_card.dart';
import 'package:deehelp/feature/items/detail/widgets/photos_gallery_card.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/section_title.dart';
import 'package:deehelp/feature/items/soft_divider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemDetailPage extends StatefulWidget {
  const ItemDetailPage({super.key});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  int selectedPhoto = 0;
  final _pageCtrl = PageController();

  String name = 'CG Titan 150';
  String brand = 'Honda';
  String color = 'Vermelha';
  String year = '2020';
  String plate = 'ABC1D23';
  String notes =
      'Placa final 7. Adesivo no paralama traseiro. Pequeno risco no tanque.';

  ItemStatus status = ItemStatus.active;

  final List<ImageProvider> photos = const [
    NetworkImage(
        'https://images.usadosbr.com/manipulatedImages/media/gallery/08/7e/24/citroen-c3-1-5-tendance-2014-ribeirao-preto-sp-e6b4cb57-w4--0-image-760x570-crop.webp'),
    NetworkImage(
        'https://s3-sa-east-1.amazonaws.com/revresources/araujo-automoveis/imagens_veiculos/640_480_folhacar_citroen-c3-tendance-1-5-8v-flex-13-14-b76032-38.jpg'),
    NetworkImage(
        'https://images.usadosbr.com/manipulatedImages/media/gallery/c6/94/8e/citroen-c3-1-5-tendance-2015-sao-paulo-sp-51331c5a-rB--1-image-760x570-crop.webp'),
  ];

  Future<void> _openPhotoViewer(
    BuildContext context,
    List<ImageProvider> photos,
    int initialIndex,
  ) async {
    await showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.92),
      builder: (_) => ImageViewDialog(
        photos: photos,
        initialIndex: initialIndex,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: "Detalhes do item",
        press: () => context.pop(),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          PhotosGalleryCard(
            photos: photos,
            selectedIndex: selectedPhoto,
            onIndexChanged: (i) {
              if (!mounted) return;
              if (i == selectedPhoto) return;

              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!mounted) return;
                setState(() => selectedPhoto = i);
              });
            },
            controller: _pageCtrl,
            onOpenZoom: (i) => _openPhotoViewer(context, photos, i),
          ),
          const SizedBox(height: SpacingSize.lg),
          HeaderCard(
            title: name,
            subtitle: 'Toque nos campos para editar',
            status: status,
          ),
          const SizedBox(height: SpacingSize.lg),
          const SectionTitle('Informações do item'),
          PageCard(
            child: Column(
              children: [
                EditableFieldTile(
                  icon: Icons.badge_outlined,
                  label: 'Nome',
                  value: name,
                  onEdit: () {},
                  // onEdit: () => _editText(
                  //   context,
                  //   title: 'Editar nome',
                  //   hint: 'Ex: CG Titan 150',
                  //   initialValue: name,
                  //   maxLen: 60,
                  //   onSave: (v) => setState(() => name = v),
                  // ),
                ),
                const SoftDivider(),
                EditableFieldTile(
                  icon: Icons.branding_watermark_outlined,
                  label: 'Marca',
                  value: brand, onEdit: () {},
                  // onEdit: () => _editText(
                  //   context,
                  //   title: 'Editar marca',
                  //   hint: 'Ex: Honda',
                  //   initialValue: brand,
                  //   maxLen: 40,
                  //   onSave: (v) => setState(() => brand = v),
                  // ),
                ),
                const SoftDivider(),
                EditableFieldTile(
                  icon: Icons.color_lens_outlined,
                  label: 'Cor',
                  value: color,
                  onEdit: () {},
                  // onEdit: () => _editText(
                  //   context,
                  //   title: 'Editar cor',
                  //   hint: 'Ex: Vermelha',
                  //   initialValue: color,
                  //   maxLen: 30,
                  //   onSave: (v) => setState(() => color = v),
                  // ),
                ),
                const SoftDivider(),
                EditableFieldTile(
                  icon: Icons.calendar_month_outlined,
                  label: 'Ano',
                  value: year, onEdit: () {},
                  // onEdit: () => _editText(
                  //   context,
                  //   title: 'Editar ano',
                  //   hint: 'Ex: 2020',
                  //   initialValue: year,
                  //   maxLen: 4,
                  //   keyboardType: TextInputType.number,
                  //   inputFormatters: [
                  //     FilteringTextInputFormatter.digitsOnly,
                  //     LengthLimitingTextInputFormatter(4),
                  //   ],
                  //   onSave: (v) => setState(() => year = v),
                  // ),
                ),
                const SoftDivider(),
                EditableFieldTile(
                  icon: Icons.confirmation_number_outlined,
                  label: 'Placa',
                  value: plate,
                  onEdit: () {},
                  // onEdit: () => _editText(
                  //   context,
                  //   title: 'Editar placa',
                  //   hint: 'Ex: ABC1D23',
                  //   initialValue: plate,
                  //   maxLen: 7,
                  //   toUpperCase: true,
                  //   onSave: (v) => setState(() => plate = v.toUpperCase()),
                  // ),
                ),
              ],
            ),
          ),
          const SizedBox(height: SpacingSize.lg),
          const SectionTitle('Observação'),
          PageCard(
            child: EditableFieldTile(
              icon: Icons.notes_outlined,
              label: 'Descrição (até 300 caracteres)',
              value: notes,
              minHeight: 150,
              maxLines: 10,
              onEdit: () {}, // 👈 mostra mais conteúdo antes do "..."
              // onEdit: () => _editText(
              //   context,
              //   title: 'Editar observação',
              //   hint: 'Digite detalhes que ajudem a identificar o item…',
              //   initialValue: notes,
              //   maxLen: 300,
              //   maxLines: 7,
              //   onSave: (v) => setState(() => notes = v),
              // ),
            ),
          ),
          const SizedBox(height: SpacingSize.lg),
          DangerZone(
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
}
