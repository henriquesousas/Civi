import 'package:deehelp/business/user/usecases/get_profile/profile.dart';
import 'package:deehelp/infra/user/repositories/models/profile_archivement_model.dart';
import 'package:deehelp/infra/user/repositories/models/profile_deletion_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  factory ProfileModel({
    required String id,
    required String name,
    required String nickname,
    required String email,
    required String status,
    required String? phone,
    required String? bio,
    @JsonKey(name: "url_photo") required String urlPhoto,
    @JsonKey(name: "is_verified") required bool isVerified,
    @JsonKey(name: "is_admin") required bool isAdmin,
    @JsonKey(name: "total_alerts") required int totalAlerts,
    @JsonKey(name: "total_views") required int totalViews,
    @JsonKey(name: "total_comments") required int totalComments,
    required List<ProfileArchivementModel> archivements,
    @JsonKey(name: "account_deletion_request")
    required ProfileDeletionRequestModel? accountDeletionRequest,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

extension ProfileModelExtension on ProfileModel {
  Profile toProfile() {
    return Profile(
      id: id,
      name: name,
      nickname: nickname,
      email: email,
      phone: phone,
      urlPhoto: urlPhoto,
      bio: bio,
      isVerified: isVerified,
      isAdmin: isAdmin,
      status: status,
      totalAlerts: totalComments,
      totalViews: totalViews,
      totalComments: totalComments,
      archivements: archivements.map((e) => e.toArchivement()).toList(),
      accountDeletionRequest: accountDeletionRequest
          ?.toProfileDeletionRequest(),
    );
  }
}
