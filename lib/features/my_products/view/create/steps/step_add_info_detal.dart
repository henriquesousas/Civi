import 'dart:async';

import 'package:deehelp/features/my_products/view/create/create_product_cubit.dart';
import 'package:deehelp/features/my_products/view/create/state/create_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/ui/bottom_sheet/custom_modal_bottom_sheet.dart';
import '../../../../../core/ui/widgets/card/ui_custom_app_card.dart';
import '../../../../../core/ui/widgets/textfield/ui_text_field_rounded.dart';
import '../../../data/data.dart';
import '../../../presentation/create/components/modal_select_brand.dart';
import '../../../presentation/create/components/modal_select_color.dart';
import '../widgets/header_text_card.dart';

class StepAddInfoDetail extends StatefulWidget {
  const StepAddInfoDetail({super.key});

  @override
  State<StepAddInfoDetail> createState() => _StepAddInfoDetailState();
}

class _StepAddInfoDetailState extends State<StepAddInfoDetail> {
  //TODO: Separar esse help
  void _handleModal<T>({
    required BuildContext context,
    required Widget Function(void Function(T result) onComplete) modalBuilder,
    required void Function(T result) updateBloc,
  }) async {
    final completer = Completer<T?>();
    void onResult(T result) {
      if (!completer.isCompleted) {
        completer.complete(result);
        Navigator.of(context).pop();
      }
    }

    customModalBottomSheet(
      context,
      child: modalBuilder(onResult),
    );

    final T? result = await completer.future;
    if (result != null) {
      updateBloc(result);
    }
  }

  void _selectBrand() {
    _handleModal<String>(
      context: context,
      modalBuilder: (onComplete) => ModalSelectBrand(
        values: kBrands,
        onChange: (brand) => onComplete(brand),
      ),
      updateBloc: (result) =>
          context.read<CreateProductCubit>().onBrandChange(result),
    );
  }

  void _selectColor() {
    _handleModal<String>(
      context: context,
      modalBuilder: (onComplete) => ModalSelectColor(
        onChange: (color) => onComplete(color),
      ),
      updateBloc: (result) =>
          context.read<CreateProductCubit>().onColorChange(result),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateProductCubit, CreateProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.maybeMap(
          data: (state) {
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
                    onChanged: (value) =>
                        context.read<CreateProductCubit>().onModelChange(value),
                    error: state.errorModel,
                  ),
                  const SizedBox(height: 10),
                  UITextFieldRounded(
                    isRequired: true,
                    showLabelText: false,
                    labelText: "Placa",
                    hintText: "Placa",
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => context
                        .read<CreateProductCubit>()
                        .onLicencePlateChange(value),
                    error: state.errorLicencePlate,
                  ),
                  const SizedBox(height: 10),
                  UITextFieldRounded(
                    isRequired: true,
                    showLabelText: false,
                    labelText: "Ano do veículo",
                    hintText: "Ano do veículo",
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onChanged: (value) =>
                        context.read<CreateProductCubit>().onYearChange(value),
                    error: state.maybeMap(
                      data: (value) => value.errorYear,
                      orElse: () => null,
                    ),
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
                    onTap: () => _selectBrand(),
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
                    onTap: () => _selectColor(),
                    controller: TextEditingController(text: state.color),
                  ),
                ],
              ),
            );
          },
          orElse: () => const CircularProgressIndicator(),
        );
      },
    );
  }
}
