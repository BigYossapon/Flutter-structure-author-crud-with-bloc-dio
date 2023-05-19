// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_deleteprofile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestDeleteProfileModel _$RequestDeleteProfileModelFromJson(
        Map<String, dynamic> json) =>
    RequestDeleteProfileModel(
      username: json['username'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$RequestDeleteProfileModelToJson(
        RequestDeleteProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
    };
