import 'package:apptester/src/features/profile/bloc/delete_profile/delete_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login/presentation/login_Screen.dart';
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
    //set form sharepref
    final EditProfileBloc = BlocProvider<PutProfileBloc>(
        create: (context) => PutProfileBloc(ProfileRepositoryimpl()));
    final Delete_ProfileBloc = BlocProvider<DeleteProfileBloc>(
        create: (context) => DeleteProfileBloc(ProfileRepositoryimpl()));
    return MultiBlocProvider(
      providers: [EditProfileBloc, Delete_ProfileBloc],
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
              Container(
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                    }
                  },
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white, fontSize: 25),
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
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () async {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const LoginScreen()),
                    // );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
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
