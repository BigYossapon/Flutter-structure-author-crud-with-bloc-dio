import 'package:apptester/src/features/login/presentation/login_Layout.dart';
import 'package:apptester/src/features/register/presentation/register_Screen.dart';
import 'package:apptester/src/utils/user_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/user_secure__storage.dart';
import '../../home/presentations/home_Screen.dart';
import '../bloc/post_login/post_login_bloc.dart';
import '../data/models/request_login_model/request_login_model.dart';
import '../data/repositories/login_repositoryImpl.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider<PostLoginBloc>(
        create: (context) => PostLoginBloc(LoginRepositoryimpl()));
    return MultiBlocProvider(
      providers: [loginBloc],
      child: const LoginLayout(),
    );
  }
}
