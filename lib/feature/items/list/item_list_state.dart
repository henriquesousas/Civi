import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../module/item/domain/entities/product.dart';

part 'list_product_state.freezed.dart';

@freezed
class ListProductState with _$ListProductState {
  const factory ListProductState.initial() = _ListProductStateInitial;
  const factory ListProductState.loading() = _ListProductStateLoading;
  const factory ListProductState.success(
    List<Product> items,
    String selectedFilter,
  ) = _ListProductStateSuccess;

  const factory ListProductState.error(String message) = _ListProductStateError;
  const factory ListProductState.empty() = _ListProductStateEmpty;
  const factory ListProductState.delete() = _ListProductStateDelete;
  const factory ListProductState.deleteLoading() =
      _ListProductStateDeleteLoading;
  const factory ListProductState.deleteSuccess() =
      _ListProductStateDeleteSuccess;
  const factory ListProductState.deleteError() = _ListProductStateDeleteError;
}
