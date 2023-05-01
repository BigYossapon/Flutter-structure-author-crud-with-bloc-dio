import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_profile_event.dart';
part 'delete_profile_state.dart';

class DeleteProfileBloc extends Bloc<DeleteProfileEvent, DeleteProfileState> {
  DeleteProfileBloc() : super(DeleteProfileInitial()) {
    on<DeleteProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
