import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class Circle extends StatelessWidget {
  final SequenceAnimation sequenceAnimation;

  Circle({this.sequenceAnimation});

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: sequenceAnimation["opacity"].value,
        child: Container(
          width: 200.0,
          height: 200.0,
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50)),
        ));
  }
}
