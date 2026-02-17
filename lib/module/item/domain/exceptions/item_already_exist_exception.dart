import 'package:deehelp/core/errors/failure.dart';
import 'package:deehelp/feature/items/item_type.dart';

class ItemAlreadyExistException extends Failure {
  const ItemAlreadyExistException._(
    String message,
  ) : super(message);

  static ItemAlreadyExistException from(
    ItemType type,
    String code,
  ) {
    final message = type != ItemType.phone
        ? "${type.label} com a placa $code já cadastrado!!!"
        : "Celular já cadastrado!!!";

    return ItemAlreadyExistException._(message);
  }
}
