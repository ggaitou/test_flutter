import 'package:flutter/material.dart';
import 'package:test_flutter/app/splash/Splash.dart';
import 'package:test_flutter/app/login.dart';

import 'app/signup/Signup.dart';
void main() {
  runApp(const HelloWorldApp());
}

class HelloWorldApp extends StatelessWidget {
  const HelloWorldApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

        //home: Signup(),
      home:   Splash(),

    );
  }


}