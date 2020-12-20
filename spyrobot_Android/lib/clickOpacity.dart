
import 'package:flutter/material.dart';

class TouchableOpacity extends StatefulWidget {

  TouchableOpacity(
      {@required this.child, this.onTap, this.activeOpacity= 0.2});


  final Widget child;
  final Function onTap;
  final double activeOpacity;


  @override
  _TouchableOpacityState createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  double _currentOpacity = 1.0;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => setState((){ _currentOpacity = widget.activeOpacity;}),
      onPointerUp: (_) => setState((){ _currentOpacity= 1.0;}),

      child: GestureDetector(
        onTap: widget.onTap,
        child: Opacity(
          opacity: _currentOpacity,
          child: widget.child
        ),
      ),

    );
  }
}
