import 'package:deehelp/core/errors/failure.dart';
import 'package:deehelp/feature/items/item_type.dart';

class ItemNotFoundException extends Failure {
  const ItemNotFoundException._(
    String message,
  ) : super(message);

  static ItemNotFoundException from(
    ItemType type,
    String code,
  ) {
    final message = type != ItemType.phone
        ? "${type.label} com a placa $code já cadastrado!!!"
        : "Celular já cadastrado!!!";

    return ItemNotFoundException._(message);
  }
}
