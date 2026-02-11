import 'package:deehelp/core/theme/size/layout_spacing_size.dart';
import 'package:deehelp/core/theme/size/spacing_size.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/feature/items/register/item_data.dart';
import 'package:deehelp/feature/items/register/widgets/card_page.dart';
import 'package:deehelp/feature/items/register/widgets/brand-picker/brand_picker_field.dart';
import 'package:deehelp/feature/items/register/widgets/color-picker/color_option.dart';
import 'package:deehelp/feature/items/register/widgets/color-picker/color_picker_field.dart';
import 'package:deehelp/feature/items/register/widgets/imei/ime_card.dart';
import 'package:deehelp/feature/items/register/widgets/section_title.dart';
import 'package:deehelp/feature/items/register/widgets/simple_text_field.dart';
import 'package:deehelp/feature/items/register/widgets/wizard_step.dart';
import 'package:deehelp/feature/items/register/widgets/year-picker/year_picker_field.dart';
import 'package:deehelp/feature/items/register/widgets/year-picker/year_bottom_sheet.dart';
import 'package:deehelp/old_core/utils/url_launcher_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemRegisterInfomation extends StatefulWidget {
  final VoidCallback press;
  const ItemRegisterInfomation({super.key, required this.press});

  @override
  State<ItemRegisterInfomation> createState() => _ItemRegisterInfomationState();
}

class _ItemRegisterInfomationState extends State<ItemRegisterInfomation> {
  final ItemType type = ItemType.phone;

  bool get isVehicle => type == ItemType.car || type == ItemType.moto;

  final nameCtrl = TextEditingController();
  final brandCtrl = TextEditingController();
  final colorCtrl = TextEditingController();
  final yearCtrl = TextEditingController();
  final plateCtrl = TextEditingController();
  final notesCtrl = TextEditingController();
  final imeiCtrl = TextEditingController();

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

  Future<int?> _pickYear(BuildContext context, String initial) async {
    final now = DateTime.now().year;
    int selected = int.tryParse(initial) ?? now;
    return showModalBottomSheet<int>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return YearBottomSheet(
          selectedYear: selected,
          min: 1950,
        );
      },
    );
  }

  Future<void> pasteImeiFromClipboard() async {
    final data = await Clipboard.getData('text/plain');
    final raw = (data?.text ?? '').trim();
    final digits = raw.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) {
      _toast('Nenhum IMEI encontrado no clipboard.');
      return;
    }

    imeiCtrl.text = digits.length > 15 ? digits.substring(0, 15) : digits;
  }

  void _toast(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 110),
      children: [
        const WizardHeader(
          step: 1,
          title: "Informações",
          subtitle: 'Preencha os dados para criar o item',
        ),
        const SizedBox(height: SpacingSize.xl),
        const SectionTitle('Dados do item'),
        PageCard(
          child: Padding(
            padding: const EdgeInsets.all(LayoutSpacingSize.container),
            child: Column(
              children: [
                SimpleTextField(
                  icon: Icons.badge_outlined,
                  label: type == ItemType.phone ? 'Modelo/Nome' : 'Nome',
                  hint: type == ItemType.phone
                      ? 'Ex: iPhone 13'
                      : 'Ex: CG Titan 150',
                  controller: TextEditingController(),
                ),
                const SizedBox(height: SpacingSize.md),
                BrandPickerField(
                  controller: brandCtrl,
                  options: getItemTypes(type),
                  onSelected: (v) {
                    setState(() => brandCtrl.text = v);
                  },
                ),
                const SizedBox(height: SpacingSize.md),
                ColorPickerField(
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
                  const SizedBox(height: SpacingSize.md),
                  YearPickerField(
                    label: 'Ano',
                    value: yearCtrl.text.isEmpty ? 'Selecionar' : yearCtrl.text,
                    icon: Icons.calendar_month_outlined,
                    onTap: () async {
                      final year = await _pickYear(context, yearCtrl.text);
                      if (year != null) setState(() => yearCtrl.text = '$year');
                    },
                  ),
                  const SizedBox(height: SpacingSize.md),
                  SimpleTextField(
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
          const SizedBox(height: SpacingSize.xl),
          const SectionTitle('IMEI'),
          ImeiCard(
            controller: imeiCtrl,
            onScan: () => UrlLauncherUtils.makePhoneCall(''),
            onPaste: () => pasteImeiFromClipboard(),
            onClear: () => setState(() => imeiCtrl.clear()),
          ),
        ],
        const SizedBox(height: SpacingSize.xl),
        const SectionTitle('Observação'),
      ],
    );
  }
}
