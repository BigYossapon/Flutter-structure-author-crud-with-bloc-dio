// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestEmployeeModel _$RequestEmployeeModelFromJson(
        Map<String, dynamic> json) =>
    RequestEmployeeModel(
      username: json['Username'] as int?,
      password: json['Password'] as String?,
    );

Map<String, dynamic> _$RequestEmployeeModelToJson(
        RequestEmployeeModel instance) =>
    <String, dynamic>{
      'Username': instance.username,
      'Password': instance.password,
    };
