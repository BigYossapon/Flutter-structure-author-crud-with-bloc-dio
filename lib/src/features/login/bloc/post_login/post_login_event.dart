part of 'post_login_bloc.dart';

abstract class PostLoginEvent extends Equatable {
  const PostLoginEvent();
}

class LoginEvent extends PostLoginEvent {
  @override
  // TODO: implement props
  RequestLoginModel requestLoginModel;

  LoginEvent(this.requestLoginModel);

  List<Object?> get props => [requestLoginModel];
}
