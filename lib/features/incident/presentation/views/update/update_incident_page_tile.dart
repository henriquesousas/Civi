import 'package:deehelp/core/base/base_page.dart';
import 'package:deehelp/core/extensions/dialog_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/core/ui/widgets/textfield/ui_text_field_rounded.dart';
import 'package:deehelp/features/incident/presentation/providers/incident_viewmodel_providers.dart';
import 'package:deehelp/features/incident/presentation/views/update/state/update_incident_state.dart';
import 'package:deehelp/features/incident/presentation/views/update/update_incident_args.dart';
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
          return;
        }
        if (oldState?.errorMessage != null &&
            !currentState.updatedSuccessfully) {
          context.showSnackBar(currentState.errorMessage!);
          return;
        }
      },
    );

    super.listener();
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
        Text(
          widget.args.description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
        ),
        UITextFieldRounded(
          textInputAction: TextInputAction.done,
          showLabelText: false,
          labelText: widget.args.hint,
          hintText: widget.args.hint,
          maxLength: widget.args.maxLength,
          maxLine: widget.args.maxLine,
          controller: _controller,
          onChanged: (value) {
            switch (widget.args.field) {
              case IncidentField.city:
                viewModel.onCityChange(value);
                break;
              default:
                {}
            }
          },
          error: state.errorMessage,
        ),
        UIElevatedButton(
          text: "Confirmar",
          isLoading: state.isLoading,
          isEnabled: state.isFormValid,
          press: () {
            // FocusScope.of(context).unfocus();
            viewModel.update();
          },
        )
      ],
    );
  }
}
