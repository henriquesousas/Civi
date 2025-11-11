import '../utils/type_item_select.dart';

class DetailItemState {
  final TypeItemSelect? selectedItem;
  final List<TypeItemSelect> items;

  DetailItemState({this.selectedItem, this.items = const []});

  DetailItemState copyWith({
    TypeItemSelect? selectedItem,
    List<TypeItemSelect>? items,
  }) {
    return DetailItemState(
      selectedItem: selectedItem ?? this.selectedItem,
      items: items ?? [],
    );
  }
}
