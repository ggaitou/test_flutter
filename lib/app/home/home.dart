import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../signin/Signin.dart';
import '../signup/Signup.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final List<String> imgList = [

  'img/IMAGE1.jpg',
  'img/IMAGE2.jpg',
  'img/IMAGE3.jpg',
  'img/IMAGE4.jpg',
  'img/IMAGE5.jpg',
  'img/IMAGE6.jpg',
  'img/IMAGE7.jpg',
  'img/IMAGE8.jpg',





];
/*
final List<Image> imgList = [
  Image.asset('img/head_home.png'),


  ];*/
final List<Widget> imageSliders = imgList
    .map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            //Image.network(item, fit: BoxFit.cover, width: 1000.0),
            Image.asset(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  'No. ${imgList.indexOf(item)} image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )),
  ),
))
    .toList();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Row(children: [Text('Home',style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),),
          const SizedBox(width: 210,),
          IconButton(
            iconSize: 25,
            icon: Icon(Icons.shopping_cart,color: Colors.white, ),
            onPressed: () {
              // ...
            },
          ),
            const SizedBox(width: 14,),
          IconButton(
            iconSize: 25,
            icon: Icon(Icons.person,color: Colors.white, ),
            onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Signin()),);}
            ,)],),backgroundColor: Color(0xFF5B4CBD),),


      body:ListView(
        padding: const EdgeInsets.all(40),
        children: <Widget>[
    Container(
    child: CarouselSlider(
    options: CarouselOptions(
    aspectRatio: 2.0,
    enlargeCenterPage: true,
    enableInfiniteScroll: false,
    initialPage: 2,
    autoPlay: true,
    ),
    items: imageSliders,
    )),
          const SizedBox(height: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(child: _SampleCard(cardName: 'Steak au champignon',ImgName: 'img/IMAGE12.jpg')),
              Card(child: _SampleCard(cardName: 'Beignet viande',ImgName:'img/IMAGE10.jpg')),
              Card(child: _SampleCard(cardName: 'Brochette de viande',ImgName:'img/IMAGE11.jpg',)),
            ],
          ),

        ]


    ));
  }
}


class _SampleCard extends StatelessWidget {
  const _SampleCard({ required this.cardName, required this.ImgName });
  final String cardName;
  final String ImgName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 100,
      child: Row(children: <Widget>[
                    Image.asset(ImgName),
        const SizedBox(width: 15,),
        Center(
          child:ElevatedButton(
            onPressed: () {
              // Navigate back to first route when tapped.
            },
            child:  Text(cardName),
          ),

        )]),
    );
  }
}
