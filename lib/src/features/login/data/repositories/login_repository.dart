import 'dart:io';

import 'package:apptester/src/features/login/data/models/request_login_model/request_login_model.dart';
import 'package:injectable/injectable.dart';

import '../models/response_profilelogin_model/response_login_model.dart';

abstract class LoginRepository {
  // Future<List<RequestModel>> getEmployeeData();

  Future<ResponseLoginModel> loginUser(RequestLoginModel requestLoginModel);
}
