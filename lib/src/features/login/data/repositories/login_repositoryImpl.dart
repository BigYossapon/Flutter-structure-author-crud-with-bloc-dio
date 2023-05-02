import 'dart:io';

import 'package:apptester/src/features/login/data/models/request_login_model/request_login_model.dart';
import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

import '../models/response_profilelogin_model/response_login_model.dart';
import '../services/remote/login_apiservice.dart';

import 'login_repository.dart';

@injectable
class LoginRepositoryimpl extends LoginRepository {
  late final LoginApiService _loginApiService;
  // Dio _dio;
  late final Dio _dio;

  LoginRepositoryimpl() {
    //_loginApiService = LoginApiClient().getService();
    _dio = Dio();
    _loginApiService = LoginApiService(_dio);

    // EmployeesApiService(_dio);
  }

  // @override
  // Future<List<ResponseLoginModel>> getEmployeeData() {
  //   // TODO: implement getEmployeeData
  //   return _loginApiService.loginUser();
  //   //throw UnimplementedError();
  // }

  @override
  Future<void> loginUser(RequestLoginModel requestLoginModel) {
    // TODO: implement postEmployeeData
    return _loginApiService.loginUser(requestLoginModel);

    //throw UnsupportedError;
  }
}
