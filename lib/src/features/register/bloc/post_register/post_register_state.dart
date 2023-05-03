part of 'post_register_bloc.dart';

abstract class PostRegisterState extends Equatable {}

class PostRegisterLoadingState extends PostRegisterState {
  @override
  List<Object?> get props => [];
}

class PostRegisterSuccessState extends PostRegisterState {
  late String status;
  PostRegisterSuccessState(this.status);
  @override
  List<Object?> get props => [status];
}

class PostRegisterErrorState extends PostRegisterState {
  late String status;
  PostRegisterErrorState(this.status);
  @override
  List<Object?> get props => [status];
}
