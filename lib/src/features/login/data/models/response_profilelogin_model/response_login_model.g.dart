// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseLoginModel _$ResponseLoginModelFromJson(Map<String, dynamic> json) =>
    ResponseLoginModel(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      country: json['country'] as String,
      avartar: json['avartar'] as String,
      roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$ResponseLoginModelToJson(ResponseLoginModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'address': instance.address,
      'country': instance.country,
      'avartar': instance.avartar,
      'roles': instance.roles,
      'accessToken': instance.accessToken,
    };
