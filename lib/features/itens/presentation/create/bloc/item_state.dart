import 'package:deehelp/features/itens/presentation/create/bloc/detail_brand_state.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/detail_code_state.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/detail_color_state.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/detail_item_state.dart';
import 'package:equatable/equatable.dart';

import '../utils/data.dart';
import '../utils/type_item_select.dart';

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
  bool get isFormItemDetailValid => _isFormItemDetailValid();
  bool _isFormItemDetailValid() {
    if (detailColor.color != null &&
        detailCode.code != null &&
        detailCode.error == null &&
        detailBrand.brand != null) {
      return true;
    }

    return false;
  }

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

  ItemState updateCode(String code, {String? error}) =>
      copyWith(detailCode: detailCode.copyWith(code: code, error: error));

  ItemState updateColor(String color) =>
      copyWith(detailColor: detailColor.copyWith(color: color));

  ItemState updateBrand(String brand) =>
      copyWith(detailBrand: detailBrand.copyWith(brand: brand));

  ItemState updateItemSelected(TypeItemSelect item) => copyWith(
        detailItem: detailItem.copyWith(
          selectedItem: item,
          items: detailItem.items,
        ),
        status: ItemStatus.updateItemSelected,
      );

  ItemState loadItems() => copyWith(
        detailItem:
            detailItem.copyWith(items: Data().load(), selectedItem: null),
        status: ItemStatus.loadedItemsSuccess,
      );

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
