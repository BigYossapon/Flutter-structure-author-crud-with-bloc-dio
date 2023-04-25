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
            Container(
              height: 5,
            ),
            OutlinedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print('Form Complete');
                  _formKey.currentState!.save();
                }
              },
              child: const Text('register'),
            ),
            Container(
              height: 5,
            ),
            TextButton(
              child: const Text(
                "back",
                style: TextStyle(fontSize: 10),
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
