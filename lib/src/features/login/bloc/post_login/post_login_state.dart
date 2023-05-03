part of 'post_login_bloc.dart';

@immutable
abstract class PostLoginState extends Equatable {}

class PostLoginLoadingState extends PostLoginState {
  @override
  // TODO: implement props

  List<Object?> get props => [];
}

class PostLoginSuccessState extends PostLoginState {
  @override
  // TODO: implement props
  final ResponseLoginModel data;

  PostLoginSuccessState(this.data);
  List<Object?> get props => [data];
}

class PostLoginErrorState extends PostLoginState {
  @override
  // TODO: implement props
  late String status;
  PostLoginErrorState(this.status);

  List<Object?> get props => [status];
}
