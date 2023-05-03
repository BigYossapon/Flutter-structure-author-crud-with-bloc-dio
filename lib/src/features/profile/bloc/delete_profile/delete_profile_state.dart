part of 'delete_profile_bloc.dart';

abstract class DeleteProfileState extends Equatable {
  const DeleteProfileState();

  @override
  List<Object> get props => [];
}

class DeletingProfileState extends DeleteProfileState {
  @override
  List<Object> get props => [];
}

class DeleteProfileSuccessState extends DeleteProfileState {
  @override
  List<Object> get props => [];
}

class DeleteProfileErrorState extends DeleteProfileState {
  late String status;
  DeleteProfileErrorState(this.status);
  @override
  List<Object> get props => [status];
}
