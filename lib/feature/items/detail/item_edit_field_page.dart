import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/size/icon_size.dart';
import 'package:deehelp/core/theme/size/spacing_size.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/core/ui/widgets/cards/card_exports.dart';
import 'package:deehelp/core/ui/widgets/textfield/text_field_card.dart';
import 'package:deehelp/feature/items/detail/edit_args.dart';
import 'package:deehelp/feature/items/detail/provider/item_update_viewmodel_provider.dart';
import 'package:deehelp/feature/items/detail/provider/selected_item_provider.dart';
import 'package:deehelp/feature/items/detail/viewmodel/product_update_state.dart';
import 'package:deehelp/feature/items/detail/widgets/edit/edit_info_card.dart';
import 'package:deehelp/module/item/domain/entities/product.dart';
import 'package:deehelp/old_core/ui/extensions/dialog_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ItemEditFieldPage extends ConsumerStatefulWidget {
  final EditFieldArgs args;
  const ItemEditFieldPage({super.key, required this.args});

  @override
  ConsumerState<ItemEditFieldPage> createState() => _ItemEditFieldPageState();
}

class _ItemEditFieldPageState extends ConsumerState<ItemEditFieldPage> {
  Product? _currentProduct;
  late final TextEditingController _ctrl;
  late final FocusNode _focus;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController(text: widget.args.initialValue);
    _focus = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focus.requestFocus();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final a = widget.args;

    _currentProduct = ref.watch(selectedItemProvider.notifier).state;
    final provider = itemUpdateViewmodelProvider(_currentProduct!.id.value);

    final state = ref.watch(provider);
    final viewModel = ref.watch(provider.notifier);

    listener(_currentProduct!);

    return Scaffold(
      appBar: DefaultAppBar(
        title: a.title,
        showBackButton: true,
        press: () => _pop(),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
        children: [
          EditInfoCard(
            title: a.label,
            helper: a.helper ??
                'Atualize esta informação para manter seus dados corretos.',
          ),
          const SizedBox(height: SpacingSize.md),
          TextFieldCard(
            controller: _ctrl,
            hint: a.hint,
            error: state.errorValidation,
            formatters: widget.args.inputFormatters,
            maxLength: widget.args.maxLen,
            maxLines: widget.args.maxLines,
            onChanged: (value) => viewModel.onValueChange(
              widget.args.field,
              value,
              widget.args.initialValue,
            ),
          ),
          const SizedBox(height: SpacingSize.md),
          if (a.isPhone) ...[
            CardHint(
              icon: Icon(Icons.info_outline,
                  color: context.primaryColor, size: IconSizes.sm),
              title: "Onde encontrar o IMEI",
              message:
                  "Você pode encontrar o IMEI em *#06# ou na caixa do aparelho.",
            )
          ],
        ],
      ),
      bottomSheet: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              Expanded(
                child: ButtonOutline(
                  press: () => _pop(),
                  text: "Cancelar",
                  textColor: context.onSurface,
                ),
              ),
              const SizedBox(width: SpacingSize.md),
              Expanded(
                child: ButtonPrimary(
                  press:
                      state.errorValidation == null && state.hasChangeSomeField
                          ? () => viewModel.updatreProduct()
                          : null,
                  text: "Salvar alterações",
                  loading: state.isLoading,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void listener(Product item) {
    final provider = itemUpdateViewmodelProvider(item.id.value);
    ref.listen<ProductUpdateState>(
      provider,
      (oldState, currentState) {
        if (currentState.isSuccess) {
          ref.watch(selectedItemProvider.notifier).state =
              currentState.currentProduct!;
          context.pop(true);
        }

        if (currentState.errorMessage != null &&
            currentState.errorMessage != oldState?.errorMessage) {
          context.showSnackBar(currentState.errorMessage!,
              type: DialogType.error);
        }
      },
    );
  }

  void _pop() {
    final provider = itemUpdateViewmodelProvider(_currentProduct!.id.value);
    ref.read(provider.notifier).clearErrorMessage();
    context.pop();
  }
}
