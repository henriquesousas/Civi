import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/my_items.dart';

part 'item_update_state.freezed.dart';

@freezed
class ItemUpdateState with _$ItemUpdateState {
  const factory ItemUpdateState.initial() = _ItemUpdateStateInitial;
  const factory ItemUpdateState.load(Item tem) = _ItemUpdateStateLoad;
  const factory ItemUpdateState.changeModel(String value) =
      _ItemUpdateStateChangeModel;
}
