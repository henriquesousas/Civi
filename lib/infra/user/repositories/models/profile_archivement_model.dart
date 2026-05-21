import 'package:deehelp/business/user/usecases/get_profile/archivement.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_archivement_model.freezed.dart';
part 'profile_archivement_model.g.dart';

@freezed
abstract class ProfileArchivementModel with _$ProfileArchivementModel {
  factory ProfileArchivementModel({
    required String code,
    required String name,
  }) = _ProfileArchivementModel;

  factory ProfileArchivementModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileArchivementModelFromJson(json);
}

extension ProfileArchivementModelExtension on ProfileArchivementModel {
  Archivement toArchivement() {
    return Archivement(code: code, name: name);
  }
}
