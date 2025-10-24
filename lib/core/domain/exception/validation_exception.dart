import 'domain_exception.dart';

final class ValidationException extends DomainException {
  final List<String> errors;

  ValidationException({
    required this.errors,
  }) : super(message: "UnprocessableEntity", code: "400");
}
