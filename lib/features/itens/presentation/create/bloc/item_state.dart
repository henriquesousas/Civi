import 'package:deehelp/features/itens/presentation/create/bloc/detail_brand_state.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/detail_code_state.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/detail_color_state.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/detail_item_state.dart';
import 'package:equatable/equatable.dart';

import '../data.dart';
import '../type_item_select.dart';

enum ItemStatus {
  initial,
  updateItemSelected,
  loadedItemsSuccess,
  loading,
  success,
  error;
}

class ItemState extends Equatable {
  final ItemStatus status;
  final String? errorMessage;
  final DetailItemState detailItem;
  final DetailCodeState detailCode;
  final DetailColorState detailColor;
  final DetailBrandState detailBrand;

  const ItemState._({
    required this.status,
    required this.detailItem,
    required this.detailCode,
    required this.detailColor,
    required this.detailBrand,
    this.errorMessage,
  });

  bool get isFormSelectItemTypeValid => detailItem.selectedItem != null;

  factory ItemState.initial() => ItemState._(
        status: ItemStatus.initial,
        detailItem: DetailItemState(),
        detailCode: DetailCodeState(),
        detailColor: DetailColorState(),
        detailBrand: DetailBrandState(),
      );

  ItemState copyWith({
    ItemStatus? status,
    String? errorMessage,
    DetailItemState? detailItem,
    DetailCodeState? detailCode,
    DetailColorState? detailColor,
    DetailBrandState? detailBrand,
  }) {
    return ItemState._(
      status: status ?? this.status,
      detailItem: detailItem ?? this.detailItem,
      detailCode: detailCode ?? this.detailCode,
      detailColor: detailColor ?? this.detailColor,
      detailBrand: detailBrand ?? this.detailBrand,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  ItemState updateCodeEvent(String code, String? error) {
    final newState = detailCode.copyWith(code: code, error: error);

    return copyWith(
      detailCode: newState,
      status: ItemStatus.initial,
    );
  }

  ItemState updateColorEvent(String color) {
    final newState = detailColor.copyWith(color: color);

    return copyWith(detailColor: newState);
  }

  ItemState updateBrandEvent(String brand) {
    final newState = detailBrand.copyWith(brand: brand);

    return copyWith(detailBrand: newState);
  }

  ItemState updateItemSelectedEvent(TypeItemSelect item) {
    final newState =
        detailItem.copyWith(selectedItem: item, items: detailItem.items);

    return copyWith(
      detailItem: newState,
      status: ItemStatus.updateItemSelected,
    );
  }

  ItemState loadItems() {
    final newState = detailItem.copyWith(
      selectedItem: null,
      items: Data().load(),
    );

    return copyWith(
      detailItem: newState,
      detailCode: detailCode,
      status: ItemStatus.loadedItemsSuccess,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        detailItem,
        detailCode,
        detailColor,
        detailBrand,
      ];
}
