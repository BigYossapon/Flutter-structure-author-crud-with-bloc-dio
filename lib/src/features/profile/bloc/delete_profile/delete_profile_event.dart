part of 'delete_profile_bloc.dart';

abstract class DeleteProfileEvent extends Equatable {
  const DeleteProfileEvent();

  @override
  List<Object> get props => [];
}

class Delete_ProfileEvent extends DeleteProfileEvent {
  RequestDeleteProfileModel requestDeleteProfileModel;
  String id;
  Delete_ProfileEvent(this.requestDeleteProfileModel, this.id);

  @override
  List<Object> get props => [requestDeleteProfileModel, id];
}
