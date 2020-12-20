


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
// import 'package:flutter_vlc_player/vlc_player.dart';
// import 'package:flutter_vlc_player/vlc_player_controller.dart';
import 'package:http/http.dart' as http;
import 'package:spyrobot/about.dart';
import 'package:spyrobot/mineAnimation.dart';
import 'package:spyrobot/mySnackBar.dart';
import 'clickOpacity.dart';
import 'package:velocity_x/velocity_x.dart';




// void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spy Robot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF282c34),
          scaffoldBackgroundColor: Color(0xFF282c34),

      ),
      home: SpyRobot(),
    );
  }
}


class SpyRobot extends StatefulWidget {
  @override
  _SpyRobotState createState() => _SpyRobotState();
}

class _SpyRobotState extends State<SpyRobot> {

  String  _streamUrl;

  VlcPlayerController _controller;

  @override
  void initState() {
    _controller = new VlcPlayerController(onInit: () {
      _controller.play();
    });
    _play();
    super.initState();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _play()  {
    setState(() {
      _streamUrl =  "http://192.168.18.152:8081";
    });
  }


  Future left(){
    return  http.get('http://192.168.18.152/left/');
  }

  Future right(){
    return  http.get('http://192.168.18.152/right/');
  }


  Future forward(){
    return  http.get('http://192.168.18.152/forward/');
  }



  Future backward(){
    return  http.get('http://192.168.18.152/backward/');
  }



  Future stop(){
    return  http.get('http://192.168.18.152/stoper/');
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(title: Text('Spy Robot', style:TextStyle( fontFamily: 'DancingScript', fontSize: 35)),),
        body: Builder(builder: (context){
          return   SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(
                      width: 20,
                    ),
                    TouchableOpacity(
                      onTap: () => exit(0),
                      activeOpacity: 0.7,
                      child: Icon(
                        Icons.west_outlined,
                        color: Colors.deepOrange,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Text('Spy Robot', style: TextStyle(fontSize: 40, color:Colors.deepOrange, fontFamily: 'DancingScript'),
                    ),

                    SizedBox(
                      width:50,
                    ),

                    TouchableOpacity(
                      onTap: () {
                        Navigator.push(context,
                        MyAnimation(widget: About(), selectAnimation: Curves.fastOutSlowIn, selectAlignment: Alignment.bottomCenter));
                      },

                      child: Icon(
                        Icons.help,
                        size: 30,
                        color: Colors.deepOrange,
                      ),
                    ),

                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child:
                  Card(
                    elevation: 10.0,
                    color:Colors.black12,
                    child:
                    new VlcPlayer(controller: _controller,  url: _streamUrl, placeholder: Container(), aspectRatio: 300/180,),

                  ),
                ),

                Container(
                  child:Padding(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(05.0),

                              child: TouchableOpacity(
                                onTap: () {
                                  left();
                                   Scaffold.of(context).showSnackBar(
                                    MySnackBar(text: 'left')
                                );
                                },
                                child: Container(
                                  color:Colors.black54,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            left: BorderSide(
                                                width: 5,
                                                color: Colors.deepOrange
                                            )
                                        )
                                    ),
                                    padding: EdgeInsets.all(20.0),
                                    child: Text(' Left', style:TextStyle(fontSize: 20, color:Colors.white, fontFamily:'DancingScript')),

                                  ),
                                ),

                              ),
                            ),


                            Container(

                              margin: EdgeInsets.only(top:15.0),
                              child:
                              Column(
                                children: [

                                  Padding(
                                    padding:EdgeInsets.all(5.0),
                                    child: TouchableOpacity(
                                      onTap: () {
                                        forward();
                                      Scaffold.of(context).showSnackBar(
                                          MySnackBar(text: 'Going Forward',)
                                      );
                                      },
                                      child: Container(
                                        color:Colors.black54,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  top: BorderSide(
                                                      width: 5,
                                                      color: Colors.deepOrange
                                                  )
                                              )
                                          ),
                                          padding: EdgeInsets.all(20.0),
                                          child: Text(' Forward  ', style:TextStyle(fontSize: 20, color:Colors.white, fontFamily:'DancingScript')),

                                        ),
                                      ),

                                    ),

                                  ),



                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: TouchableOpacity(
                                      onTap: () {
                                        backward();
                                        Scaffold.of(context).showSnackBar(
                                          MySnackBar(text: 'Going Backward',)
                                        );

                                        },

                                      child: Container(
                                        color:Colors.black54,
                                        child: Container(
                                          padding: EdgeInsets.all(20.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            border: Border(
                                              bottom:BorderSide(
                                                  color:Colors.deepOrange,
                                                  width: 5
                                              ),
                                            ),
                                          ),
                                          child: Text('Backward', style:TextStyle(fontSize: 20, color:Colors.white, fontFamily: 'DancingScript')),
                                        ),
                                      ),

                                    ),
                                  )
                                ],
                              ),

                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: TouchableOpacity(
                                onTap: () {
                                  right();
                                  Scaffold.of(context).showSnackBar(
                                      MySnackBar(text: 'Going Right',)
                                  );
                                },
                                child: Container(
                                  color:Colors.black54,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                width: 5,
                                                color: Colors.deepOrange
                                            )
                                        )
                                    ),
                                    padding: EdgeInsets.all(20.0),
                                    child: Text('Right', style:TextStyle(fontSize: 20, color:Colors.white, fontFamily:'DancingScript')),

                                  ),
                                ),

                              ),
                            )
                          ],

                        ),

                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child:TouchableOpacity(
                                    activeOpacity: 0.7,
                                    onTap: (){

                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                            left:BorderSide(
                                                width: 2,
                                                color: Colors.deepOrange
                                            ),
                                            right:BorderSide(
                                                width: 5,
                                                color: Colors.deepOrange
                                            )
                                        ),
                                      ),
                                      child: RaisedButton(
                                        onPressed: (){
                                          stop();
                                          Scaffold.of(context).showSnackBar(
                                              MySnackBar(text: 'Stop',)
                                          );
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),

                                        ),

                                        padding: EdgeInsets.all(20.0),
                                        color: Color(0xF200f21),

                                        child: Text('Stop', style:TextStyle(fontSize: 35, color: Colors.white, fontFamily: 'DancingScript')),
                                      ),
                                    ),
                                  ),


                                )
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
                ),

              ],
            ),
          );
        },)
    );
  }
}



