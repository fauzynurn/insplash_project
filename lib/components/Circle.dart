import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class Circle extends StatelessWidget {
final double width;
final double height;
final BorderRadiusGeometry radius;
final Color color;

Circle({this.width,this.height,this.radius,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: this.width,
          height: this.height,
          decoration: new BoxDecoration(
              color: this.color,
              borderRadius: this.radius),
        );
  }
}
