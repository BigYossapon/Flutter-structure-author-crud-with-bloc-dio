import 'package:apptester/src/features/profile/data/models/request_deleteprofile_model/request_deleteprofile_model.dart';
import 'package:apptester/src/utils/user_secure__storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/profile_repository.dart';

part 'delete_profile_event.dart';
part 'delete_profile_state.dart';

class DeleteProfileBloc extends Bloc<DeleteProfileEvent, DeleteProfileState> {
  final ProfileRepository _profileRepository;
  DeleteProfileBloc(this._profileRepository) : super(DeletingProfileState()) {
    on<Delete_ProfileEvent>((event, emit) async {
      // TODO: implement event handler
      //call token form secure storage
      emit(DeletingProfileState());
      try {
        final token = await UserSecureStorage.getToken();
        await _profileRepository.deleteProfile(
            token!, event.id, event.requestDeleteProfileModel);

        emit(DeleteProfileSuccessState());
      } catch (e) {
        emit(DeleteProfileErrorState(e.toString()));
      }
    });
  }
}
