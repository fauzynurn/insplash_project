import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:flutter_svg/svg.dart';

class DidiPure extends StatelessWidget {
  final SequenceAnimation sequenceAnimation;

  DidiPure({this.sequenceAnimation});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, sequenceAnimation['goUp'].value),
      child: Container(
          color: Colors.black,
          child: Center(
              child: Text('Insplash',
                  style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontFamily: 'SecondaSoft-Black',
                      fontWeight: FontWeight.w400)))),
    );
  }
}
