part of 'put_profile_bloc.dart';

abstract class PutProfileEvent extends Equatable {
  const PutProfileEvent();

  @override
  List<Object> get props => [];
}

class EditProfileEvent extends PutProfileEvent {
  RequestEditProfileModel requestEditProfileModel;
  String id;
  EditProfileEvent(this.requestEditProfileModel, this.id);
  @override
  List<Object> get props => [];
}
