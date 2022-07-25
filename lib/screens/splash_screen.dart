import 'package:flutter/material.dart';
import 'package:login_register/screens/sign_in_screen.dart';
import 'package:login_register/screens/sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 350,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/love.png'),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 100),
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
                      child: Text('Sign In'),
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xFFff7b00),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignUpScreen()));
                      },
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Join Now by Sign In Or Sign Out',
                style: TextStyle(fontSize: 17, color: Colors.amber),
              ),
              SizedBox(height: 25),
              Image.asset('assets/images/unnamed.png')
            ],
          ),
        ),
      ),
    );
  }
}