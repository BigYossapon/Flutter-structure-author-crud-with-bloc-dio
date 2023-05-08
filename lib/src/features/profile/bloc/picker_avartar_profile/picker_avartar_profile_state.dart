part of 'picker_avartar_profile_bloc.dart';

abstract class PickerAvartarProfileState extends Equatable {
  const PickerAvartarProfileState();

  @override
  List<Object> get props => [];
}

class PickingAvartarProfileState extends PickerAvartarProfileState {
  @override
  List<Object> get props => [];
}

class PickedAvartarProfileState extends PickerAvartarProfileState {
  File avartar;
  PickedAvartarProfileState(this.avartar);
  @override
  List<Object> get props => [avartar];
}

class PickErrorAvartarProfileState extends PickerAvartarProfileState {
  String status;
  PickErrorAvartarProfileState(this.status);
  @override
  List<Object> get props => [status];
}
