// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      id: json['id'] as String,
      name: json['name'] as String,
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      status: json['status'] as String,
      phone: json['phone'] as String?,
      bio: json['bio'] as String?,
      urlPhoto: json['url_photo'] as String,
      isVerified: json['is_verified'] as bool,
      isAdmin: json['is_admin'] as bool,
      totalAlerts: (json['total_alerts'] as num).toInt(),
      totalViews: (json['total_views'] as num).toInt(),
      totalComments: (json['total_comments'] as num).toInt(),
      archivements: (json['archivements'] as List<dynamic>)
          .map(
            (e) => ProfileArchivementModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      accountDeletionRequest: json['account_deletion_request'] == null
          ? null
          : ProfileDeletionRequestModel.fromJson(
              json['account_deletion_request'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nickname': instance.nickname,
      'email': instance.email,
      'status': instance.status,
      'phone': instance.phone,
      'bio': instance.bio,
      'url_photo': instance.urlPhoto,
      'is_verified': instance.isVerified,
      'is_admin': instance.isAdmin,
      'total_alerts': instance.totalAlerts,
      'total_views': instance.totalViews,
      'total_comments': instance.totalComments,
      'archivements': instance.archivements,
      'account_deletion_request': instance.accountDeletionRequest,
    };
