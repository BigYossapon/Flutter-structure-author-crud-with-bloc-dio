import 'package:apptester/src/features/register/presentation/register_Screen.dart';
import 'package:flutter/material.dart';

import '../../home/presentations/home_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    username.dispose(); // ยกเลิกการใช้งานที่เกี่ยวข้องทั้งหมดถ้ามี
    password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
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
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blue,
                primary: Colors.white,
                //<-- SEE HERE
              ),
              child: const Text(
                "sign in",
                style: TextStyle(fontSize: 25),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  print('Form Complete');
                  _formKey.currentState!.save();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const HomeScreen()),
                  // );
                }
              },
            ),
            Container(
              height: 5,
            ),
            TextButton(
              child: const Text(
                "sign up",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
