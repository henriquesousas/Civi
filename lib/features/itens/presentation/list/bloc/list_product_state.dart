import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_product_state.freezed.dart';

@freezed
class ListProductState with _$ListProductState {
  const factory ListProductState.initial() = _ListProductStateInitial;
  const factory ListProductState.loading() = _ListProductStateLoading;
  const factory ListProductState.success(
    List<Item> items,
    String selectedFilter,
  ) = _ListProductStateSuccess;

  const factory ListProductState.error(String message) = _ListProductStateError;
  const factory ListProductState.empty() = _ListProductStateEmpty;
  const factory ListProductState.delete() = _ListProductStateDelete;
}
