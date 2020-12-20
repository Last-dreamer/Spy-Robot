

import 'package:flutter/material.dart';

class MySnackBar extends SnackBar{

  MySnackBar({String text}):super(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(text, style: TextStyle(fontFamily: 'DancingScript', fontSize: 25),),

      ],
    ),
    backgroundColor: Colors.deepOrangeAccent,
    duration: Duration(milliseconds: 100),
  );
}