// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_deletion_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileDeletionRequestModel _$ProfileDeletionRequestModelFromJson(
  Map<String, dynamic> json,
) => _ProfileDeletionRequestModel(
  id: json['id'] as String,
  status: json['status'] as String,
  reason: json['reason'] as String,
  requestedAt: DateTime.parse(json['requested_at'] as String),
  processedAt: json['processed_at'] == null
      ? null
      : DateTime.parse(json['processed_at'] as String),
);

Map<String, dynamic> _$ProfileDeletionRequestModelToJson(
  _ProfileDeletionRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'reason': instance.reason,
  'requested_at': instance.requestedAt.toIso8601String(),
  'processed_at': instance.processedAt?.toIso8601String(),
};
