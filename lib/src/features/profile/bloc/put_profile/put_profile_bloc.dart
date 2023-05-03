import 'package:apptester/src/features/profile/data/models/request_editprofile_model/request_editprofile_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/profile_repository.dart';

part 'put_profile_event.dart';
part 'put_profile_state.dart';

class PutProfileBloc extends Bloc<PutProfileEvent, PutProfileState> {
  final ProfileRepository _profileRepository;
  PutProfileBloc(this._profileRepository) : super(PutProfileEditingState()) {
    on<EditProfileEvent>((event, emit) async {
      // TODO: implement event handler
      //call token form secure storage

      emit(PutProfileEditingState());
      try {
        await _profileRepository.editProfile(
            token!, event.id, event.requestEditProfileModel);
      } catch (e) {
        emit(PutProfileEditErrorState(e.toString()));
      }
    });
  }
}
