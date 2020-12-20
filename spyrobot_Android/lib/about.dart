
import 'package:flutter/material.dart';
import 'package:spyrobot/aboutApp.dart';
import 'package:spyrobot/clickOpacity.dart';
import 'package:spyrobot/mineAnimation.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text('Spy Robot', style: TextStyle(fontFamily: 'DancingScript', fontSize: 36, color: Colors.deepOrange),),
        ),
        backgroundColor: Color(0xFF282c34),
        leading: Padding(
          padding: EdgeInsets.all(15),
          child: TouchableOpacity(
            onTap: (){
             Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              color: Colors.deepOrangeAccent,
              size: 36,
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF282c34),
      body: Column(
         children: [
           SizedBox(
             height: 80,
           ),

          TouchableOpacity(
            onTap: (){

            },
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),

                Icon(
                  Icons.stop,
                  size: 35,
                  color: Colors.deepOrangeAccent,

                ),


                SizedBox(
                  width: 30,
                ),

                Text('Contact Me',
                  style:TextStyle(color:Colors.white,
                    fontSize: 35,
                    letterSpacing: 3,
                    fontFamily: 'DancingScript',
                  ),
                )

              ],
            ),
          ),

           SizedBox(
             height: 50,
           ),

           TouchableOpacity(
             onTap: () {

               Navigator.push(context,
                   MyAnimation(widget: AboutApp(),
                       selectAlignment: Alignment.topCenter,
                   selectAnimation: Curves.elasticOut));
             },
             child: Row(
               children: [

                 SizedBox(
                   width: 20,
                 ),

                 Icon(
                   Icons.arrow_forward_ios_rounded,
                   size: 35,
                   color: Colors.deepOrangeAccent,
                 ),


                 SizedBox(
                   width: 50,
                 ),

                 Text('About App',
                   style:TextStyle(color:Colors.white,
                     fontSize: 35,
                     letterSpacing: 3,
                     fontFamily: 'DancingScript',
                   ),
                 )

               ],
             ),
           ),

        ],

      ),

      persistentFooterButtons: [

        Align(
            heightFactor: 1,
            widthFactor: 10,
            alignment: Alignment.center,
            child: Text('© Muhmmad Asim ', style: TextStyle(color: Colors.white, fontFamily: 'Times New Roman'),)),
      ],


    );
  }
}

