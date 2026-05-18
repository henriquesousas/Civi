import 'package:deehelp/old_core/errors/failure.dart';
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
        ? "Placa já cadastrada!!!"
        : "Celular já cadastrado!!!";

    return ItemAlreadyExistException._(message);
  }
}
