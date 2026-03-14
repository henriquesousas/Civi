import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/core/ui/widgets/cards/card_exports.dart';
import 'package:deehelp/core/ui/widgets/cards/card_hint.dart';
import 'package:deehelp/feature/items/item_type.dart';
import 'package:deehelp/feature/items/register/item_data.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/card_page.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/brand-picker/brand_picker_field.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/color-picker/color_option.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/color-picker/color_picker_field.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/imei/ime_card.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/observation_card_field.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/section_title.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/simple_text_field.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/wizard_step.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/year-picker/year_picker_field.dart';
import 'package:deehelp/feature/items/register/presentation/widgets/year-picker/year_bottom_sheet.dart';
import 'package:deehelp/feature/items/register/viewmodel/register_item_viewmodel.dart';
import 'package:deehelp/module/item/di/item_viewmodel_provider.dart';
import 'package:deehelp/core/utils/url_launcher_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemRegisterInfomation extends ConsumerStatefulWidget {
  const ItemRegisterInfomation({super.key});

  @override
  ConsumerState<ItemRegisterInfomation> createState() =>
      _ItemRegisterInfomationState();
}

class _ItemRegisterInfomationState
    extends ConsumerState<ItemRegisterInfomation> {
  final yearCtrl = TextEditingController();
  final imeiCtrl = TextEditingController();

  @override
  void dispose() {
    yearCtrl.dispose();
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
        return YearBottomSheetV2(
          selectedYear: selected,
          min: 1950,
        );
      },
    );
  }

  Future<void> pasteImeiFromClipboard(RegisterItemViewmodel viewModel) async {
    final data = await Clipboard.getData('text/plain');
    final raw = (data?.text ?? '').trim();
    final digits = raw.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) {
      _toast('Nenhum IMEI encontrado no clipboard.');
      return;
    }

    final digit = digits.length > 15 ? digits.substring(0, 15) : digits;
    viewModel.onImeiChange(digit);
    imeiCtrl.text = digits.length > 15 ? digits.substring(0, 15) : digits;
  }

  void _toast(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerItemViewModelProvider);
    final viewModel = ref.watch(registerItemViewModelProvider.notifier);

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
                  icon: CupertinoIcons.cube_box,
                  label: state.type == ItemType.phone ? 'Modelo/Nome' : 'Nome',
                  hint: state.type == ItemType.phone
                      ? 'Ex: iPhone 13'
                      : 'Ex: CG Titan 150',
                  error: state.errorModel,
                  onChanged: (value) => viewModel.onModelChange(value),
                ),
                const SizedBox(height: SpacingSize.md),
                BrandPickerField(
                  value: state.brand ?? "Selecionar marca",
                  options: getData(state.type),
                  onSelected: (brand) => viewModel.onBrandChange(brand),
                ),
                const SizedBox(height: SpacingSize.md),
                ColorPickerField(
                  value: state.color ?? "Selecionar cor",
                  options: const [
                    ColorOption('Preto', Color(0xFF000000)),
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
                  onSelected: (opt) {
                    viewModel.onColorChange(opt.name);
                  },
                ),
                if (state.type != ItemType.phone) ...[
                  const SizedBox(height: SpacingSize.md),
                  YearPickerField(
                    label: 'Ano',
                    value: state.year == null
                        ? 'Selecionar ano'
                        : state.year.toString(),
                    icon: CupertinoIcons.calendar,
                    onTap: () async {
                      final year = await _pickYear(context, yearCtrl.text);
                      if (year != null) {
                        viewModel.onYearChange('$year');
                      }
                    },
                  ),
                  const SizedBox(height: SpacingSize.md),
                  SimpleTextField(
                    label: 'Placa',
                    hint: 'Ex: ABC1D23',
                    icon: CupertinoIcons.number,
                    maxLen: 7,
                    toUpperCase: true,
                    error: state.errorLicencePlate,
                    onChanged: (value) => viewModel.onLicencePlateChange(value),
                  ),
                ],
              ],
            ),
          ),
        ),
        if (state.type == ItemType.phone) ...[
          const SizedBox(height: SpacingSize.xl),
          const SectionTitle('IMEI'),
          ImeiCard(
            controller: imeiCtrl,
            error: state.errorLicencePlate,
            onChanged: (value) => viewModel.onImeiChange(value),
            onScan: () => UrlLauncherUtils.makePhoneCall(''),
            onPaste: () => pasteImeiFromClipboard(viewModel),
            onClear: () => setState(() => imeiCtrl.clear()),
          ),
        ],
        const SizedBox(height: SpacingSize.xl),
        const SectionTitle('Observação'),
        ObservationCardField(
          onChanged: (v) => viewModel.onObsChange(v),
        ),
        // const SizedBox(height: SpacingSize.xl),
        // CardHint(
        //   backgroundColor: AppColors.green.withValues(alpha: 0.09),
        //   iconBackgroundColor: AppColors.green.withValues(alpha: 0.12),
        //   textStyle: context.appText.bodySmall.copyWith(
        //     height: 1.35,
        //     color: context.primaryColor,
        //     fontWeight: FontWeight.w400,
        //   ),
        //   border: Border.all(
        //     color: AppColors.green,
        //     width: 1,
        //   ),
        //   icon: Icon(
        //     Icons.verified_user_outlined,
        //     color: AppColors.green,
        //     size: IconSizes.sm,
        //   ),
        //   title: "Verificação",
        //   message:
        //       'Após o cadastro, seu item pode ficar como “Pendente” até ser verificado e liberado pela nossa equipe.',
        // ),
      ],
    );
  }
}
