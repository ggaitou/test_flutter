//import 'package:flutter/cupertino.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_flutter/app/signin/Signin.dart';
import 'package:test_flutter/app/signup/Signup.dart';

import '../home/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override


  // ignore: must_call_super
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        //Text("")
            //() => Navigator.push(context, MaterialPageRoute(builder: (_) => Signup()))
            //() => Navigator.push(context, MaterialPageRoute(builder: (_) => Signin()))
              () => Navigator.push(context, MaterialPageRoute(builder: (_) => Home()))
    );
  }
  Widget build(BuildContext context) {
   return Scaffold(

      body: Column(children: [Image.asset('img/head_home.png')],)
    );

  }
}
