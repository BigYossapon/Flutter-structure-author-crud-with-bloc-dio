import 'package:apptester/src/features/login/presentation/login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
    return Scaffold(
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
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
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
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 25),
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
    );
  }
}
