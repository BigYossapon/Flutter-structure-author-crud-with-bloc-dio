import 'package:apptester/src/features/register/presentation/register_Screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/user_secure__storage.dart';
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

  bool isLogin = false;

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

  Future init() async {
    final token = await UserSecureStorage.getToken();
    var isLoggedIn = (token == null) ? false : token.isNotEmpty;
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
                        builder: (context) => const HomeScreen()));
                  }
                },
                child: const Text(
                  'Login',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()),
                );
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
