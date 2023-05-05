import 'package:apptester/src/features/login/data/models/request_login_model/request_login_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../utils/user_secure__storage.dart';
import '../../data/models/response_profilelogin_model/response_login_model.dart';
import '../../data/repositories/login_repository.dart';

part 'post_login_event.dart';
part 'post_login_state.dart';

class PostLoginBloc extends Bloc<PostLoginEvent, PostLoginState> {
  final LoginRepository _loginRepository;
  PostLoginBloc(this._loginRepository) : super(PostLoginLoadingState()) {
    on<LoginEvent>((event, emit) async {
      // TODO: implement event handler
      emit(PostLoginLoadingState());
      try {
        final data = await _loginRepository.loginUser(event.requestLoginModel);
        final String? token = data.accessToken;
        await UserSecureStorage.setToken(token!);

        emit(PostLoginSuccessState(data));
      } catch (e) {
        emit(PostLoginErrorState(e.toString()));
      }
    });
  }
}
