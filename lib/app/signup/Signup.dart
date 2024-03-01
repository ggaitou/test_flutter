import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../signin/Signin.dart';

Future<Utilisateur> createUtilisateur(String nom_prenom) async {
  final response = await http.post(
    Uri.parse('https://dummyjson.com/users/add'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'firstName': nom_prenom,


    }),
  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Utilisateur.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create user.');
  }
}

class Utilisateur {
  final int id;
  final String nom_prenom;


  const Utilisateur({required this.id, required this.nom_prenom});

  factory Utilisateur.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'id': int id,
      'nom_prenom': String nom_prenom,

      } =>
          Utilisateur(
            id: id,
            nom_prenom: nom_prenom,


          ),
      _ => throw const FormatException('Failed to load users.'),
    };
  }
}



class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final TextEditingController nom_controller = TextEditingController();
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController telephone_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  Future<Utilisateur>? _futureUtilisateur;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Inscription",
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
          backgroundColor: Color(0xFF5B4CBD),
      ),
      body: ListView(
        padding: const EdgeInsets.all(25),
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
            controller: nom_controller,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Veuillez saisir votre nom et prenom?',
              labelText: 'Nom et Prénoms *',
            ),
          ),
          const SizedBox(height: 20,),
          TextFormField(
            controller: email_controller,
            decoration: const InputDecoration(
              icon: Icon(Icons.mail_lock),
              hintText: 'Veuillez saisir Adresse Email?',
              labelText: 'Adresse Email *',
            ),
          ),
          const SizedBox(height: 20,),
          TextFormField(
            controller: telephone_controller,
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              hintText: 'Veuillez saisir Numéro de téléphone?',
              labelText: 'Numéro de téléphone *',
            ),
          ),
          const SizedBox(height: 20,),
          TextFormField(
            controller: password_controller,
            obscureText: true,
            decoration: const InputDecoration(
              icon: Icon(Icons.password_outlined),
              hintText: 'Veuillez saisir Mot de passe',
              labelText: 'Mot de passe *',
            ),
          ),
          const SizedBox(height: 20,),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              icon: Icon(Icons.password_outlined),
              hintText: 'Veuillez confirmer Mot de passe?',
              labelText: 'Confirmer Mot de passe *',
            ),
          ),
          const SizedBox(height: 20,),

          Center(
            child:ElevatedButton(
                onPressed: () {
                  setState(() {
                    _futureUtilisateur = createUtilisateur(nom_controller.text);
                  });
                },
                child: const Text('Create Data',style: TextStyle(color: Colors.white)),

              //onPressed: ()  {Navigator.push(context,MaterialPageRoute(builder: (context) => Signup()),);},
              //child: const Text('Enrégistrer',style: TextStyle(color: Colors.white) ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF5B4CBD), fixedSize: const Size(200, 50)// Background color
                )
            )),
          const SizedBox(height: 20,)
          ,Center(child: TextButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Signin()),);}, child: Text('J\'ai déjà un compte', )),),
        ],
      ),
    );
  }

  FutureBuilder<Utilisateur> buildFutureBuilder() {
    return FutureBuilder<Utilisateur>(
      future: _futureUtilisateur,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.nom_prenom);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
