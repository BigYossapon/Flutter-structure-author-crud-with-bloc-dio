import 'dart:io';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'request_deleteprofile_model.g.dart';

@JsonSerializable()
class RequestDeleteProfileModel {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'username')
  String? username;

  RequestDeleteProfileModel({
    this.username,
    this.id,
  });

  factory RequestDeleteProfileModel.fromJson(Map<String, dynamic> json) =>
      _$RequestDeleteProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestDeleteProfileModelToJson(this);
}
