// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestRegisterModel _$RequestRegisterModelFromJson(
        Map<String, dynamic> json) =>
    RequestRegisterModel(
      username: json['username'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      avartar: json['avartar'] as String?,
    );

Map<String, dynamic> _$RequestRegisterModelToJson(
        RequestRegisterModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'address': instance.address,
      'country': instance.country,
      'avartar': instance.avartar,
    };
