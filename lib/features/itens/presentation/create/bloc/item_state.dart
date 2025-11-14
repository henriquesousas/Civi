import 'dart:io';

import 'package:deehelp/features/itens/presentation/create/bloc/detail_brand_state.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/detail_code_state.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/detail_color_state.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/detail_item_state.dart';
import 'package:deehelp/features/itens/presentation/create/bloc/item_obs_state.dart';
import 'package:equatable/equatable.dart';

import '../utils/data.dart';
import '../utils/type_item_select.dart';

enum ItemStatus {
  initial,
  updatePage,
  loading,
  success,
  error,
  loadedItemsSuccess,
  updateItemSelected;
}

class ItemState extends Equatable {
  final ItemStatus status;
  final String? errorMessage;
  final DetailItemState detailItem;
  final DetailCodeState detailCode;
  final DetailColorState detailColor;
  final DetailBrandState detailBrand;
  final ItemObsState itemObs;
  final File? photoUrl;
  final int? page;

  const ItemState._({
    required this.status,
    required this.detailItem,
    required this.detailCode,
    required this.detailColor,
    required this.detailBrand,
    required this.itemObs,
    this.errorMessage,
    this.photoUrl,
    this.page,
  });

  bool get isFormSelectItemTypeValid => detailItem.selectedItem != null;

  bool get isPhotoValid => photoUrl != null;

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

  Map<String, String> getVehicleDetails() {
    return {
      "Placa": detailCode.code ?? "",
      "Marca": detailBrand.brand ?? "",
      "Modelo": "any",
      "Ano": "2020",
      "Cor": detailColor.color ?? "",
    };
  }

  factory ItemState.initial() => ItemState._(
        status: ItemStatus.initial,
        detailItem: DetailItemState(),
        detailCode: DetailCodeState(),
        detailColor: DetailColorState(),
        detailBrand: DetailBrandState(),
        itemObs: ItemObsState(),
      );

  ItemState copyWith({
    ItemStatus? status,
    String? errorMessage,
    DetailItemState? detailItem,
    DetailCodeState? detailCode,
    DetailColorState? detailColor,
    DetailBrandState? detailBrand,
    ItemObsState? itemObs,
    int? page,
    File? photoUrl,
  }) {
    return ItemState._(
      status: status ?? this.status,
      detailItem: detailItem ?? this.detailItem,
      detailCode: detailCode ?? this.detailCode,
      detailColor: detailColor ?? this.detailColor,
      detailBrand: detailBrand ?? this.detailBrand,
      itemObs: itemObs ?? this.itemObs,
      photoUrl: photoUrl ?? this.photoUrl,
      page: page ?? this.page,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  ItemState updateCode(String code, {String? error}) => copyWith(
        detailCode: detailCode.copyWith(code: code, error: error),
        itemObs: itemObs,
      );

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

  ItemState updatePhoto(File url) => copyWith(photoUrl: url);

  ItemState updateObs(String value) => copyWith(
        itemObs: itemObs.copyWith(value: value),
        detailCode: detailCode,
      );

  ItemState updatePage(int page) => copyWith(
        page: page,
        status: ItemStatus.updatePage,
      );

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        detailItem,
        detailCode,
        detailColor,
        detailBrand,
        photoUrl,
        itemObs,
        page,
      ];
}
