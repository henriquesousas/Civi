import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product.dart';

part 'product_update_state.freezed.dart';

@freezed
class ProductUpdateState with _$ProductUpdateState {
  const factory ProductUpdateState.initial() = _Initial;
  const factory ProductUpdateState.load(Product product) = _Load;
  const factory ProductUpdateState.editing(Product product) = _Editing;
  const factory ProductUpdateState.deleting(Product product) = _Deleting;
  const factory ProductUpdateState.success(Product product) = _Success;
  const factory ProductUpdateState.error(String message) = _Error;
}
