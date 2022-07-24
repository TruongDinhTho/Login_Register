import 'package:flutter/material.dart';

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
                height: 400,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/love.png'),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 120.0),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xFFff7b00),
                        )
                      ),
                      onPressed: (){}, 
                      child: Text('Sign In'),
                    ),
                    SizedBox(height: 15.0),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xFFff7b00),
                        ),
                      ),
                      onPressed: (){}, 
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0,),
              Text('Join Now by sign in or sign up',
                style: TextStyle(fontSize: 20,color: Colors.amber),
              ),
              SizedBox(height: 25.0,),
              Image.asset('assets/images/unnamed.png')
            ],
          ),
        ),
      ),
    );
  }
}