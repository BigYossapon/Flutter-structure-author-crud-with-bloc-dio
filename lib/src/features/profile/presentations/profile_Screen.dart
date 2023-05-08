import 'dart:io';

import 'package:apptester/src/features/profile/bloc/delete_profile/delete_profile_bloc.dart';
import 'package:apptester/src/features/profile/data/models/request_deleteprofile_model/request_deleteprofile_model.dart';
import 'package:apptester/src/features/profile/data/models/request_editprofile_model/request_editprofile_model.dart';
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

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final address = TextEditingController();
  final country = TextEditingController();
  late String? avartar;
  late File? f_avartar;
  late RequestDeleteProfileModel requestDeleteProfileModel;
  late RequestEditProfileModel requestEditProfileModel;

  //final avartar = TextEditingController();
  @override
  void dispose() {
    username.dispose(); // ยกเลิกการใช้งานที่เกี่ยวข้องทั้งหมดถ้ามี
    password.dispose();
    email.dispose();
    address.dispose();
    country.dispose();
    f_avartar!.delete();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    username.text = UserSharedPreferences.getUsername();
    email.text = UserSharedPreferences.getEmail();
    address.text = UserSharedPreferences.getAddress();
    country.text = UserSharedPreferences.getCountry();
    avartar = UserSharedPreferences.getAvartar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //set form sharepref
    final EditProfileBloc = BlocProvider<PutProfileBloc>(
        create: (context) => PutProfileBloc(ProfileRepositoryimpl()));
    final Delete_ProfileBloc = BlocProvider<DeleteProfileBloc>(
        create: (context) => DeleteProfileBloc(ProfileRepositoryimpl()));
    final Avartar_PickerBloc = BlocProvider<PickerAvartarProfileBloc>(
        create: (context) => PickerAvartarProfileBloc());

    return MultiBlocProvider(
      providers: [EditProfileBloc, Delete_ProfileBloc, Avartar_PickerBloc],
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 5.0,
              ),
              BlocListener<PickerAvartarProfileBloc, PickerAvartarProfileState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is PickingAvartarProfileState) {
                    _Loading(context);
                  }
                  if (state is PickedAvartarProfileState) {
                    f_avartar = state.avartar;
                    //avartar = f_avartar!.path;
                    Navigator.of(context).pop();
                    final snackBar =
                        SnackBar(content: Text('Upload Avartar Success!'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  if (state is PickErrorAvartarProfileState) {
                    Navigator.of(context).pop();
                    final snackBar = SnackBar(content: Text(state.status));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Container(
                    child: f_avartar == null
                        ? SizedBox(
                            height: 150,
                            width: 150,
                            child:
                                Image.network(AppStrings.avartarUrl + avartar!),
                          )
                        : SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.file(f_avartar!),
                          )),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      //TODO FORGOT PASSWORD SCREEN GOES HERE
                    },
                    child: const Text(
                      'Upload Avartar from Gallery',
                      style: TextStyle(color: Colors.blue, fontSize: 10),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //TODO FORGOT PASSWORD SCREEN GOES HERE
                    },
                    child: const Text(
                      'Upload Avartar from Camera',
                      style: TextStyle(color: Colors.blue, fontSize: 10),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  readOnly: true,
                  enabled: false,
                  textAlignVertical: TextAlignVertical.center,
                  controller: username,
                  validator: (value) =>
                      value!.isEmpty ? 'Input cannot be empty!' : null,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      // เมื่อ focus
                      borderSide: BorderSide(width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      // สถานะปกติ
                      borderSide: BorderSide(width: 1.0), // กำหนดสีในนี้ได้
                    ),
                    labelText: 'Username',
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: password,
                  validator: (value) =>
                      value!.isEmpty ? 'Input cannot be empty!' : null,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      // เมื่อ focus
                      borderSide: BorderSide(width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      // สถานะปกติ
                      borderSide: BorderSide(width: 1.0), // กำหนดสีในนี้ได้
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  readOnly: true,
                  enabled: false,
                  textAlignVertical: TextAlignVertical.center,
                  controller: email,
                  validator: (value) =>
                      value!.isEmpty ? 'Input cannot be empty!' : null,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      // เมื่อ focus
                      borderSide: BorderSide(width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      // สถานะปกติ
                      borderSide: BorderSide(width: 1.0), // กำหนดสีในนี้ได้
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: address,
                  validator: (value) =>
                      value!.isEmpty ? 'Input cannot be empty!' : null,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      // เมื่อ focus
                      borderSide: BorderSide(width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      // สถานะปกติ
                      borderSide: BorderSide(width: 1.0), // กำหนดสีในนี้ได้
                    ),
                    labelText: 'Address',
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: country,
                  validator: (value) =>
                      value!.isEmpty ? 'Input cannot be empty!' : null,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      // เมื่อ focus
                      borderSide: BorderSide(width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      // สถานะปกติ
                      borderSide: BorderSide(width: 1.0), // กำหนดสีในนี้ได้
                    ),
                    labelText: 'Country',
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              BlocListener<PutProfileBloc, PutProfileState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is PutProfileEditingState) {
                    _Loading(context);
                  }
                  if (state is PutProfileEditSuccessState) {
                    Navigator.of(context).pop();
                    final snackBar =
                        SnackBar(content: Text('Edit Profile Success!'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  if (state is PutProfileEditErrorState) {
                    Navigator.of(context).pop();
                    final snackBar = SnackBar(content: Text(state.status));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        print('Form Complete');
                        _formKey.currentState!.save();
                        int id = UserSharedPreferences.getId();
                        _dialogEdit(
                            context,
                            requestEditProfileModel,
                            username.text,
                            password.text,
                            address.text,
                            avartar!,
                            country.text,
                            email.text);
                      }
                    },
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              Container(
                height: 5,
              ),
              BlocListener<DeleteProfileBloc, DeleteProfileState>(
                listener: (context, state) async {
                  // TODO: implement listener
                  if (state is DeletingProfileState) {
                    _Loading(context);
                  }
                  if (state is DeleteProfileSuccessState) {
                    Navigator.of(context).pop();
                    final snackBar =
                        SnackBar(content: Text('Delete Profile Success!'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    await UserSecureStorage.setToken("");
                    UserSharedPreferences.setAddress("");
                    UserSharedPreferences.setUsername("");
                    UserSharedPreferences.setAvartar("");
                    UserSharedPreferences.setCountry("");
                    UserSharedPreferences.setEmail("");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  }
                  if (state is DeleteProfileErrorState) {
                    Navigator.of(context).pop();
                    final snackBar = SnackBar(content: Text(state.status));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () async {
                      _dialogDelete(context, requestDeleteProfileModel);
                    },
                    child: const Text(
                      'Delete Profile',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              Container(
                height: 5,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () async {
                    _dialoglogout(context);
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _Loading(BuildContext context) async {
  // show the loading dialog
  showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
          // The background color
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                // The loading indicator
                CircularProgressIndicator(),
                SizedBox(
                  height: 15,
                ),
                // Some text
                Text('Loading...')
              ],
            ),
          ),
        );
      });
}

void _dialoglogout(BuildContext context) {
  showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Logout'),
            content: const Text('Comfirm to Logout?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () async {
                    await UserSecureStorage.setToken("");
                    UserSharedPreferences.setAddress("");
                    UserSharedPreferences.setUsername("");
                    UserSharedPreferences.setAvartar("");
                    UserSharedPreferences.setCountry("");
                    UserSharedPreferences.setEmail("");
                    //UserSharedPreferences.password("");
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text('Confirm'))
            ],
          ));
}

void _dialogDelete(
    BuildContext context, RequestDeleteProfileModel requestDeleteProfileModel) {
  showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Delete'),
            content: const Text('Comfirm to Delete Account?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () async {
                    int id = UserSharedPreferences.getId();
                    requestDeleteProfileModel.id = id;
                    requestDeleteProfileModel.username =
                        UserSharedPreferences.getUsername();
                    Navigator.pop(context);
                    context.read<DeleteProfileBloc>().add(
                        Delete_ProfileEvent(requestDeleteProfileModel, id));
                  },
                  child: const Text('Confirm'))
            ],
          ));
}

void _dialogEdit(
    BuildContext context,
    RequestEditProfileModel requestEditProfileModel,
    String username,
    String password,
    String address,
    String avartar,
    String country,
    String email) {
  showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Register'),
            content: const Text('Comfirm to Register?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () async {
                    requestEditProfileModel.username = username;
                    requestEditProfileModel.password = password;
                    requestEditProfileModel.address = address;
                    requestEditProfileModel.avartar = avartar;
                    requestEditProfileModel.country = country;
                    requestEditProfileModel.email = email;
                    int id = UserSharedPreferences.getId();
                    Navigator.pop(context);
                    context
                        .read<PutProfileBloc>()
                        .add(EditProfileEvent(requestEditProfileModel, id));
                  },
                  child: const Text('Confirm'))
            ],
          ));
}

