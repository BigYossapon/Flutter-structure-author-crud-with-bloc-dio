// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseLoginModel _$ResponseLoginModelFromJson(Map<String, dynamic> json) =>
    ResponseLoginModel(
      username: json['username'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      avartar: json['avartar'] as String?,
    )..id = json['id'] as int?;

Map<String, dynamic> _$ResponseLoginModelToJson(ResponseLoginModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'address': instance.address,
      'country': instance.country,
      'avartar': instance.avartar,
    };
