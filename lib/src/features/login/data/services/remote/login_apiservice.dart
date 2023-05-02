import 'dart:convert';
import 'dart:io';
import 'package:apptester/src/features/login/data/models/response_profilelogin_model/response_login_model.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

import '../../models/request_login_model/request_login_model.dart';

part 'login_apiservice.g.dart';

@RestApi(baseUrl: 'http://192.168.1.102:8080/')
abstract class LoginApiService {
  factory LoginApiService(Dio dio, {String? baseUrl}) = _LoginApiService;

  // @GET('user/get')
  // Future<ResponseLoginModel> getUserdataformUsername();

  @POST('user/login')
  Future<void> loginUser(@Body() RequestLoginModel requestLoginModel);
}
