// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../domain/entities/product.dart';
// import 'state/item_modal_state.dart';

// class ProductEditModalCubit extends Cubit<ItemModalState> {
//   Product? _workingItem;
//   ProductEditModalCubit() : super(const ItemModalState.initial());

//   void initializeSafeCopy(Product item) {
//     _workingItem = item;
//     emit(const ItemModalState.initial());
//   }

//   Future<void> changeModel(String model) async {
//     if (_workingItem == null) return;

//     _workingItem = _workingItem!.changeModel(model);

//     final error = _workingItem!.notification.hasErrors
//         ? _workingItem!.notification.getErrors[0]
//         : null;

//     emit(ItemModalState.validation(field: "model", error: error));
//   }

//   Future<void> changeObs(String value) async {
//     if (_workingItem == null) return;

//     _workingItem = _workingItem!.changeObs(value);

//     emit(const ItemModalState.validation(field: "model", error: null));
//   }

//   Future<void> changeBrand(String value) async {
//     if (_workingItem == null) return;

//     _workingItem = _workingItem!.changeObs(value);

//     emit(const ItemModalState.validation(field: "brand", error: null));
//   }

//   String get currentBrand => _workingItem?.brand ?? '';
//   String get currentModel => _workingItem?.name ?? '';
//   String get currentColor => _workingItem?.color ?? '';
//   String get currentObservation => _workingItem?.obs ?? '';
//   String get currentCode => _workingItem?.code ?? '';
// }
