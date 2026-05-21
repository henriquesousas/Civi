import 'package:deehelp/business/archivement/archivement.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'archivement_model.freezed.dart';
part 'archivement_model.g.dart';

@freezed
abstract class ArchivementModel with _$ArchivementModel {
  factory ArchivementModel({
    required String id,
    required String name,
    required String code,
    required String description,
    @JsonKey(name: 'image_path') required String imagePath,
  }) = _ArchivementModel;

  factory ArchivementModel.fromJson(Map<String, dynamic> json) =>
      _$ArchivementModelFromJson(json);
}

extension ArchivementModelExtension on ArchivementModel {
  Archivement toArchivement() {
    return Archivement(
      id: id,
      name: name,
      code: code,
      description: description,
      imagePath: imagePath,
    );
  }
}
