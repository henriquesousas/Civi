import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_modal_state.freezed.dart';

@freezed
class ItemModalState with _$ItemModalState {
  const factory ItemModalState.initial() = _ItemModalStateInitial;
  const factory ItemModalState.validation({
    required String field,
    required String? error,
  }) = _ItemModalStateValidation;
  const factory ItemModalState.success() = _ItemModalStateSuccess;
}
