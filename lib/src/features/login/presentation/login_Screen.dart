import 'package:apptester/src/features/register/presentation/register_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/user_secure__storage.dart';
import '../../home/presentations/home_Screen.dart';
import '../bloc/post_login/post_login_bloc.dart';
import '../data/models/request_login_model/request_login_model.dart';
import '../data/repositories/login_repositoryImpl.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();
  late RequestLoginModel requestLoginModel;

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
    final LoginBloc = BlocProvider<PostLoginBloc>(
        create: (context) => PostLoginBloc(LoginRepositoryimpl()));

    return MultiBlocProvider(
      providers: [LoginBloc],
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
              BlocListener<PostLoginBloc, PostLoginState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is PostLoginErrorState) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Username or Password invalid!"),
                    ));
                  }
                  if (state is PostLoginSuccessState) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Login Success!"),
                    ));
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  }
                  if (state is PostLoginLoadingState) {
                    _fetchData(context);
                  }
                },
                child: BlocConsumer<PostLoginBloc, PostLoginState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    if (state is PostLoginErrorState) {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Username or Password invalid!"),
                      ));
                    }
                    if (state is PostLoginSuccessState) {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Login Success!"),
                      ));
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    }
                    if (state is PostLoginLoadingState) {
                      _fetchData(context);
                    }
                  },
                  builder: (context, state) {
                    if (state is PostLoginErrorState) {}
                    if (state is PostLoginSuccessState) {}
                    if (state is PostLoginLoadingState) {}
                    return Container(
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

                            requestLoginModel.username = username.text;
                            requestLoginModel.password = password.text;

                            context
                                .read<PostLoginBloc>()
                                .add(LoginEvent(requestLoginModel));
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    );
                  },
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
      ),
    );
  }
}

void _fetchData(BuildContext context) async {
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
