import 'dart:io';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'response_login_model.g.dart';

@JsonSerializable()
class ResponseLoginModel {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'username')
  String username;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'address')
  String address;
  @JsonKey(name: 'country')
  String country;
  @JsonKey(name: 'avartar')
  String avartar;
  @JsonKey(name: 'roles')
  List<String> roles;
  @JsonKey(name: 'accessToken')
  String accessToken;

  ResponseLoginModel(
      {required this.id,
      required this.username,
      required this.email,
      required this.address,
      required this.country,
      required this.avartar,
      required this.roles,
      required this.accessToken});

  factory ResponseLoginModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseLoginModelToJson(this);
}
