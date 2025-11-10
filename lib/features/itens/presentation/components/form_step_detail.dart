import 'dart:async';

import 'package:deehelp/core/components/custom_modal_bottom_sheet.dart';
import 'package:deehelp/core/components/textfields/ui_primary_text_field.dart';
import 'package:deehelp/features/itens/presentation/components/select_brand.dart';
import 'package:deehelp/features/itens/presentation/components/select_color.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/create_item_bloc.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/item_event.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/input_decoration_theme.dart';
import 'header.dart';

class FormStepDetail extends StatefulWidget {
  const FormStepDetail({super.key});

  @override
  State<FormStepDetail> createState() => _FormStepDetailState();
}

class _FormStepDetailState extends State<FormStepDetail> {
  void _updateCode(String code) {
    context.read<CreateItemBloc>().add(ItemCodeChangeEvent(code: code));
  }

  void _handleSelectionModal<T>({
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

  void _onTapSelectBrand(BuildContext context) {
    _handleSelectionModal<String>(
      context: context,
      modalBuilder: (onComplete) => SelectBrand(
        onChange: (brand) => onComplete(brand),
      ),
      updateBloc: (result) => context
          .read<CreateItemBloc>()
          .add(ItemBrandChangeEvent(brand: result)),
    );
  }

  void _onTapSelectColor(BuildContext context) {
    _handleSelectionModal<String>(
      context: context,
      modalBuilder: (onComplete) => SelectColor(
        onChange: (color) => onComplete(color),
      ),
      updateBloc: (result) => context
          .read<CreateItemBloc>()
          .add(ItemColorChangeEvent(color: result)),
    );
  }

  @override
  void dispose() {
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
          final selectedLabelStyle =
              Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  );
          final activeBorder = outlineInputBorder.copyWith(
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width: 2.0,
            ),
          );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Header(
                title: R.strings.stepItemDetailHeader,
                subtitle: R.strings.stepItemDetailBody,
              ),
              const SizedBox(height: 32),
              UIPrimaryTextField(
                labelText: R.strings.hintTextVehicleCode,
                errorText: state.detailCode.error,
                onChanged: (value) => _updateCode(value),
              ),
              UIPrimaryTextField(
                labelText: state.detailBrand.brand ?? R.strings.selectBrand,
                initialValue: state.detailBrand.brand,
                labelStyle: hasBrand ? selectedLabelStyle : null,
                onTap: () => _onTapSelectBrand(context),
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
                onTap: () => _onTapSelectColor(context),
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
