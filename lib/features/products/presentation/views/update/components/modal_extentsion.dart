// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../../../core/components/custom_modal_bottom_sheet.dart';
// import '../../domain/entities/my_items.dart';
// import 'cubit/item_update_cubit.dart';
// import 'cubit/modal/item_modal_cubit.dart';
// import 'cubit/modal/item_modal_state.dart';
// import 'edit_field_modal.dart';
//
// extension ModalExtentsion on BuildContext {
//   void showModelModal(Item item) {
//     final modalCubit = read<ItemModalCubit>();
//     final updateCubit = read<ItemUpdateCubit>();
//
//     modalCubit.initializeSafeCopy(item);
//
//     customModalBottomSheet(
//       this,
//       child: BlocProvider.value(
//         value: modalCubit,
//         child: BlocBuilder<ItemModalCubit, ItemModalState>(
//           builder: (context, state) {
//             final modalCubit = context.read<ItemModalCubit>();
//             final errorText = state.maybeMap(
//               validation: (state) =>
//                   state.field == 'model' ? state.error : null,
//               orElse: () => null,
//             );
//
//             return EditFieldModal(
//               title: "Modelo",
//               hintText: "Modelo",
//               description: "Atualize informações do modelo do veículo",
//               examples: "Exemplos: Civic, Corolla, Onix, HB20",
//               prefixIcon: Icons.directions_car,
//               initialValue: item.name,
//               errorText: errorText,
//               onConfirm: errorText == null
//                   ? (value) => updateCubit.applyModelChange(value)
//                   : null,
//               onCancel: () => context.pop(),
//               onChange: modalCubit.changeModel,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
