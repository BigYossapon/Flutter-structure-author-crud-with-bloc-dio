import 'package:apptester/src/features/login/presentation/login_Screen.dart';
import 'package:apptester/src/features/register/data/models/request_register_model.dart/request_register_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/presentations/home_Screen.dart';
import '../bloc/post_register/post_register_bloc.dart';
import '../data/repositories/register_repositoryImpl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final address = TextEditingController();
  final country = TextEditingController();
  late RequestRegisterModel requestRegisterModel;
  //final avartar = TextEditingController();

  @override
  void dispose() {
    username.dispose(); // ยกเลิกการใช้งานที่เกี่ยวข้องทั้งหมดถ้ามี
    password.dispose();
    email.dispose();
    address.dispose();
    country.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final RegisterBloc = BlocProvider<PostRegisterBloc>(
        create: (context) => PostRegisterBloc(RegisterRepositoryimpl()));
    return MultiBlocProvider(
      providers: [RegisterBloc],
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
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
              BlocListener<PostRegisterBloc, PostRegisterState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is PostRegisterLoadingState) {
                    _Loading(context);
                  }
                  if (state is PostRegisterSuccessState) {
                    Navigator.of(context).pop();
                    final snackBar = SnackBar(content: Text(state.status));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  }
                  if (state is PostRegisterErrorState) {
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

                        // requestRegisterModel.username = username.text;
                        // requestRegisterModel.password = password.text;
                        // requestRegisterModel.address = address.text;
                        // requestRegisterModel.email = email.text;
                        // requestRegisterModel.country = country.text;

                        // context
                        //     .read<PostRegisterBloc>()
                        //     .add(RegisterEvent(requestRegisterModel));

                        _dialogRegister(
                            context,
                            username.text,
                            password.text,
                            address.text,
                            email.text,
                            country.text,
                            requestRegisterModel);
                      }
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              Container(
                height: 5,
              ),
              TextButton(
                onPressed: () {
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                  Navigator.pop(context);
                },
                child: const Text(
                  'Back',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
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

void _dialogRegister(
    BuildContext context,
    String username,
    String password,
    String address,
    String email,
    String country,
    RequestRegisterModel requestRegisterModel) async {
  showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Register'),
            content: const Text('Comfirm to Register?'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    requestRegisterModel.username = username;
                    requestRegisterModel.password = password;
                    requestRegisterModel.address = address;
                    requestRegisterModel.email = email;
                    requestRegisterModel.country = country;
                    Navigator.pop(context);
                    context
                        .read<PostRegisterBloc>()
                        .add(RegisterEvent(requestRegisterModel));
                  },
                  child: const Text('Confirm'))
            ],
          ));
}
