import 'dart:io';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'response_login_model.g.dart';

@JsonSerializable()
class ResponseLoginModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'country')
  String? country;
  @JsonKey(name: 'avartar')
  String? avartar;

  ResponseLoginModel(
      {this.username, this.email, this.address, this.country, this.avartar});

  factory ResponseLoginModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseLoginModelToJson(this);
}
