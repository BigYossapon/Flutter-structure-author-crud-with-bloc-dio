import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_login_event.dart';
part 'post_login_state.dart';

class PostLoginBloc extends Bloc<PostLoginEvent, PostLoginState> {
  PostLoginBloc() : super(PostLoginInitial()) {
    on<PostLoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
