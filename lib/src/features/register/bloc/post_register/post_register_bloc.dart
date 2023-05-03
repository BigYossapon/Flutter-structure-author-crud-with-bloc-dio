import 'package:apptester/src/features/register/data/models/request_register_model.dart/request_register_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/register_repository.dart';

part 'post_register_event.dart';
part 'post_register_state.dart';

class PostRegisterBloc extends Bloc<PostRegisterEvent, PostRegisterState> {
  final RegisterRepository _registerRepository;
  PostRegisterBloc(this._registerRepository)
      : super(PostRegisterLoadingState()) {
    on<RegisterEvent>((event, emit) async {
      // TODO: implement event handler
      emit(PostRegisterLoadingState());
      try {
        await _registerRepository.registerUser(event.requestRegisterModel);
        emit(PostRegisterSuccessState('Register Success'));
      } catch (e) {
        emit(PostRegisterErrorState(e.toString()));
      }
    });
  }
}
