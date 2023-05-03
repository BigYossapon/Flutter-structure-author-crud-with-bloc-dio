part of 'put_profile_bloc.dart';

abstract class PutProfileState extends Equatable {
  const PutProfileState();
}

class PutProfileEditingState extends PutProfileState {
  @override
  List<Object> get props => [];
}

class PutProfileEditSuccessState extends PutProfileState {
  @override
  List<Object> get props => [];
}

class PutProfileEditErrorState extends PutProfileState {
  late String status;
  PutProfileEditErrorState(this.status);
  @override
  List<Object> get props => [status];
}
