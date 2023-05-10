import 'dart:io';

import 'package:apptester/src/features/profile/bloc/delete_profile/delete_profile_bloc.dart';
import 'package:apptester/src/features/profile/data/models/request_deleteprofile_model/request_deleteprofile_model.dart';
import 'package:apptester/src/features/profile/data/models/request_editprofile_model/request_editprofile_model.dart';
import 'package:apptester/src/features/profile/presentations/profile_Layout.dart';
import 'package:apptester/src/utils/string.dart';
import 'package:apptester/src/utils/user_secure__storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/user_shared_preferences.dart';
import '../../login/presentation/login_Screen.dart';
import '../bloc/picker_avartar_profile/picker_avartar_profile_bloc.dart';
import '../bloc/put_profile/put_profile_bloc.dart';
import '../data/repositories/profile_repositoryImpl.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileBloc = BlocProvider<PutProfileBloc>(
        create: (context) => PutProfileBloc(ProfileRepositoryimpl()));
    final Delete_ProfileBloc = BlocProvider<DeleteProfileBloc>(
        create: (context) => DeleteProfileBloc(ProfileRepositoryimpl()));
    final Avartar_PickerBloc = BlocProvider<PickerAvartarProfileBloc>(
        create: (context) => PickerAvartarProfileBloc());
    return MultiBlocProvider(
        providers: [EditProfileBloc, Delete_ProfileBloc, Avartar_PickerBloc],
        child: const ProfileLayout());
  }
}
