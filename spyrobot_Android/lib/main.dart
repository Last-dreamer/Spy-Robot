
import 'package:flutter/material.dart';
import 'package:spyrobot/MainPage.dart';
import 'package:spyrobot/mineAnimation.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MyApp(),
    )
  );
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 3),
        () {
        Navigator.push(context, MyAnimation(widget: Main(), selectAnimation: Curves.bounceIn, selectAlignment: Alignment.topCenter));
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(
            height: 20,
          ),
          Text('Surveillance Robot', style:TextStyle(fontSize: 38, color:Colors.deepOrange, fontFamily: 'DancingScript')),
          SizedBox(
            height: 25,
          ),
          FlutterLogo(
            size: 400,
          ),

          Padding(
            padding: EdgeInsets.all(40.0),
            child:LinearProgressIndicator(

              backgroundColor: Colors.deepOrangeAccent,
              minHeight: 8,
            ),
          )


        ],
      ),
    );
  }
}
