import 'dart:io';

import 'package:apptester/src/features/login/data/models/request_login_model/request_login_model.dart';
import 'package:injectable/injectable.dart';

import '../models/request_deleteprofile_model/request_deleteprofile_model.dart';
import '../models/request_editprofile_model/request_editprofile_model.dart';

abstract class ProfileRepository {
  // Future<List<RequestModel>> getEmployeeData();

  Future<void> editProfile(
      String token, int id, RequestEditProfileModel requestEditProfileModel);

  Future<void> deleteProfile(String token, int id,
      RequestDeleteProfileModel requestDeleteProfileModel);
}
