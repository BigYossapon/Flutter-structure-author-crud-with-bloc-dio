import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/request_deleteprofile_model/request_deleteprofile_model.dart';
import '../../models/request_editprofile_model/request_editprofile_model.dart';

part 'profile_apiservice.g.dart';

@RestApi(baseUrl: 'http://192.168.1.102:8080/')
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio, {String? baseUrl}) = _ProfileApiService;

  // @GET('user/get')
  // Future<ResponseLoginModel> getUserdataformUsername();
  //EDIT query
  // @PUT('user/edit/')
  // Future<void> editUser(
  //     @Header('Authorization') String token,
  //     @Query("username") String username,
  //     @Body() RequestEditProfileModel requestEditProfileModel);

  @PUT('user/edit/{id}')
  Future<void> editProfile(
      @Header('Authorization') String token,
      @Path("id") int id,
      @Body() RequestEditProfileModel requestEditProfileModel);

  //DELETE
  @DELETE('user/delete/{id}')
  Future<void> deleteProfile(
      @Header('Authorization') String token,
      @Path() int id,
      @Body() RequestDeleteProfileModel requestDeleteProfileModel);
}
