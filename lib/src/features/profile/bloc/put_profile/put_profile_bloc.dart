import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'put_profile_event.dart';
part 'put_profile_state.dart';

class PutProfileBloc extends Bloc<PutProfileEvent, PutProfileState> {
  PutProfileBloc() : super(PutProfileInitial()) {
    on<PutProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
