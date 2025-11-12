import 'dart:io';

import 'package:deehelp/features/itens/presentation/create/utils/type_item_select.dart';

abstract class ItemEvent {}

class ItemSelectedEvent extends ItemEvent {
  final TypeItemSelect item;

  ItemSelectedEvent({required this.item});
}

class LoadItemsEvent extends ItemEvent {
  LoadItemsEvent();
}

class ItemCodeChangeEvent extends ItemEvent {
  final String code;

  ItemCodeChangeEvent({required this.code});
}

class ItemColorChangeEvent extends ItemEvent {
  final String color;

  ItemColorChangeEvent({required this.color});
}

class ItemBrandChangeEvent extends ItemEvent {
  final String brand;

  ItemBrandChangeEvent({required this.brand});
}

class ItemObsChangeEvent extends ItemEvent {
  final String value;

  ItemObsChangeEvent({required this.value});
}

class ChangePageEvent extends ItemEvent {
  final int page;

  ChangePageEvent({required this.page});
}

class ImagePickerEvent extends ItemEvent {
  final File file;

  ImagePickerEvent({required this.file});
}
