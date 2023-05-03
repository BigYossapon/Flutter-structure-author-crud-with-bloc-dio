part of 'post_register_bloc.dart';

abstract class PostRegisterEvent extends Equatable {
  const PostRegisterEvent();
}

class RegisterEvent extends PostRegisterEvent {
  RequestRegisterModel requestRegisterModel;
  RegisterEvent(this.requestRegisterModel);
  @override
  // TODO: implement props

  List<Object?> get props => [requestRegisterModel];
}
