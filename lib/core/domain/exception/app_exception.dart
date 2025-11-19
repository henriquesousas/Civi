class AppException implements Exception {
  final String message;
  final String? code;
  final StackTrace? stackTrace;
  final DateTime timestamp;

  AppException({
    required this.message,
    this.code,
    this.stackTrace,
  }) : timestamp = DateTime.now();

  @override
  String toString() {
    return 'DomainException: $message${code != null ? ' (Code: $code)' : ''}';
  }
}
