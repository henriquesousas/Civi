import 'dart:async';

import 'package:deehelp/core/components/custom_modal_bottom_sheet.dart';
import 'package:deehelp/core/components/textfields/ui_primary_text_field.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/create_item_bloc.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/item_event.dart';
import 'package:deehelp/features/itens/presentation/create/components/modal_select_color.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/input_decoration_theme.dart';
import '../bloc/item_state.dart' hide ItemStatus;
import '../components/header.dart';
import '../components/modal_select_brand.dart';

class StepItemDetailPage extends StatefulWidget {
  const StepItemDetailPage({super.key});

  @override
  State<StepItemDetailPage> createState() => _StepItemDetailPageState();
}

class _StepItemDetailPageState extends State<StepItemDetailPage> {
  final TextEditingController txtCode = TextEditingController();
  final FocusNode _txtFocusNodes = FocusNode();

  void _handleModal<T>({
    required BuildContext context,
    required Widget Function(void Function(T result) onComplete) modalBuilder,
    required void Function(T result) updateBloc,
  }) async {
    _unFocus();

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
      height: context.percentHeight(0.5),
    );

    final T? result = await completer.future;
    if (result != null) {
      updateBloc(result);
    }
  }

  void _selectBrand(BuildContext context) {
    _handleModal<String>(
      context: context,
      modalBuilder: (onComplete) => ModalSelectBrand(
        onChange: (brand) => onComplete(brand),
      ),
      updateBloc: (result) => context
          .read<CreateItemBloc>()
          .add(ItemBrandChangeEvent(brand: result)),
    );
  }

  void _selectColor(BuildContext context) {
    _handleModal<String>(
      context: context,
      modalBuilder: (onComplete) => ModalSelectColor(
        onChange: (color) => onComplete(color),
      ),
      updateBloc: (result) => context
          .read<CreateItemBloc>()
          .add(ItemColorChangeEvent(color: result)),
    );
  }

  void _changeVehicleCode(String code) {
    context
        .read<CreateItemBloc>()
        .add(ItemCodeChangeEvent(code: code.toUpperCase()));
  }

  void _unFocus() {
    if (_txtFocusNodes.hasFocus) {
      _txtFocusNodes.unfocus();
    }
  }

  @override
  void dispose() {
    _txtFocusNodes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<CreateItemBloc, ItemState>(
        listener: (context, state) {},
        builder: (context, state) {
          final hasBrand = state.detailBrand.brand != null;
          final hasColor = state.detailColor.color != null;
          final hasCode = state.detailCode.code != null;
          final selectedLabelStyle =
              Theme.of(context).textTheme.bodyLarge?.copyWith();
          final activeBorder = outlineInputBorder.copyWith(
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width: 1.0,
            ),
          );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              Header(
                title: R.strings.stepItemDetailHeader,
                subtitle: R.strings.stepItemDetailBody,
              ),
              const SizedBox(height: 32),
              UIPrimaryTextField(
                focusNode: _txtFocusNodes,
                initialValue: state.detailCode.code,
                labelText: R.strings.hintTextVehicleCode,
                errorText: state.detailCode.error,
                labelStyle: hasCode ? selectedLabelStyle : null,
                enabledBorder: hasCode ? activeBorder : null,
                upperCase: true,
                onChanged: (value) => _changeVehicleCode(value),
              ),
              UIPrimaryTextField(
                labelText: state.detailBrand.brand ?? R.strings.selectBrand,
                initialValue: state.detailBrand.brand,
                labelStyle: hasBrand ? selectedLabelStyle : null,
                onTap: () => _selectBrand(context),
                suffixIcon: Icon(
                  Icons.arrow_circle_down,
                  color: hasBrand
                      ? AppColors.primaryColor
                      : AppColors.whileColor60,
                ),
                enabledBorder: hasBrand ? activeBorder : null,
              ),
              UIPrimaryTextField(
                initialValue: state.detailColor.color,
                labelText: state.detailColor.color ?? R.strings.selectColor,
                labelStyle: hasColor ? selectedLabelStyle : null,
                enabledBorder: hasColor ? activeBorder : null,
                onTap: () => _selectColor(context),
                suffixIcon: Icon(
                  Icons.arrow_circle_down,
                  color: hasColor
                      ? AppColors.primaryColor
                      : AppColors.whileColor60,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
