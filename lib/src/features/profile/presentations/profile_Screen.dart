import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../login/presentation/login_Screen.dart';

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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 5.0,
          ),
          Container(),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('Form Complete');
                _formKey.currentState!.save();
              }
            },
            child: const Text('select image'),
          ),
          const SizedBox(
            height: 5.0,
          ),
          TextFormField(
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
          TextFormField(
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
          TextFormField(
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
          TextFormField(
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
          TextFormField(
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
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('Form Complete');
                _formKey.currentState!.save();
              }
            },
            child: const Text('edit'),
          ),
          Container(
            height: 5,
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              // Navigator.of(context).pushReplacement(
              //     MaterialPageRoute(builder: (context) => LoginScreen()));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text('logout'),
          ),
        ],
      ),
    );
  }
}
