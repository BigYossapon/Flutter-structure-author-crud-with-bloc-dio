import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/request_register_model.dart/request_register_model.dart';

part 'register_apiservice.g.dart';

@RestApi(baseUrl: 'http://192.168.1.102:8080/')
abstract class RegisterApiService {
  factory RegisterApiService(Dio dio, {String? baseUrl}) = _RegisterApiService;

  // @GET('user/get')
  // Future<ResponseLoginModel> getUserdataformUsername();

  @POST('user/register')
  Future<void> registerUser(@Body() RequestRegisterModel requestRegisterModel);
}
