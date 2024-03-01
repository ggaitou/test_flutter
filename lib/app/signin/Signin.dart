import 'package:flutter/material.dart';

import '../signup/Signup.dart';
import '../signup/test.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Text(
          "Authentification",
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
        backgroundColor: Color(0xFF5B4CBD),
      ),
      body: ListView(
        padding: const EdgeInsets.all(40),
        children: <Widget>[

          CircleAvatar(
            radius: 56,
            backgroundColor: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8), // Border radius
              child: ClipOval(child: Image.asset('img/giftbox.png')),
            ),
          ),


          const SizedBox(height: 20,),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.mail_lock),
              hintText: 'Veuillez saisir Adresse Email?',
              labelText: 'Adresse Email *',
            ),
          ),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.password),
              hintText: 'Veuillez saisir Votre Mot de passe?',
              labelText: 'Password *',
            ),
          ),
          const SizedBox(height: 20,),


          Center(
              child:ElevatedButton(

                  onPressed: ()  {Navigator.push(context,MaterialPageRoute(builder: (context) => Signin()),);},
                  child: const Text('Connexion',style: TextStyle(color: Colors.white) ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF5B4CBD), fixedSize: const Size(200, 50)// Background color
                  )
              )),
          const SizedBox(height: 20,),
          Center(
              child:ElevatedButton(
              onPressed: ()  {Navigator.push(context,MaterialPageRoute(builder: (context) => Signup()),);},
                //onPressed: ()  {Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()),);},
             child: const Text('S\'inscrire', ),
          ),

      ),
    ]
    )
    );


  }
}
