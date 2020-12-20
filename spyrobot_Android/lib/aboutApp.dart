import 'package:flutter/material.dart';
import 'package:spyrobot/clickOpacity.dart';

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF282c34),
        child: Padding(
          padding:  EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              TouchableOpacity(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  size: 50,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              SizedBox(
                height: 40,
              ),

              Text('Surveillance Robot', style: TextStyle(fontSize: 30, color: Colors.white, fontFamily: 'Times New Roman'),),

              SizedBox(
                height: 40,
              ),


              Text('It\'s  an app for surveillance robot \n '
                  ' which will control the robot from this app', style: TextStyle(fontSize: 25, color: Colors.white70, fontFamily: 'Helvetica Neue'),),


            ],
          ),
        ),
      ),
    );
  }
}
