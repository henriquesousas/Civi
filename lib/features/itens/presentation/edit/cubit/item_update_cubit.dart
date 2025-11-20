import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/presentation/edit/cubit/item_update_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemUpdateCubit extends Cubit<ItemUpdateState> {
  ItemUpdateCubit() : super(const ItemUpdateState.initial());

  Future<void> load(Item item) async {
    emit(ItemUpdateState.load(item));
  }
}
