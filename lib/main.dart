import 'package:apptester/src/features/home/presentations/home_Screen.dart';
import 'package:apptester/src/features/login/presentation/login_Screen.dart';
import 'package:apptester/src/features/profile/presentations/profile_Screen.dart';
import 'package:apptester/src/features/splash/splash_Screen.dart';
import 'package:apptester/src/utils/user_secure__storage.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test Authen and crud',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
