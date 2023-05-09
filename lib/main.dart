import 'package:apptester/src/features/home/presentations/home_Screen.dart';
import 'package:apptester/src/features/login/presentation/login_Screen.dart';
import 'package:apptester/src/features/profile/presentations/profile_Screen.dart';
import 'package:apptester/src/features/splash/splash_Screen.dart';
import 'package:apptester/src/utils/app_bloc_observe.dart';
import 'package:apptester/src/utils/user_secure__storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      //await configureDependencies();
      runApp(const MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
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
