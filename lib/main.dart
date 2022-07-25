import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register/authentication_bloc/bloc/authentication_state.dart';
import 'package:login_register/login/bloc/login_bloc.dart';
import 'package:login_register/register/bloc/register_bloc.dart';
import 'package:login_register/screens/home_screen.dart';
import 'package:login_register/screens/splash_screen.dart';
import 'authentication_bloc/bloc/authentication_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is UnAuthenticateState) {
              return SplashScreen();
            } else if (state is AuthenticateState) {
              return HomeScreen();
            }

            return SplashScreen();
          },
        ),
      ),
    );
  }
}
