part of 'picker_avartar_profile_bloc.dart';

abstract class PickerAvartarProfileEvent extends Equatable {
  const PickerAvartarProfileEvent();

  @override
  List<Object> get props => [];
}

class PickerAvartarEvent extends PickerAvartarProfileEvent {
  File? avartar;
  PickerAvartarEvent(this.avartar);
  @override
  List<Object> get props => [avartar!];
}
