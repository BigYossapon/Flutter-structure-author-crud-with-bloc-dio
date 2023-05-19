import 'dart:io';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'request_register_model.g.dart';

@JsonSerializable()
class RequestRegisterModel {
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'country')
  String? country;
  @JsonKey(name: 'avartar')
  String? avartar;

  RequestRegisterModel(
      {this.username,
      this.password,
      this.email,
      this.address,
      this.country,
      this.avartar});

  factory RequestRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RequestRegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestRegisterModelToJson(this);
}
