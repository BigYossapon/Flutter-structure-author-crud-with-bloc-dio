import 'dart:io';

import 'package:apptester/src/features/login/data/models/request_login_model/request_login_model.dart';
import 'package:injectable/injectable.dart';

import '../models/request_register_model.dart/request_register_model.dart';

abstract class RegisterRepository {
  // Future<List<RequestModel>> getEmployeeData();

  Future<void> registerUser(RequestRegisterModel requestRegisterModel);
}
