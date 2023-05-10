import 'package:apptester/src/features/login/presentation/login_Layout.dart';
import 'package:apptester/src/utils/user_secure__storage.dart';
import 'package:apptester/src/utils/user_shared_preferences.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

import '../home/presentations/home_Screen.dart';
import '../login/presentation/login_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    //tokenpref = UserSharedPreferences.getToken() ?? '';
    //listexpref = UserSharedPreferences.getLists() ?? [];
    //dateexpref = UserSharedPreferences.getdate();

    init();
    super.initState();
  }

  Future init() async {
    final token = await UserSecureStorage.getToken();
    // final dateex = await UserSecureStorage.getDates();
    // final listex = await UserSecureStorage.getLists();

    // setState(() {
    //   // this.listex = listex!;
    //   // this.dateex = dateex;
    //   this.token = token!;
    // });
  }

  @override
  Widget build(BuildContext context) {
    bool isLogin = token != null;

    return isLogin ? const HomeScreen() : const LoginScreen();
  }
}
