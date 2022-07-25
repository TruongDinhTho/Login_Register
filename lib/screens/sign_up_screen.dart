import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register/register/bloc/register_bloc.dart';
import 'package:login_register/register/bloc/register_state.dart';
import 'package:login_register/screens/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterInitial) {
          return print(Center(child: Text('Waiting')));
        }
        if (state is RegisterLoading) {
          return print(Center(child: CircularProgressIndicator()));
        }
        if (state is RegisterSucced) {
          return print(Container());
        }
        if (state is RegisterFailed) {
          return print(Center(child: Text(state.message)));
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Sign Up', style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Text(
                      'Fill in the application form',
                      style: TextStyle(color: Color(0xFFbc6c25), fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      obscureText: false,
                      textInputType: TextInputType.emailAddress,
                      textEditingController: emailController,
                      hintText: 'Email',
                      color: Color(0xFFdeaaff),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      obscureText: true,
                      textInputType: TextInputType.visiblePassword,
                      textEditingController: passwordController,
                      hintText: 'Password',
                      color: Color(0xFFdeaaff),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0XFFff5c8a),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignInScreen()));
                      },
                      child: Text('Create an account'),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?',style: TextStyle(fontSize: 17, color: Colors.blueGrey)),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignInScreen()));
                            },
                            child: Text('Login',style: TextStyle(fontSize: 17, color: Colors.green)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final Color color;
  final TextInputType textInputType;
  final bool obscureText;
  CustomTextField({
    required this.hintText,
    required this.textEditingController,
    required this.color,
    required this.textInputType,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
      ),
      padding: EdgeInsets.all(10.0),
      height: 90,
      child: TextField(
        obscureText: obscureText,
        controller: textEditingController,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          errorStyle: TextStyle(color: Colors.white),
          filled: true,
        ),
      ),
    );
  }
}
