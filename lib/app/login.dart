import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();

  }

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
        fit: StackFit.expand,
        children: <Widget>[Container(

            height: 500,
            child: Image.asset('img/head_home.png')
        ),]));
  }
}

