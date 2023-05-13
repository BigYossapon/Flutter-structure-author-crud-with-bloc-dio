import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'picker_avartar_profile_event.dart';
part 'picker_avartar_profile_state.dart';

class PickerAvartarProfileBloc
    extends Bloc<PickerAvartarProfileEvent, PickerAvartarProfileState> {
  PickerAvartarProfileBloc() : super(PickingAvartarProfileState()) {
    on<PickerAvartarEvent>((event, emit) {
      // TODO: implement event handler
      emit(PickingAvartarProfileState());
      if (event.avartar != null) {
        File? avartar = event.avartar;
        emit(PickedAvartarProfileState(avartar!));
      } else {
        emit(PickErrorAvartarProfileState('Cannot Picker Avartar!'));
      }
    });
  }
}
