import 'dart:io';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'response_getprofile_model.g.dart';

@JsonSerializable()
class ResponseGetProfileModel {
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

  ResponseGetProfileModel(
      {this.username, this.email, this.address, this.country, this.avartar});

  factory ResponseGetProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseGetProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseGetProfileModelToJson(this);
}
