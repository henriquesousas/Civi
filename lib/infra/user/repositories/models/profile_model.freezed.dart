// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileModel {

 String get id; String get name; String get nickname; String get email; String get status; String? get phone; String? get bio;@JsonKey(name: "url_photo") String get urlPhoto;@JsonKey(name: "is_verified") bool get isVerified;@JsonKey(name: "is_admin") bool get isAdmin;@JsonKey(name: "total_alerts") int get totalAlerts;@JsonKey(name: "total_views") int get totalViews;@JsonKey(name: "total_comments") int get totalComments; List<ProfileArchivementModel> get archivements;@JsonKey(name: "account_deletion_request") ProfileDeletionRequestModel? get accountDeletionRequest;
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<ProfileModel> get copyWith => _$ProfileModelCopyWithImpl<ProfileModel>(this as ProfileModel, _$identity);

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.email, email) || other.email == email)&&(identical(other.status, status) || other.status == status)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.urlPhoto, urlPhoto) || other.urlPhoto == urlPhoto)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin)&&(identical(other.totalAlerts, totalAlerts) || other.totalAlerts == totalAlerts)&&(identical(other.totalViews, totalViews) || other.totalViews == totalViews)&&(identical(other.totalComments, totalComments) || other.totalComments == totalComments)&&const DeepCollectionEquality().equals(other.archivements, archivements)&&(identical(other.accountDeletionRequest, accountDeletionRequest) || other.accountDeletionRequest == accountDeletionRequest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nickname,email,status,phone,bio,urlPhoto,isVerified,isAdmin,totalAlerts,totalViews,totalComments,const DeepCollectionEquality().hash(archivements),accountDeletionRequest);

@override
String toString() {
  return 'ProfileModel(id: $id, name: $name, nickname: $nickname, email: $email, status: $status, phone: $phone, bio: $bio, urlPhoto: $urlPhoto, isVerified: $isVerified, isAdmin: $isAdmin, totalAlerts: $totalAlerts, totalViews: $totalViews, totalComments: $totalComments, archivements: $archivements, accountDeletionRequest: $accountDeletionRequest)';
}


}

/// @nodoc
abstract mixin class $ProfileModelCopyWith<$Res>  {
  factory $ProfileModelCopyWith(ProfileModel value, $Res Function(ProfileModel) _then) = _$ProfileModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String nickname, String email, String status, String? phone, String? bio,@JsonKey(name: "url_photo") String urlPhoto,@JsonKey(name: "is_verified") bool isVerified,@JsonKey(name: "is_admin") bool isAdmin,@JsonKey(name: "total_alerts") int totalAlerts,@JsonKey(name: "total_views") int totalViews,@JsonKey(name: "total_comments") int totalComments, List<ProfileArchivementModel> archivements,@JsonKey(name: "account_deletion_request") ProfileDeletionRequestModel? accountDeletionRequest
});


