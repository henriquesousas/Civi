import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:deehelp/old_core/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/old_core/ui/widgets/textfield/text_field_card.dart';
import 'package:deehelp/feature/items/detail/widgets/edit/edit_info_card.dart';
import 'package:deehelp/old_core/extension/dialog_extension.dart';
import 'package:deehelp/old_core/extension/string_extension.dart';
import 'package:deehelp/feature/incidents/providers/update_incident_viewmodel_provider.dart';
import 'package:deehelp/feature/incidents/update/incident_field.dart';
import 'package:deehelp/feature/incidents/update/state/update_incident_state.dart';
import 'package:deehelp/feature/incidents/update/update_incident_args.dart';
import 'package:deehelp/feature/incidents/update/update_incident_viewmodel.dart';
import 'package:deehelp/old_core/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpdateIncidentPageTile extends BasePage {
  final UpdateIncidentArgs args;

  const UpdateIncidentPageTile({
    super.key,
    required this.args,
  });

  @override
  BasePageState<UpdateIncidentPageTile> createState() =>
      _UpdateIncidentPageTileState();
}

class _UpdateIncidentPageTileState
    extends BasePageState<UpdateIncidentPageTile> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.args.value);
  }

  @override
  String? pageTitle() => widget.args.toolbarTitle;

  @override
  VoidCallback? onBackPress() => () => context.pop();

  @override
  void listener() {
    ref.listen<UpdateIncidentState>(
      updateIncidentViewmodelProvider,
      (oldState, currentState) {
        if (oldState?.updatedSuccessfully != currentState.updatedSuccessfully &&
            currentState.updatedSuccessfully) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            context.pop(true);
          });
        }

        if (oldState?.errorMessage != currentState.errorMessage &&
            currentState.errorMessage != null) {
          FocusScope.of(context).unfocus();
          context.showSnackBar(
            currentState.errorMessage!,
            type: DialogType.error,
          );
        }

        if (oldState?.updatedPlaceValue != currentState.updatedPlaceValue &&
            currentState.updatedPlaceValue != null) {
          final value = currentState.updatedPlaceValue;
          if (value.isNullOrEmpty()) return;
          _onChangeValue(
            ref.watch(updateIncidentViewmodelProvider.notifier),
            value!,
          );
          setState(() {
            _controller = TextEditingController(text: value);
          });
        }
      },
    );

    super.listener();
  }

  void _onChangeValue(UpdateIncidentViewmodel viewModel, String value) {
    switch (widget.args.field) {
      case IncidentField.city:
        viewModel.onCityChange(value);
        break;
      case IncidentField.state:
        viewModel.onStateChange(value);
        break;
      case IncidentField.address:
        viewModel.onAddressChange(value);
        break;
      case IncidentField.howto:
        viewModel.onHowToChange(value);
        break;
    }
  }

  @override
  Widget buildPage(BuildContext context) {
    final viewModel = ref.watch(updateIncidentViewmodelProvider.notifier);
    final state = ref.watch(updateIncidentViewmodelProvider);

    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EditInfoCard(
          title: widget.args.toolbarTitle,
          helper: widget.args.description,
        ),
        TextFieldCard(
          controller: _controller,
          hint: widget.args.hint,
          error: state.updateError,
          // formatters: widget.args.inputFormatters,
          maxLength: widget.args.maxLength,
          maxLines: widget.args.maxLine,
          onChanged: (value) => _onChangeValue(viewModel, value),
        ),
        ButtonPrimary(
          press: () => viewModel.update(),
          loading: state.isLoading,
          // loading: true,
          text: "Confirmar",
        ),
        if (widget.args.showMyLocationButton) ...[
          ButtonOutline(
            loading: state.isGetCurrentLocattion,
            // loading: true,
            isPrimary: true,
            borderColor:
                context.isDark() ? Colors.white : AppColors.primaryColor,
            textColor: context.isDark() ? Colors.white : AppColors.primaryColor,
            press: () async {
              viewModel.getCurrentLocation(
                  widget.args.value, widget.args.field);
            },
            icon: Icon(
              Icons.gps_fixed,
              // color: context.primaryColor,
              color: context.isDark() ? Colors.white : AppColors.primaryColor,
            ),
            text: "Usar minha localização",
          ),
        ],
      ],
    );
  }
}
