// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archivement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArchivementModel _$ArchivementModelFromJson(Map<String, dynamic> json) =>
    _ArchivementModel(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      description: json['description'] as String,
      imagePath: json['image_path'] as String,
    );

Map<String, dynamic> _$ArchivementModelToJson(_ArchivementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'image_path': instance.imagePath,
    };