$ProfileDeletionRequestModelCopyWith<$Res>? get accountDeletionRequest;

}
/// @nodoc
class _$ProfileModelCopyWithImpl<$Res>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._self, this._then);

  final ProfileModel _self;
  final $Res Function(ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? nickname = null,Object? email = null,Object? status = null,Object? phone = freezed,Object? bio = freezed,Object? urlPhoto = null,Object? isVerified = null,Object? isAdmin = null,Object? totalAlerts = null,Object? totalViews = null,Object? totalComments = null,Object? archivements = null,Object? accountDeletionRequest = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,urlPhoto: null == urlPhoto ? _self.urlPhoto : urlPhoto // ignore: cast_nullable_to_non_nullable
as String,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,totalAlerts: null == totalAlerts ? _self.totalAlerts : totalAlerts // ignore: cast_nullable_to_non_nullable
as int,totalViews: null == totalViews ? _self.totalViews : totalViews // ignore: cast_nullable_to_non_nullable
as int,totalComments: null == totalComments ? _self.totalComments : totalComments // ignore: cast_nullable_to_non_nullable
as int,archivements: null == archivements ? _self.archivements : archivements // ignore: cast_nullable_to_non_nullable
as List<ProfileArchivementModel>,accountDeletionRequest: freezed == accountDeletionRequest ? _self.accountDeletionRequest : accountDeletionRequest // ignore: cast_nullable_to_non_nullable
as ProfileDeletionRequestModel?,
  ));
}
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileDeletionRequestModelCopyWith<$Res>? get accountDeletionRequest {
    if (_self.accountDeletionRequest == null) {
    return null;
  }

  return $ProfileDeletionRequestModelCopyWith<$Res>(_self.accountDeletionRequest!, (value) {
    return _then(_self.copyWith(accountDeletionRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileModel].
extension ProfileModelPatterns on ProfileModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String nickname,  String email,  String status,  String? phone,  String? bio, @JsonKey(name: "url_photo")  String urlPhoto, @JsonKey(name: "is_verified")  bool isVerified, @JsonKey(name: "is_admin")  bool isAdmin, @JsonKey(name: "total_alerts")  int totalAlerts, @JsonKey(name: "total_views")  int totalViews, @JsonKey(name: "total_comments")  int totalComments,  List<ProfileArchivementModel> archivements, @JsonKey(name: "account_deletion_request")  ProfileDeletionRequestModel? accountDeletionRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.id,_that.name,_that.nickname,_that.email,_that.status,_that.phone,_that.bio,_that.urlPhoto,_that.isVerified,_that.isAdmin,_that.totalAlerts,_that.totalViews,_that.totalComments,_that.archivements,_that.accountDeletionRequest);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String nickname,  String email,  String status,  String? phone,  String? bio, @JsonKey(name: "url_photo")  String urlPhoto, @JsonKey(name: "is_verified")  bool isVerified, @JsonKey(name: "is_admin")  bool isAdmin, @JsonKey(name: "total_alerts")  int totalAlerts, @JsonKey(name: "total_views")  int totalViews, @JsonKey(name: "total_comments")  int totalComments,  List<ProfileArchivementModel> archivements, @JsonKey(name: "account_deletion_request")  ProfileDeletionRequestModel? accountDeletionRequest)  $default,) {final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that.id,_that.name,_that.nickname,_that.email,_that.status,_that.phone,_that.bio,_that.urlPhoto,_that.isVerified,_that.isAdmin,_that.totalAlerts,_that.totalViews,_that.totalComments,_that.archivements,_that.accountDeletionRequest);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String nickname,  String email,  String status,  String? phone,  String? bio, @JsonKey(name: "url_photo")  String urlPhoto, @JsonKey(name: "is_verified")  bool isVerified, @JsonKey(name: "is_admin")  bool isAdmin, @JsonKey(name: "total_alerts")  int totalAlerts, @JsonKey(name: "total_views")  int totalViews, @JsonKey(name: "total_comments")  int totalComments,  List<ProfileArchivementModel> archivements, @JsonKey(name: "account_deletion_request")  ProfileDeletionRequestModel? accountDeletionRequest)?  $default,) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.id,_that.name,_that.nickname,_that.email,_that.status,_that.phone,_that.bio,_that.urlPhoto,_that.isVerified,_that.isAdmin,_that.totalAlerts,_that.totalViews,_that.totalComments,_that.archivements,_that.accountDeletionRequest);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileModel implements ProfileModel {
   _ProfileModel({required this.id, required this.name, required this.nickname, required this.email, required this.status, required this.phone, required this.bio, @JsonKey(name: "url_photo") required this.urlPhoto, @JsonKey(name: "is_verified") required this.isVerified, @JsonKey(name: "is_admin") required this.isAdmin, @JsonKey(name: "total_alerts") required this.totalAlerts, @JsonKey(name: "total_views") required this.totalViews, @JsonKey(name: "total_comments") required this.totalComments, required final  List<ProfileArchivementModel> archivements, @JsonKey(name: "account_deletion_request") required this.accountDeletionRequest}): _archivements = archivements;
  factory _ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String nickname;
@override final  String email;
@override final  String status;
@override final  String? phone;
@override final  String? bio;
@override@JsonKey(name: "url_photo") final  String urlPhoto;
@override@JsonKey(name: "is_verified") final  bool isVerified;
@override@JsonKey(name: "is_admin") final  bool isAdmin;
@override@JsonKey(name: "total_alerts") final  int totalAlerts;
@override@JsonKey(name: "total_views") final  int totalViews;
@override@JsonKey(name: "total_comments") final  int totalComments;
 final  List<ProfileArchivementModel> _archivements;
@override List<ProfileArchivementModel> get archivements {
  if (_archivements is EqualUnmodifiableListView) return _archivements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_archivements);
}

