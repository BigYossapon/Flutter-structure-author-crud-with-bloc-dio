// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_getprofile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetProfileModel _$ResponseGetProfileModelFromJson(
        Map<String, dynamic> json) =>
    ResponseGetProfileModel(
      username: json['username'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      avartar: json['avartar'] as String?,
    );

Map<String, dynamic> _$ResponseGetProfileModelToJson(
        ResponseGetProfileModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'address': instance.address,
      'country': instance.country,
      'avartar': instance.avartar,
    };
