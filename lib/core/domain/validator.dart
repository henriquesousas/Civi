import 'package:yousafe/core/domain/validation_handler.dart';

abstract class Validator {
  final ValidationHandler handler;

  Validator({required this.handler});
  void validate();
}
