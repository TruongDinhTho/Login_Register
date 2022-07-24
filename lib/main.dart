import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register/repository/user_repositories.dart';
import 'package:login_register/screens/home_screen.dart';
import 'package:login_register/screens/splash_screen.dart';

import 'authentication_bloc/bloc/authentication_bloc.dart';
import 'authentication_bloc/bloc/authentication_state.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late UserRepository userRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if(state is AuthenticationFailure){
          return SplashScreen();
        }else if(state is AuthenticationState){
          return HomeScreen();
        }
        return Container();
      },

    );
  }
}
