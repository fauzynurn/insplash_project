import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class DidiPure extends StatelessWidget {
  final SequenceAnimation sequenceAnimation;

  DidiPure({this.sequenceAnimation});
  
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
          opacity: sequenceAnimation['opacity'].value,
          duration: Duration(milliseconds: 1000),
          child: Center(
            child: Container(
              child: Image.asset(
                'assets/images/refined_logo1x.png'
              ),
            ),
          ),
        );
  }
}