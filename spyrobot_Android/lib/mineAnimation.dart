
import 'package:flutter/material.dart';

class MyAnimation extends PageRouteBuilder{

  MyAnimation({Widget widget, Curve selectAnimation, Alignment selectAlignment}):super(
        transitionDuration: Duration(milliseconds: 1000),
        transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child ){
          animation = CurvedAnimation(parent: animation, curve: selectAnimation);
          return ScaleTransition(
            scale: animation,
            alignment: selectAlignment,
            child: child,
          );
        },

        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation ){
          return widget;
        }

    );
}