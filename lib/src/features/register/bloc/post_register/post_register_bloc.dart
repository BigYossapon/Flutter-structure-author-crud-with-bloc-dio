import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_register_event.dart';
part 'post_register_state.dart';

class PostRegisterBloc extends Bloc<PostRegisterEvent, PostRegisterState> {
  PostRegisterBloc() : super(PostRegisterInitial()) {
    on<PostRegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
