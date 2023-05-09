// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestLoginModel _$RequestLoginModelFromJson(Map<String, dynamic> json) =>
    RequestLoginModel(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RequestLoginModelToJson(RequestLoginModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
