import 'package:flutter/material.dart';

import '../signin/Signin.dart';
import '../signup/Signup.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Détails",
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
                  child: ClipOval(child: Image.asset('img/IMAGE12.jpg')),
                ),
              ),


              const SizedBox(height: 20,),
            Center( child: Text('Steak au champignon',style: TextStyle(color: Color(0xFF5B4CBD),fontWeight: FontWeight.bold))),

              const SizedBox(height: 20,),
              Center( child: Text('Steaks de bœuf (de votre choix), épaisseur selon votre préférence Champignons (par exemple, des champignons de Paris), tranchésOignons, émincésAil, hachéSauce soja, pour la marinade Sel et poivre, pour assais Huile dolive (ou autre huile végétale), pour la cuisson',)),
              const SizedBox(height: 20,),
              Center(
                  child:ElevatedButton(

                      onPressed: ()  {Navigator.push(context,MaterialPageRoute(builder: (context) => Signin()),);},
                      child: const Text('Commander',style: TextStyle(color: Colors.white,) ),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF5B4CBD), fixedSize: const Size(200, 50)// Background color
                      )
                  )),
              const SizedBox(height: 20,),
        Center( child: Text('1 500 XAF',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold))),
            ]
        )
    );

  }
}
