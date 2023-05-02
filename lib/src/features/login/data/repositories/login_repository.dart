import 'dart:io';

import 'package:apptester/src/features/login/data/models/request_login_model/request_login_model.dart';
import 'package:injectable/injectable.dart';

abstract class LoginRepository {
  // Future<List<RequestModel>> getEmployeeData();

  Future<void> loginUser(RequestLoginModel requestLoginModel);
}
