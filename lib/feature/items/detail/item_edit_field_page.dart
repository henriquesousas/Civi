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
import 'package:deehelp/core/extension/dialog_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// class ItemEditFieldPage extends ConsumerStatefulWidget {
//   final EditFieldArgs args;
//   const ItemEditFieldPage({super.key, required this.args});

//   @override
//   ConsumerState<ItemEditFieldPage> createState() => _ItemEditFieldPageState();
// }

// class _ItemEditFieldPageState extends ConsumerState<ItemEditFieldPage> {
//   Product? _currentProduct;
//   late final TextEditingController _ctrl;
//   late final FocusNode _focus;

//   @override
//   void initState() {
//     super.initState();
//     _ctrl = TextEditingController(text: widget.args.initialValue);
//     _focus = FocusNode();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _focus.requestFocus();
//     });
//   }

//   @override
//   void dispose() {
//     _ctrl.dispose();
//     _focus.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final a = widget.args;

//     _currentProduct = ref.watch(selectedItemProvider.notifier).state;
//     final provider = itemUpdateViewmodelProvider(_currentProduct!.id.value);

//     final state = ref.watch(provider);
//     final viewModel = ref.watch(provider.notifier);

//     listener(_currentProduct!);

//     return Scaffold(
//       appBar: DefaultAppBar(
//         title: a.title,
//         showBackButton: true,
//         press: () => _pop(),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
//         children: [
//           EditInfoCard(
//             title: a.label,
//             helper: a.helper ??
//                 'Atualize esta informação para manter seus dados corretos.',
//           ),
//           const SizedBox(height: SpacingSize.md),
//           TextFieldCard(
//             controller: _ctrl,
//             hint: a.hint,
//             error: state.errorValidation,
//             formatters: widget.args.inputFormatters,
//             maxLength: widget.args.maxLen,
//             maxLines: widget.args.maxLines,
//             onChanged: (value) => viewModel.onValueChange(
//               widget.args.field,
//               value,
//               widget.args.initialValue,
//             ),
//           ),
//           const SizedBox(height: SpacingSize.md),
//           if (a.isPhone) ...[
//             CardHint(
//               icon: Icon(Icons.info_outline,
//                   color: context.primaryColor, size: IconSizes.sm),
//               title: "Onde encontrar o IMEI",
//               message:
//                   "Você pode encontrar o IMEI em *#06# ou na caixa do aparelho.",
//             )
//           ],
//         ],
//       ),
//       bottomSheet: Container(
//         color: Colors.transparent,
//         padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
//         child: SafeArea(
//           top: false,
//           child: Row(
//             children: [
//               Expanded(
//                 child: ButtonOutline(
//                   press: () => _pop(),
//                   text: "Cancelar",
//                   textColor: context.primaryColor,
//                 ),
//               ),
//               const SizedBox(width: SpacingSize.md),
//               Expanded(
//                 child: ButtonPrimary(
//                   press:
//                       state.errorValidation == null && state.hasChangeSomeField
//                           ? () => viewModel.updatreProduct()
//                           : null,
//                   text: "Salvar alterações",
//                   loading: state.isLoading,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void listener(Product item) {
//     final provider = itemUpdateViewmodelProvider(item.id.value);
//     ref.listen<ProductUpdateState>(
//       provider,
//       (oldState, currentState) {
//         if (currentState.isSuccess) {
//           ref.watch(selectedItemProvider.notifier).state =
//               currentState.currentProduct!;
//           context.pop(true);
//         }

//         if (currentState.errorMessage != null &&
//             currentState.errorMessage != oldState?.errorMessage) {
//           context.showSnackBar(currentState.errorMessage!,
//               type: DialogType.error);
//         }
//       },
//     );
//   }

//   void _pop() {
//     final provider = itemUpdateViewmodelProvider(_currentProduct!.id.value);
//     ref.read(provider.notifier).clearErrorMessage();
//     context.pop();
//   }
// }

//V2
class ItemEditFieldPageV2 extends ConsumerStatefulWidget {
  final EditFieldArgs args;
  const ItemEditFieldPageV2({super.key, required this.args});

  @override
  ConsumerState<ItemEditFieldPageV2> createState() =>
      _ItemEditFieldPageStateV2();
}

class _ItemEditFieldPageStateV2 extends ConsumerState<ItemEditFieldPageV2> {
  Product? _currentProduct;
  late final TextEditingController _ctrl;
  late final FocusNode _focus;

  // final background = Color(0xFF0B1020);
  // final surface = Color(0xFF121A2F);
  // final surfaceSoft = Color(0xFF18233D);
  // final stroke = Color(0xFF26324F);
  // final primary = Color(0xFF4F7BFF);
  // final textPrimary = Colors.white;
  // final textSecondary = Color(0xFFA7B1C7);

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

    _listener(_currentProduct!);

