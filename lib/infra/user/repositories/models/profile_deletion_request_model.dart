import 'package:deehelp/business/user/usecases/get_profile/account_deletion_request.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_deletion_request_model.freezed.dart';
part 'profile_deletion_request_model.g.dart';

@freezed
abstract class ProfileDeletionRequestModel with _$ProfileDeletionRequestModel {
  factory ProfileDeletionRequestModel({
    required String id,
    required String status,
    required String reason,
    @JsonKey(name: "requested_at") required DateTime requestedAt,
    @JsonKey(name: "processed_at") required DateTime? processedAt,
  }) = _ProfileDeletionRequestModel;

  factory ProfileDeletionRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileDeletionRequestModelFromJson(json);
}

extension ProfileDeletionRequestModelExtension on ProfileDeletionRequestModel {
  AccountDeletionRequest toProfileDeletionRequest() {
    return AccountDeletionRequest(
      id: id,
      status: status,
      reason: reason,
      requestedAt: requestedAt,
      processedAt: processedAt,
    );
  }
}
