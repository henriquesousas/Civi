import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product.dart';

part 'product_update_state.freezed.dart';

@freezed
class ProductUpdateState with _$ProductUpdateState {
  const factory ProductUpdateState.initial() = _Initial;
  const factory ProductUpdateState.load(Product product) = _Load;
  const factory ProductUpdateState.editing(Product product) =
      _ProductUpdateStateEditing;
  const factory ProductUpdateState.success() = _Success;
  const factory ProductUpdateState.error(String message) = _Error;

  // const factory ProductUpdateState.changeModel(String value) =
  //     _ProductUpdateStateChangeModel;
}
