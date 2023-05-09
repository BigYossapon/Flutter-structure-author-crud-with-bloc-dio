import 'dart:io';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'request_login_model.g.dart';

@JsonSerializable()
class RequestLoginModel {
  @JsonKey(name: 'username')
  String username;
  @JsonKey(name: 'password')
  String password;

  RequestLoginModel({
    required this.username,
    required this.password,
  });

  factory RequestLoginModel.fromJson(Map<String, dynamic> json) =>
      _$RequestLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestLoginModelToJson(this);
}