    // final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      // backgroundColor: const Color(0xFF090C14),
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: DefaultAppBar(
        title: a.title,
        showBackButton: true,
        press: () => _pop(hasReturn: false),
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: [
            // Container(
            //   padding: const EdgeInsets.all(16),
            //   decoration: BoxDecoration(
            //     color: const Color(0xFF111624),
            //     borderRadius: BorderRadius.circular(20),
            //     border: Border.all(
            //       color: Colors.white.withValues(alpha: 0.06),
            //     ),
            //   ),
            //   child: EditInfoCard(
            //     title: a.label,
            //     helper: a.helper ??
            //         'Atualize esta informação para manter seus dados corretos.',
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.all(18),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(24),
            //     gradient: const LinearGradient(
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //       colors: [
            //         Color(0xFF182544),
            //         Color(0xFF0F172B),
            //       ],
            //     ),
            //     border: Border.all(
            //       color: const Color(0xFF2A3A61),
            //       width: 1,
            //     ),
            //     boxShadow: const [
            //       BoxShadow(
            //         color: Colors.black26,
            //         blurRadius: 24,
            //         offset: Offset(0, 10),
            //       ),
            //     ],
            //   ),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Container(
            //         width: 40.w,
            //         height: 40.h,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(16),
            //           color: primary.withValues(alpha: 0.14),
            //           border: Border.all(
            //             color: primary.withOpacity(0.28),
            //           ),
            //         ),
            //         child: Icon(
            //           CupertinoIcons.pen,
            //           color: primary,
            //           size: 24,
            //         ),
            //       ),
            //       const SizedBox(width: 14),
            //       Expanded(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'Atualize este campo',
            //               style: TextStyle(
            //                 color: textPrimary,
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.w700,
            //               ),
            //             ),
            //             const SizedBox(height: 6),
            //             Text(
            //               widget.args.helper ??
            //                   'Atualize esta informação para manter seus dados corretos.',
            //               style: TextStyle(
            //                 color: textSecondary,
            //                 fontSize: 14.5,
            //                 height: 1.45,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            EditInfoCard(
              title: "Atualizar ${widget.args.label}",
              helper: a.helper ??
                  'Atualize esta informação para manter seus dados corretos.',
            ),
            const SizedBox(height: SpacingSize.md),
            TextFieldCard(
              controller: _ctrl,
              hint: widget.args.hint,
              error: state.errorValidation,
              // formatters: widget.args.inputFormatters,
              maxLength: widget.args.maxLen,
              maxLines: widget.args.maxLines,
              onChanged: (value) => viewModel.onValueChange(
                a.field,
                value,
                a.initialValue,
              ),
            ),

            if (a.isPhone) ...[
              const SizedBox(height: SpacingSize.md),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF0F1A2C),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: context.primaryColor.withValues(alpha: 0.18),
                  ),
                ),
                child: CardHint(
                  icon: Icon(
                    Icons.info_outline,
                    color: context.primaryColor,
                    size: IconSizes.sm,
                  ),
                  title: "Onde encontrar o IMEI",
                  message:
                      "Você pode encontrar o IMEI digitando *#06# ou consultando a caixa do aparelho.",
                ),
              ),
            ],
            const SizedBox(height: SpacingSize.xl),
            ButtonPrimary(
              press: state.errorValidation == null && state.hasChangeSomeField
                  ? () => viewModel.updatreProduct()
                  : null,
              text: "Salvar alterações",
              loading: state.isLoading,
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   // decoration: BoxDecoration(
      //   //     // color: const Color(0xFF0B101C),
      //   //     // border: Border(
      //   //     //   top: BorderSide(
      //   //     //     color: Colors.white.withValues(alpha: 0.06),
      //   //     //   ),
      //   //     // ),
      //   //     // boxShadow: [
      //   //     //   BoxShadow(
      //   //     //     color: Colors.black.withValues(alpha: 0.25),
      //   //     //     blurRadius: 24,
      //   //     //     offset: const Offset(0, -8),
      //   //     //   ),
      //   //     // ],
      //   //     ),
      //   padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      //   child: SafeArea(
      //     top: false,
      //     child: Row(
      //       children: [
      //         Expanded(
      //           child: ButtonOutline(
      //             press: _pop,
      //             text: "Cancelar",
      //             textColor: Colors.white,
      //           ),
      //         ),
      //         const SizedBox(width: SpacingSize.md),
      //         Expanded(
      //           child: ButtonPrimary(
      //             press:
      //                 state.errorValidation == null && state.hasChangeSomeField
      //                     ? () => viewModel.updatreProduct()
      //                     : null,
      //             text: "Salvar alterações",
      //             loading: state.isLoading,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  void _listener(Product item) {
    final provider = itemUpdateViewmodelProvider(item.id.value);

    ref.listen<ProductUpdateState>(
      provider,
      (oldState, currentState) {
        if (currentState.isSuccess) {
          ref.watch(selectedItemProvider.notifier).state =
              currentState.currentProduct!;

          // context.pop(true);
          _pop();
        }

        if (currentState.errorMessage != null &&
            currentState.errorMessage != oldState?.errorMessage) {
          context.showSnackBar(
            currentState.errorMessage!,
            type: DialogType.error,
          );
        }
      },
    );
  }

  void _pop({hasReturn = true}) {
    final provider = itemUpdateViewmodelProvider(_currentProduct!.id.value);
    ref.read(provider.notifier).clearErrorMessage();
    context.pop(hasReturn);
  }
}
