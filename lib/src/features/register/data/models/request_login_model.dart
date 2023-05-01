import 'dart:io';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'request_login_model.g.dart';

@JsonSerializable()
class RequestEmployeeModel {
  @JsonKey(name: 'Username')
  int? username;
  @JsonKey(name: 'Password')
  String? password;

  RequestEmployeeModel({
    this.username,
    this.password,
  });

  factory RequestEmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$RequestLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestLoginModelToJson(this);
}