Future requestCameraPermission(BuildContext buildContext) async {
  /// status can either be: granted, denied, restricted or permanentlyDenied
  var status = await Permission.camera.status;
  if (status.isGranted) {
    print("Permission is granted");
    pickAvartar(ImageSource.camera, buildContext);
  } else if (status.isDenied) {
    // We didn't ask for permission yet or the permission has been denied before but not permanently.
    if (await Permission.camera.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      print("Permission was granted");
    }
  }
}

Future requestGalleryPermission(BuildContext buildContext) async {
  /// status can either be: granted, denied, restricted or permanentlyDenied
  var status = await Permission.storage.status;
  if (status.isGranted) {
    print("Permission is granted");
    pickAvartar(ImageSource.gallery, buildContext);
  } else if (status.isDenied) {
    // We didn't ask for permission yet or the permission has been denied before but not permanently.
    if (await Permission.storage.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      print("Permission was granted");
    }
  }
}

Future pickAvartar(ImageSource imageSource, BuildContext buildContext) async {
  try {
    final uploadImage = await ImagePicker().pickImage(source: imageSource);
    if (uploadImage == null) return;
    final imageTemp = File(uploadImage.path);
    buildContext
        .read<PickerAvartarProfileBloc>()
        .add(PickerAvartarEvent(imageTemp));
  } on PlatformException catch (e) {
    print('Failed to pick image: $e');
  }
}