@override@JsonKey(name: "account_deletion_request") final  ProfileDeletionRequestModel? accountDeletionRequest;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileModelCopyWith<_ProfileModel> get copyWith => __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.email, email) || other.email == email)&&(identical(other.status, status) || other.status == status)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.urlPhoto, urlPhoto) || other.urlPhoto == urlPhoto)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin)&&(identical(other.totalAlerts, totalAlerts) || other.totalAlerts == totalAlerts)&&(identical(other.totalViews, totalViews) || other.totalViews == totalViews)&&(identical(other.totalComments, totalComments) || other.totalComments == totalComments)&&const DeepCollectionEquality().equals(other._archivements, _archivements)&&(identical(other.accountDeletionRequest, accountDeletionRequest) || other.accountDeletionRequest == accountDeletionRequest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nickname,email,status,phone,bio,urlPhoto,isVerified,isAdmin,totalAlerts,totalViews,totalComments,const DeepCollectionEquality().hash(_archivements),accountDeletionRequest);

@override
String toString() {
  return 'ProfileModel(id: $id, name: $name, nickname: $nickname, email: $email, status: $status, phone: $phone, bio: $bio, urlPhoto: $urlPhoto, isVerified: $isVerified, isAdmin: $isAdmin, totalAlerts: $totalAlerts, totalViews: $totalViews, totalComments: $totalComments, archivements: $archivements, accountDeletionRequest: $accountDeletionRequest)';
}


}

/// @nodoc
abstract mixin class _$ProfileModelCopyWith<$Res> implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(_ProfileModel value, $Res Function(_ProfileModel) _then) = __$ProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String nickname, String email, String status, String? phone, String? bio,@JsonKey(name: "url_photo") String urlPhoto,@JsonKey(name: "is_verified") bool isVerified,@JsonKey(name: "is_admin") bool isAdmin,@JsonKey(name: "total_alerts") int totalAlerts,@JsonKey(name: "total_views") int totalViews,@JsonKey(name: "total_comments") int totalComments, List<ProfileArchivementModel> archivements,@JsonKey(name: "account_deletion_request") ProfileDeletionRequestModel? accountDeletionRequest
});


@override $ProfileDeletionRequestModelCopyWith<$Res>? get accountDeletionRequest;

}
/// @nodoc
class __$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(this._self, this._then);

  final _ProfileModel _self;
  final $Res Function(_ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nickname = null,Object? email = null,Object? status = null,Object? phone = freezed,Object? bio = freezed,Object? urlPhoto = null,Object? isVerified = null,Object? isAdmin = null,Object? totalAlerts = null,Object? totalViews = null,Object? totalComments = null,Object? archivements = null,Object? accountDeletionRequest = freezed,}) {
  return _then(_ProfileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,urlPhoto: null == urlPhoto ? _self.urlPhoto : urlPhoto // ignore: cast_nullable_to_non_nullable
as String,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,totalAlerts: null == totalAlerts ? _self.totalAlerts : totalAlerts // ignore: cast_nullable_to_non_nullable
as int,totalViews: null == totalViews ? _self.totalViews : totalViews // ignore: cast_nullable_to_non_nullable
as int,totalComments: null == totalComments ? _self.totalComments : totalComments // ignore: cast_nullable_to_non_nullable
as int,archivements: null == archivements ? _self._archivements : archivements // ignore: cast_nullable_to_non_nullable
as List<ProfileArchivementModel>,accountDeletionRequest: freezed == accountDeletionRequest ? _self.accountDeletionRequest : accountDeletionRequest // ignore: cast_nullable_to_non_nullable
as ProfileDeletionRequestModel?,
  ));
}

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileDeletionRequestModelCopyWith<$Res>? get accountDeletionRequest {
    if (_self.accountDeletionRequest == null) {
    return null;
  }

  return $ProfileDeletionRequestModelCopyWith<$Res>(_self.accountDeletionRequest!, (value) {
    return _then(_self.copyWith(accountDeletionRequest: value));
  });
}
}

// dart format on
