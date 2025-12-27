import 'package:deehelp/core/ui/widgets/bottom_sheet/utils_modal.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/core/ui/widgets/textfield/ui_text_field_rounded.dart';
import 'package:deehelp/features/products/external/repository/data.dart';
import 'package:deehelp/features/products/presentation/widgets/modal_select_brand.dart';
import 'package:deehelp/features/products/presentation/widgets/modal_select_color.dart';
import 'package:deehelp/features/products/presentation/providers/product_viewmodel_provider.dart';
import 'package:deehelp/features/products/presentation/views/add/widget/header_text_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepAddProductInfoDetail extends ConsumerStatefulWidget {
  const StepAddProductInfoDetail({super.key});

  @override
  ConsumerState<StepAddProductInfoDetail> createState() =>
      _StepAddProductInfoDetailState();
}

class _StepAddProductInfoDetailState
    extends ConsumerState<StepAddProductInfoDetail> with ModalUtils {
  final TextEditingController _licensePlateController =
      TextEditingController(text: '');

  final TextEditingController _brandController =
      TextEditingController(text: '');

  final TextEditingController _yearController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    _bindController();
  }

  void _showModalSelectBrand() {
    handleModal<String>(
      context: context,
      builder: (onComplete) => ModalSelectBrand(
        values: kBrands,
        onChange: (brand) => onComplete(brand),
      ),
      onComplete: (result) =>
          ref.watch(addProductViewModelProvider.notifier).onBrandChange(result),
    );
  }

  void _showModalSelectColor() {
    handleModal<String>(
      context: context,
      builder: (onComplete) => ModalSelectColor(
        onChange: (color) => onComplete(color),
      ),
      onComplete: (result) =>
          ref.watch(addProductViewModelProvider.notifier).onColorChange(result),
    );
  }

  void _bindController() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = ref.read(addProductViewModelProvider);
      _licensePlateController.text = state.licencePlate ?? '';
      _brandController.text = state.brand ?? '';
      _yearController.text = state.year != null ? state.year.toString() : "";
    });
  }

  @override
  void dispose() {
    _licensePlateController.dispose();
    _brandController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addProductViewModelProvider);
    final viewModel = ref.watch(addProductViewModelProvider.notifier);

    return UICustomAppCard(
      child: Column(
        children: [
          const HeaderTextCard(
            header: "Detalhes do veículo",
            text:
                "Preencha as informações importantes do seu veículo, como modelo, cor, placa.",
          ),
          const SizedBox(height: 10),
          UITextFieldRounded(
            isRequired: true,
            showLabelText: false,
            labelText: "Modelo",
            hintText: "Ex: Honda Civic",
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            onChanged: (value) => viewModel.onModelChange(value),
            error: state.errorModel,
            controller: _brandController,
          ),
          const SizedBox(height: 10),
          UITextFieldRounded(
            isRequired: true,
            showLabelText: false,
            labelText: "Placa",
            hintText: "Placa",
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            onChanged: (value) => viewModel.onLicencePlateChange(value),
            error: state.errorLicencePlate,
            controller: _licensePlateController,
          ),
          const SizedBox(height: 10),
          UITextFieldRounded(
            isRequired: true,
            showLabelText: false,
            labelText: "Ano do veículo",
            hintText: "Ano do veículo",
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            onChanged: (value) => viewModel.onYearChange(value),
            error: state.errorYear,
            controller: _yearController,
          ),
          const SizedBox(height: 10),
          UITextFieldRounded(
            isRequired: true,
            showLabelText: false,
            labelText: "Marca",
            hintText: "Marca",
            readOnly: true,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            onTap: () => _showModalSelectBrand(),
            controller: TextEditingController(
              text: state.brand,
            ),
          ),
          const SizedBox(height: 10),
          UITextFieldRounded(
            isRequired: true,
            showLabelText: false,
            labelText: "Cor",
            hintText: "Cor",
            readOnly: true,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            onTap: () => _showModalSelectColor(),
            controller: TextEditingController(text: state.color),
          ),
        ],
      ),
    );
  }
}
