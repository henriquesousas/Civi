class AccountDeletionRequest {
  final String id;
  final String status;
  final String reason;
  final DateTime requestedAt;
  final DateTime? processedAt;

  AccountDeletionRequest({
    required this.id,
    required this.status,
    required this.reason,
    required this.requestedAt,
    this.processedAt,
  });
}
